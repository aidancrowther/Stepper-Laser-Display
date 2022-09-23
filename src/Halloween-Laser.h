#ifndef HALLOWEEN_LASER_H
#define HALLOWEEN_LASER_H

#define delay sleep_ms
#define MAXSPEED 60000
#define MINSPEED 15000
#define HOMINGSPEED 2000
#define SLOWHOMESPEED 500
#define ACCELERATION 200000
#define MAX_X 300
#define MAX_Y 300
#define TRANSFER_SIZE 3
#define PROJECTOR_ID 1

#define PWM_SLICE_ONE 5
#define PWM_SLICE_TWO 6
#define RED_SLICE PWM_SLICE_TWO
#define RED_CHANNEL PWM_CHAN_B
#define GREEN_SLICE PWM_SLICE_TWO
#define GREEN_CHANNEL PWM_CHAN_A
#define BLUE_SLICE PWM_SLICE_ONE
#define BLUE_CHANNEL PWM_CHAN_B
#define PWM_DEPTH 1023
#define PWM_CLOCK_DIV 1250
#define COLOUR_DEPTH 8
#define COLOUR_MULTIPLIER 146

#define ID_MASK 0xF0000000
#define ID_SHIFT 28
#define COUNT_MASK 0x0FF00000
#define COUNT_SHIFT 20
#define X_MASK 0xFF800000
#define X_SHIFT 23
#define Y_MASK 0x007FC000
#define Y_SHIFT 14
#define RED_MASK 0x00003800
#define RED_SHIFT 11
#define GREEN_MASK 0x00000700
#define GREN_SHIFT 8
#define BLUE_MASK 0x000000E0
#define BLUE_SHIFT 5

#define CLOCK 1
#define DATA 0
#define BLUE 11
#define GREEN 12
#define RED 13
#define HOME_Y 14
#define HOME_X 15
#define ENABLE 16
#define DIR_X 18
#define DIR_Y 21
#define STEP_X 19
#define STEP_Y 20

#include <stdio.h>
#include <string.h>
#include "pico/stdlib.h"
#include "pico/binary_info.h"
#include "pico/multicore.h"
#include "pico/time.h"
#include "hardware/irq.h"
#include "hardware/pwm.h"
#include "hardware/dma.h"

#include "picostepper.h"
#include "clocked_input.pio.h"

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

#endif