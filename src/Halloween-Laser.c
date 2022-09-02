#define delay sleep_ms
#define MAXSPEED 60000
#define MINSPEED 15000
#define HOMINGSPEED 2000
#define SLOWHOMESPEED 500
#define ACCELERATION 200000
#define MAX_X 300
#define MAX_Y 300

#include "Halloween-Laser.h"

uint8_t dir_x = 18;
uint8_t dir_y = 21;

uint8_t step_x = 19;
uint8_t step_y = 20;

uint red = 13;
uint green = 12;
uint blue = 11;

uint home_x = 15;
uint home_y = 14;

PicoStepper devices[2];
int positions[2];

PicoStepper YAxis;
PicoStepper XAxis;

void homing_sequence(PicoStepper device){
    if(picostepper_get_async_enabled(device)) picostepper_move_async(device, 100, &homing_sequence);
}

void slow_home(PicoStepper device){
    if(picostepper_get_async_enabled(device)) picostepper_move_async(device, 10, &homing_sequence);
}

void init_gpio(){
    gpio_init(home_x);
    gpio_init(home_y);
    gpio_init(red);
    gpio_init(green);
    gpio_init(blue);

    gpio_set_dir(home_x, false);
    gpio_set_dir(home_y, false);
    gpio_set_dir(red, true);
    gpio_set_dir(green, true);
    gpio_set_dir(blue, true);

    gpio_set_outover(red, GPIO_OVERRIDE_INVERT);
    gpio_set_outover(green, GPIO_OVERRIDE_INVERT);
    gpio_set_outover(blue, GPIO_OVERRIDE_INVERT);

    gpio_pull_up(home_x);
    gpio_pull_up(home_y);

    gpio_put(red, true);
    gpio_put(green, true);
    gpio_put(blue, true);
}

void init_steppers(){

    YAxis = picostepper_pindef_init(dir_y, step_y, TwoWireDriver);
    XAxis = picostepper_pindef_init(dir_x, step_x, TwoWireDriver);

    devices[0] = XAxis;
    devices[1] = YAxis;

}

void set_stepper_values(){
    picostepper_set_async_enabled(XAxis, true);
    picostepper_set_max_speed(XAxis, MAXSPEED);
    picostepper_set_min_speed(XAxis, MINSPEED);

    picostepper_set_async_enabled(YAxis, true);
    picostepper_set_max_speed(YAxis, MAXSPEED);
    picostepper_set_min_speed(YAxis, MINSPEED);
}

void home_steppers(){
    picostepper_set_async_speed(XAxis, HOMINGSPEED);
    picostepper_set_acceleration(XAxis, 0);
    picostepper_set_async_enabled(XAxis, true);
    picostepper_set_async_direction(XAxis, false);

    picostepper_move_async(XAxis, 100, &homing_sequence);
    
    while(gpio_get(home_x));

    picostepper_set_async_enabled(XAxis, false);

    sleep_ms(500);

    picostepper_set_async_enabled(XAxis, true);
    picostepper_move_blocking(XAxis, 500, true, picostepper_convert_speed_to_delay(HOMINGSPEED), 0);

    picostepper_set_async_direction(XAxis, false);
    picostepper_set_async_speed(XAxis, SLOWHOMESPEED);

    picostepper_move_async(XAxis, 10, &slow_home);
    
    while(gpio_get(home_x));

    picostepper_set_async_enabled(XAxis, false);

    sleep_ms(500);

    picostepper_set_async_speed(YAxis, HOMINGSPEED);
    picostepper_set_acceleration(YAxis, 0);
    picostepper_set_async_enabled(YAxis, true);
    picostepper_set_async_direction(YAxis, false);

    picostepper_move_async(YAxis, 100, &homing_sequence);
    
    while(gpio_get(home_y));

    picostepper_set_async_enabled(YAxis, false);

    sleep_ms(500);

    picostepper_set_async_enabled(YAxis, true);
    picostepper_move_blocking(YAxis, 500, true, picostepper_convert_speed_to_delay(HOMINGSPEED), 0);

    picostepper_set_async_direction(YAxis, false);
    picostepper_set_async_speed(YAxis, SLOWHOMESPEED);

    picostepper_move_async(YAxis, 10, &slow_home);
    
    while(gpio_get(home_y));

    picostepper_set_async_enabled(YAxis, false);

    sleep_ms(500);

    picostepper_set_async_enabled(XAxis, true);
    picostepper_move_blocking(XAxis, 250, true, picostepper_convert_speed_to_delay(HOMINGSPEED), 0);

    picostepper_set_async_enabled(YAxis, true);
    picostepper_move_blocking(YAxis, 250, true, picostepper_convert_speed_to_delay(HOMINGSPEED), 0);

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

int main() {

    stdio_init_all();
    sleep_ms(2000);
    printf("%d\n", NUMSTEPS);

    init_steppers();
    set_stepper_values();
    init_gpio();

    home_steppers();
    set_stepper_values();

    //set_home();

    while(true){
        
        picostepper_set_acceleration(XAxis, ACCELERATION);
        picostepper_set_acceleration(YAxis, ACCELERATION);

        positions[0] = MAX_X;
        positions[1] = 0;
        gpio_put(blue, false);
        picostepper_move_to_positions(devices, positions, 2);
        //sleep_ms(1000);

        positions[0] = MAX_X;
        positions[1] = MAX_Y;
        gpio_put(blue, true);
        picostepper_move_to_positions(devices, positions, 2);
        //sleep_ms(1000);

        positions[0] = 0;
        positions[1] = MAX_Y;
        gpio_put(blue, false);
        picostepper_move_to_positions(devices, positions, 2);
        //sleep_ms(1000);

        positions[0] = 0;
        positions[1] = 0;
        gpio_put(blue, true);
        picostepper_move_to_positions(devices, positions, 2);
        //sleep_ms(1000);
    }

  return -1;
}