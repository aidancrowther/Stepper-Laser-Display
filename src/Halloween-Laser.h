#ifndef HALLOWEEN_LASER_H
#define HALLOWEEN_LASER_H

#define DEBUG true

#define delay sleep_ms
#define MAXSPEED 40000
#define MINSPEED 10000
#define HOMINGSPEED 2000
#define SLOWHOMESPEED 500
#define ACCELERATION 100000
#define Y_HOME_POS 300
#define X_HOME_POS 580
#define MAX_Y 300
#define MAX_X 300
#define TRANSFER_SIZE 51
#define PROJECTOR_ID 1
#define ALL_PROJECTORS 0xF
#define BAUDRATE 9600

#define STORAGE_OFFSET PICO_FLASH_SIZE_BYTES - (FLASH_SECTOR_SIZE*2)
#define LOAD_CONFIG 0
#define ACCELERATION_CONFIG 1
#define TRANSFER_SIZE_CONFIG 2
#define MAX_SPEED_CONFIG 3
#define MIN_SPEED_CONFIG 4
#define X_HOME_CONFIG 5
#define Y_HOME_CONFIG 6
#define PROJECTOR_ID_CONFIG 7

#define PWM_SLICE_ONE 5
#define PWM_SLICE_TWO 6
#define RED_SLICE PWM_SLICE_TWO
#define RED_CHANNEL PWM_CHAN_B
#define GREEN_SLICE PWM_SLICE_TWO
#define GREEN_CHANNEL PWM_CHAN_A
#define BLUE_SLICE PWM_SLICE_ONE
#define BLUE_CHANNEL PWM_CHAN_B
#define PWM_DEPTH 1023
#define PWM_CLOCK_DIV 125
#define COLOUR_DEPTH 8
#define COLOUR_MULTIPLIER 146

#define ID_MASK 0xF0000000
#define ID_SHIFT 28
#define COUNT_MASK 0x0FF00000
#define COUNT_SHIFT 20
#define HOME_MASK 0x00080000
#define HOME_SHIFT 19
#define ENABLE_MASK 0x00040000
#define ENABLE_SHIFT 18
#define CONFIG_MASK 0x00020000
#define CONFIG_SHIFT 17
#define BOUNDARY_MASK 0x00010000
#define BOUNDARY_SHIFT 16
#define ONESHOT_MASK 0x00008000
#define ONESHOT_SHIFT 15
#define SPEED_PROFILE_MASK 0x00007000
#define SPEED_PROFILE_SHIFT 12
#define X_MASK 0xFF800000
#define X_SHIFT 23
#define Y_MASK 0x007FC000
#define Y_SHIFT 14
#define RED_MASK 0x00003800
#define RED_SHIFT 11
#define GREEN_MASK 0x00000700
#define GREEN_SHIFT 8
#define BLUE_MASK 0x000000E0
#define BLUE_SHIFT 5

#define ACCELERATION_MASK 0xFFFFF000
#define ACCELERATION_SHIFT 12
#define TRANSFER_SIZE_MASK 0x00000FFE
#define TRANSFER_SIZE_SHIFT 1
#define MAX_SPEED_MASK 0xFFFFC000
#define MAX_SPEED_SHIFT 14
#define MIN_SPEED_MASK 0x00003FFE
#define MIN_SPEED_SHIFT 1
#define X_HOME_MASK 0xFFF00000
#define X_HOME_SHIFT 20
#define Y_HOME_MASK 0x000FFF00
#define Y_HOME_SHIFT 8
#define PROJECTOR_ID_MASK 0x000000F0
#define PROJECTOR_ID_SHIFT 4

#define CLOCK 1
#define DATA 0
#define BLUE 11
#define GREEN 12
#define RED 13
#define HOME_X 14
#define HOME_Y 15
#define ENABLE 16
#define ENABLE_LOGIC false
#define DIR_Y 18
#define DIR_X 21
#define STEP_Y 19
#define STEP_X 20

#define NUM_PROFILES 7
#define SPEED_0 500
#define SPEED_1 1000
#define SPEED_2 2000
#define SPEED_3 2500
#define SPEED_4 5000
#define SPEED_5 10000
#define SPEED_6 15000

#include <stdio.h>
#include <string.h>
#include "pico/stdlib.h"
#include "pico/binary_info.h"
#include "pico/multicore.h"
#include "pico/time.h"
#include "hardware/irq.h"
#include "hardware/pwm.h"
#include "hardware/dma.h"
#include "hardware/structs/bus_ctrl.h"
#include "hardware/flash.h"
#include "hardware/watchdog.h"

#include "picostepper.h"
#include "clocked_input.pio.h"
#include "uart.pio.h"

static const uint16_t speed_profiles[NUM_PROFILES] = {
    (uint16_t) SPEED_0, 
    (uint16_t) SPEED_1, 
    (uint16_t) SPEED_2, 
    (uint16_t) SPEED_3, 
    (uint16_t) SPEED_4, 
    (uint16_t) SPEED_5, 
    (uint16_t) SPEED_6};

int main();
void init_steppers();
void init_gpio();
void home_steppers();
void homing_sequence(PicoStepper device);
void set_stepper_values();
void serialReceiver();
void dma_handler();
bool checksum(uint message);
uint16_t retrieve(uint32_t frame, uint32_t mask, uint32_t shift);
void lasers_off();
void set_red_pwm(uint8_t pwm);
void set_green_pwm(uint8_t pwm);
void set_blue_pwm(uint8_t pwm);
void init_config();
void load_default_config();
void write_config();
void load_config();
void init_buffers();
void free_buffers();
int64_t reenableDMA(alarm_id_t id, void *userData);
//void clock_ISR();

#endif