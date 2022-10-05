#include "Halloween-Laser.h"

PicoStepper devices[2];
int positions[2];

PicoStepper YAxis;
PicoStepper XAxis;

volatile uint8_t dma_chan;
volatile PIO pio;
volatile uint8_t sm;

volatile bool xfrReceived = false;
volatile uint8_t buffer_id = 0;

uint32_t *projector_buffer;
uint32_t *buffer_one;
uint32_t *buffer_two;

uint32_t config_buffer[FLASH_PAGE_SIZE/sizeof(uint32_t)];
uint32_t *config_saved = (uint32_t *)(STORAGE_OFFSET + XIP_BASE);
bool use_config = false;

void init_buffers(){
    projector_buffer = malloc(config_buffer[TRANSFER_SIZE_CONFIG] * sizeof(uint32_t));
    buffer_one = malloc(config_buffer[TRANSFER_SIZE_CONFIG] * sizeof(uint32_t));
    buffer_two = malloc(config_buffer[TRANSFER_SIZE_CONFIG] * sizeof(uint32_t));
}

void free_buffers(){
    free(projector_buffer);
    free(buffer_one);
    free(buffer_two);
}

void init_config(){
    if(config_saved[LOAD_CONFIG] != true){
        printf("Loading defaults\n");
        load_default_config();
        //write_config();
    }

    //load_config();

    for(uint8_t idx = 0; idx < 8; idx++){
        printf("Config at %d: %X\n", idx, config_buffer[idx]);
    }
}

void load_default_config(){
    config_buffer[LOAD_CONFIG] = true;
    config_buffer[ACCELERATION_CONFIG] = ACCELERATION;
    config_buffer[TRANSFER_SIZE_CONFIG] = TRANSFER_SIZE;
    config_buffer[MAX_SPEED_CONFIG] = MAXSPEED;
    config_buffer[MIN_SPEED_CONFIG] = MINSPEED;
    config_buffer[X_HOME_CONFIG] = X_HOME_POS;
    config_buffer[Y_HOME_CONFIG] = Y_HOME_POS;
    config_buffer[PROJECTOR_ID_CONFIG] = PROJECTOR_ID;
}

void write_config(){
    uint32_t ints = save_and_disable_interrupts();

    flash_range_erase(STORAGE_OFFSET, FLASH_SECTOR_SIZE);
    flash_range_program(STORAGE_OFFSET, (uint8_t *)config_buffer, FLASH_PAGE_SIZE);

    restore_interrupts (ints);

    watchdog_reboot (0, SRAM_END, 10);

    sleep_ms(5000);
}

void load_config(){
    for(uint8_t idx; idx <= FLASH_PAGE_SIZE/sizeof(uint32_t); idx++){
        config_buffer[idx] = config_saved[idx];
    }
}

bool checksum(uint message){

    uint sum = message ^ (message >> 1);
    sum = sum ^ (sum >> 2);
    sum = sum ^ (sum >> 4);
    sum = sum ^ (sum >> 8);
    sum = sum ^ (sum >> 16);
    
    sum = sum & 1;

    return sum;
}

uint16_t retrieve(uint32_t frame, uint32_t mask, uint32_t shift){
    return (frame & mask) >> shift;
}

void draw(){

    if(DEBUG) sleep_ms(2000);

    if(retrieve(projector_buffer[0], ENABLE_MASK, ENABLE_SHIFT)){
        gpio_put(ENABLE, true == ENABLE_LOGIC);
    } else {
        gpio_put(ENABLE, false == ENABLE_LOGIC);
        return;
    }
    if(retrieve(projector_buffer[0], HOME_MASK, HOME_SHIFT)){
        if(DEBUG) printf("Homing\n");
        home_steppers();
        if(DEBUG) printf("Homing complete\n");
        set_stepper_values();
        sleep_ms(500);
    }

    uint8_t pointCount = retrieve(projector_buffer[0], COUNT_MASK, COUNT_SHIFT);
    xfrReceived = false;

    if(DEBUG){
        printf("Point count: %d\n", pointCount);
        printf("xfrReceived: %d\n", xfrReceived);
    }

    while(!xfrReceived){

        for(uint8_t idx = 0; idx < pointCount; idx++){

            bool sum = checksum(projector_buffer[idx+1]);

            uint16_t xPos = retrieve(projector_buffer[idx+1], X_MASK, X_SHIFT);
            uint16_t yPos = retrieve(projector_buffer[idx+1], Y_MASK, Y_SHIFT);
            uint8_t red = retrieve(projector_buffer[idx+1], RED_MASK, RED_SHIFT);
            uint8_t green = retrieve(projector_buffer[idx+1], GREEN_MASK, GREEN_SHIFT);
            uint8_t blue = retrieve(projector_buffer[idx+1], BLUE_MASK, BLUE_SHIFT);

            if(sum){
                lasers_off();
                if(DEBUG) printf("Skipping point\n");
                continue;
            }

            set_red_pwm(red);
            set_green_pwm(green);
            set_blue_pwm(blue);

            positions[0] = xPos > MAX_X ? MAX_X : xPos;
            positions[1] = yPos > MAX_Y ? MAX_Y : yPos;

            picostepper_move_to_positions(devices, positions, 2);

            if(DEBUG) printf("R: %X\nG: %X\nB: %X\nX: %X\nY: %X\n", red, green, blue, xPos, yPos);

            if(DEBUG) sleep_ms(3000);

        }
    }

    lasers_off();
    xfrReceived = false;

}

void lasers_off(){
    set_red_pwm(0);
    set_green_pwm(0);
    set_blue_pwm(0);
}

void set_red_pwm(uint8_t pwm){
    pwm_set_chan_level(RED_SLICE, RED_CHANNEL, PWM_DEPTH - ((pwm % COLOUR_DEPTH) * COLOUR_MULTIPLIER));
}

void set_green_pwm(uint8_t pwm){
    pwm_set_chan_level(GREEN_SLICE, GREEN_CHANNEL, PWM_DEPTH - ((pwm % COLOUR_DEPTH) * COLOUR_MULTIPLIER));
}

void set_blue_pwm(uint8_t pwm){
    pwm_set_chan_level(BLUE_SLICE, BLUE_CHANNEL, PWM_DEPTH - ((pwm % COLOUR_DEPTH) * COLOUR_MULTIPLIER));
}

void homing_sequence(PicoStepper device){
    if(picostepper_get_async_enabled(device)) picostepper_move_async(device, 100, &homing_sequence);
}

void slow_home(PicoStepper device){
    if(picostepper_get_async_enabled(device)) picostepper_move_async(device, 10, &homing_sequence);
}

void init_gpio(){
    gpio_init(HOME_X);
    gpio_init(HOME_Y);
    gpio_init(RED);
    gpio_init(GREEN);
    gpio_init(BLUE);
    gpio_init(ENABLE);

    gpio_set_dir(HOME_X, false);
    gpio_set_dir(HOME_Y, false);
    gpio_set_dir(ENABLE, true);

    gpio_set_function(RED, GPIO_FUNC_PWM);
    gpio_set_function(GREEN, GPIO_FUNC_PWM);
    gpio_set_function(BLUE, GPIO_FUNC_PWM);

    gpio_pull_up(HOME_X);
    gpio_pull_up(HOME_Y);

    gpio_pull_down(CLOCK);
    gpio_pull_down(DATA);

    gpio_put(ENABLE, true == ENABLE_LOGIC);
}

void init_steppers(){

    YAxis = picostepper_pindef_init(DIR_Y, STEP_Y, TwoWireDriver);
    XAxis = picostepper_pindef_init(DIR_X, STEP_X, TwoWireDriver);

    devices[0] = XAxis;
    devices[1] = YAxis;

}

void set_stepper_values(){
    picostepper_set_async_enabled(XAxis, true);
    picostepper_set_max_speed(XAxis, config_buffer[MAX_SPEED_CONFIG]);
    picostepper_set_min_speed(XAxis, config_buffer[MIN_SPEED_CONFIG]);

    picostepper_set_async_enabled(YAxis, true);
    picostepper_set_max_speed(YAxis, config_buffer[MAX_SPEED_CONFIG]);
    picostepper_set_min_speed(YAxis, config_buffer[MIN_SPEED_CONFIG]);

    picostepper_set_acceleration(XAxis, config_buffer[ACCELERATION_CONFIG]);
    picostepper_set_acceleration(YAxis, config_buffer[ACCELERATION_CONFIG]);
}

void home_steppers(){
    picostepper_set_async_speed(XAxis, HOMINGSPEED);
    picostepper_set_acceleration(XAxis, 0);
    picostepper_set_async_enabled(XAxis, true);

    picostepper_set_async_direction(XAxis, true);

    picostepper_move_async(XAxis, 100, &homing_sequence);
    
    while(!gpio_get(HOME_X));

    picostepper_set_async_enabled(XAxis, false);

    sleep_ms(500);

    picostepper_set_async_enabled(XAxis, true);

    picostepper_set_async_direction(XAxis, false);

    picostepper_move_async(XAxis, 100, &homing_sequence);
    
    while(gpio_get(HOME_X));

    picostepper_set_async_enabled(XAxis, false);

    sleep_ms(500);

    picostepper_set_async_enabled(XAxis, true);
    picostepper_move_blocking(XAxis, 500, true, picostepper_convert_speed_to_delay(HOMINGSPEED), 0);

    picostepper_set_async_direction(XAxis, false);
    picostepper_set_async_speed(XAxis, SLOWHOMESPEED);

    picostepper_move_async(XAxis, 10, &slow_home);
    
    while(gpio_get(HOME_X));

    picostepper_set_async_enabled(XAxis, false);

    sleep_ms(500);

    picostepper_set_async_speed(YAxis, HOMINGSPEED);
    picostepper_set_acceleration(YAxis, 0);
    picostepper_set_async_enabled(YAxis, true);

    picostepper_set_async_direction(YAxis, true);

    picostepper_move_async(YAxis, 100, &homing_sequence);
    
    while(!gpio_get(HOME_Y));

    picostepper_set_async_enabled(YAxis, false);

    sleep_ms(500);

    picostepper_set_async_enabled(YAxis, true);

    picostepper_set_async_direction(YAxis, false);

    picostepper_move_async(YAxis, 100, &homing_sequence);
    
    while(gpio_get(HOME_Y));

    picostepper_set_async_enabled(YAxis, false);

    sleep_ms(500);

    picostepper_set_async_enabled(YAxis, true);
    picostepper_move_blocking(YAxis, 500, true, picostepper_convert_speed_to_delay(HOMINGSPEED), 0);

    picostepper_set_async_direction(YAxis, false);
    picostepper_set_async_speed(YAxis, SLOWHOMESPEED);

    picostepper_move_async(YAxis, 10, &slow_home);
    
    while(gpio_get(HOME_Y));

    picostepper_set_async_enabled(YAxis, false);

    sleep_ms(500);

    picostepper_set_async_enabled(XAxis, true);
    picostepper_move_blocking(XAxis, config_buffer[X_HOME_CONFIG], true, picostepper_convert_speed_to_delay(HOMINGSPEED), 0);

    picostepper_set_async_enabled(YAxis, true);
    picostepper_move_blocking(YAxis, config_buffer[Y_HOME_CONFIG], true, picostepper_convert_speed_to_delay(HOMINGSPEED), 0);

    picostepper_set_async_enabled(XAxis, true);
    picostepper_set_position(XAxis, 0);
    picostepper_set_async_enabled(YAxis, true);
    picostepper_set_position(YAxis, 0);

}

void set_home(){

    getchar();

    while(true){

        sleep_ms(1000);

        uint pos_x = 0;
        uint pos_y = 0;

        for(uint i=0; i<10; i++){
            uint input = getchar();
            if(input == 13) break;
            pos_x = pos_x*10 + input-48;
        }

        for(uint i=0; i<10; i++){
            uint input = getchar();
            if(input == 13) break;
            pos_y = pos_y*10 + input-48;
        }

        if(pos_x == 420 && pos_y == 69){
            printf("Exiting!\n");
            return;
        }

        if(pos_x > 2000 || pos_y > 2000){
            printf("Erroneous position detected!\n");
            continue;
        }

        printf("Positions updated to X: %d Y: %d\n", pos_x, pos_y);

        positions[0] = pos_x;
        positions[1] = pos_y;

        picostepper_move_to_positions(devices, positions, 2);

    }

}

void update_config(){

    uint32_t *buffer;
    buffer = buffer_id ? buffer_one : buffer_two;

    for(uint8_t idx = 0; idx < 4; idx++){
        if(checksum(buffer[idx])){
            printf("Invalid configuration signature, aborting!\n");
            return;
        }
    }

    uint32_t acceleration = retrieve(buffer[1], ACCELERATION_MASK, ACCELERATION_SHIFT);
    uint32_t transfer_size = retrieve(buffer[1], TRANSFER_SIZE_MASK, TRANSFER_SIZE_SHIFT);
    uint32_t max_speed = retrieve(buffer[2], MAX_SPEED_MASK, MAX_SPEED_SHIFT);
    uint32_t min_speed = retrieve(buffer[2], MIN_SPEED_MASK, MIN_SPEED_SHIFT);
    uint32_t x_home = retrieve(buffer[3], X_HOME_MASK, X_HOME_SHIFT);
    uint32_t y_home = retrieve(buffer[3], Y_HOME_MASK, Y_HOME_SHIFT);
    uint32_t id = retrieve(buffer[3], ID_MASK, ID_SHIFT);

    config_buffer[ACCELERATION_CONFIG] = acceleration == (ACCELERATION_MASK >> ACCELERATION_SHIFT) ? config_buffer[ACCELERATION_CONFIG] : acceleration;
    config_buffer[TRANSFER_SIZE_CONFIG] = transfer_size == (TRANSFER_SIZE_MASK >> TRANSFER_SIZE_SHIFT) ? config_buffer[TRANSFER_SIZE_CONFIG] : transfer_size;
    config_buffer[MAX_SPEED_CONFIG] = max_speed == (MAX_SPEED_MASK >> MAX_SPEED_SHIFT) ? config_buffer[MAX_SPEED_CONFIG] : max_speed;
    config_buffer[MIN_SPEED_CONFIG] = min_speed == (MIN_SPEED_MASK >> MIN_SPEED_SHIFT) ? config_buffer[MIN_SPEED_CONFIG] : min_speed;
    config_buffer[X_HOME_CONFIG] = x_home == (X_HOME_MASK >> X_HOME_SHIFT) ? config_buffer[X_HOME_CONFIG] : x_home;
    config_buffer[Y_HOME_CONFIG] = y_home == (Y_HOME_MASK >> Y_HOME_SHIFT) ? config_buffer[Y_HOME_CONFIG] : y_home;
    config_buffer[PROJECTOR_ID_CONFIG] = id == (PROJECTOR_ID_MASK >> PROJECTOR_ID_SHIFT) ? config_buffer[PROJECTOR_ID_CONFIG] : id;

    bool update_needed = true;

    for(uint8_t idx = 0; idx < 8; idx++){
        update_needed &= config_buffer[idx] == config_saved[idx];
    }

    if(update_needed){
        printf("Updating stored config and resetting...\n");
        write_config();
    } else printf("No update detected!\n");

}

void draw_boundary(){

    projector_buffer[0] = 0x004C0001;
    projector_buffer[1] = 0x00003FE1;
    projector_buffer[2] = 0x96003FE1;
    projector_buffer[3] = 0x964B3FE1;
    projector_buffer[4] = 0x004B3FE1;

}

void dma_handler(){

    uint32_t *buffer;
    buffer = buffer_id ? buffer_one : buffer_two;

    if(true){

        printf("Checksums: ");
        for(uint i=0; i<config_buffer[TRANSFER_SIZE_CONFIG]; i++){
            if(checksum(buffer[i])) printf("Invalid ");
            else printf("Valid ");
        }
        printf("\n");

        printf("Received: ");
        for(uint i=0; i<config_buffer[TRANSFER_SIZE_CONFIG]; i++){
            printf("%X ", buffer[i]);
        }
        printf("\n");

    }

    if(!checksum(buffer[0])){
        if(retrieve(buffer[0], ID_MASK, ID_SHIFT) == config_buffer[PROJECTOR_ID_CONFIG] || retrieve(buffer[0], ID_MASK, ID_SHIFT) == ALL_PROJECTORS){
            uint8_t header_values = retrieve(buffer[0], CONFIG_MASK + BOUNDARY_MASK, BOUNDARY_SHIFT);
            
            if(header_values & 0b10){
                update_config();
            } else if(header_values & 0b01){
                draw_boundary();
                xfrReceived = true;
            } else {
                memcpy(projector_buffer, buffer, config_buffer[TRANSFER_SIZE_CONFIG] * sizeof(uint32_t));
                xfrReceived = true;
            }

        }
    }

    // Clear the interrupt request.
    dma_hw->ints1 = 1u << dma_chan;
    //Clear the fifo queue incase we lost sync
    pio_sm_clear_fifos(pio, sm);
    // re-trigger it
    if(buffer_id){
        buffer_id = 0;
        dma_channel_set_read_addr(dma_chan, &pio->rxf[sm], false);
        dma_channel_set_write_addr(dma_chan, buffer_two, true);
    } else {
        buffer_id = 1;
        dma_channel_set_read_addr(dma_chan, &pio->rxf[sm], false);
        dma_channel_set_write_addr(dma_chan, buffer_one, true);
    }

    if(DEBUG) printf("Received: %d\n", xfrReceived);

    if(DEBUG) printf("Interrupt cleared\n");
}

void serialReceiver(){

    printf("Initializing Core 1...\n");

    pwm_set_clkdiv(PWM_SLICE_ONE, PWM_CLOCK_DIV);
    pwm_set_wrap(PWM_SLICE_ONE, PWM_DEPTH); 
    pwm_set_enabled(PWM_SLICE_ONE, true);

    pwm_set_clkdiv(PWM_SLICE_TWO, PWM_CLOCK_DIV);
    pwm_set_wrap(PWM_SLICE_TWO, PWM_DEPTH); 
    pwm_set_enabled(PWM_SLICE_TWO, true);

    printf("PWM configured\n");

    lasers_off();

    pio = pio1;
    uint offset = pio_add_program(pio, &clocked_input_program);
    sm = pio_claim_unused_sm(pio, true);

    printf("PIO allocated\n");

    pio_sm_clear_fifos(pio, sm);
    clocked_input_program_init(pio, sm, offset, DATA);

    printf("PIO clocked input configured\n");

    bus_ctrl_hw->priority = BUSCTRL_BUS_PRIORITY_DMA_W_BITS | BUSCTRL_BUS_PRIORITY_DMA_R_BITS;

    dma_chan = dma_claim_unused_channel(true);
    dma_channel_config c = dma_channel_get_default_config(dma_chan);
    channel_config_set_transfer_data_size(&c, DMA_SIZE_32);
    channel_config_set_read_increment(&c, false);
    channel_config_set_write_increment(&c, true);
    channel_config_set_dreq(&c, DREQ_PIO1_RX0);

    printf("DMA initialized\n");

    dma_channel_configure(
        dma_chan,
        &c,
        buffer_one,
        NULL,
        config_buffer[TRANSFER_SIZE_CONFIG],
        false
    );

    printf("DMA configured\n");

    // Tell the DMA to raise IRQ line 0 when the channel finishes a block
    dma_channel_set_irq1_enabled(dma_chan, true);

    printf("DMA interrupt configured\n");

    // Configure the processor to run dma_handler() when DMA IRQ 0 is asserted
    irq_set_exclusive_handler(DMA_IRQ_1, dma_handler);

    printf("DMA interrupt handler configured\n");

    irq_set_enabled(DMA_IRQ_1, true);

    printf("DMA interrupts started\n");

    pio_sm_clear_fifos(pio, sm);

    printf("FIFO cleared\n");

    // Manually call the handler once, to trigger the first transfer
    dma_handler();

    if(DEBUG) printf("DMA handler initialized\n");

    while(true){

        //draw();
        sleep_ms(100);

    }

    printf("Error\n");
}



int main() {

    stdio_init_all();
    sleep_ms(3000);
    printf("Initializing...\n");
    init_config();
    printf("Config loaded\n");
    init_buffers();
    printf("Buffers initialized\n");
    sleep_ms(5000);
    printf("%d\n", NUMSTEPS);
    bus_ctrl_hw->priority = BUSCTRL_BUS_PRIORITY_DMA_W_BITS | BUSCTRL_BUS_PRIORITY_DMA_R_BITS;

    init_steppers();
    printf("Steppers intialized\n");
    set_stepper_values();
    printf("Steppers configured\n");
    init_gpio();
    printf("GPIO initialized\n");

    home_steppers();
    printf("Steppers homed\n");
    set_stepper_values();
    printf("Steppers configured\n");

    //set_home();

    multicore_launch_core1(serialReceiver);

    sleep_ms(5000);

    printf("Projector %d ready...\n", config_buffer[PROJECTOR_ID_CONFIG]);

    projector_buffer[0] = 0x00000000;

    while(true){

        if(!DEBUG){
            draw();
        }
        sleep_ms(100);

    }

  return -1;
}