#ifndef HALLOWEEN_LASER_H
#define HALLOWEEN_LASER_H

#include <stdio.h>
#include <string.h>
#include "pico/stdlib.h"
#include "pico/binary_info.h"
#include "pico/multicore.h"
#include "pico/time.h"
#include "hardware/irq.h"
#include "hardware/pwm.h"

#include "picostepper.h"

#include <FreeRTOS.h>
#include <task.h>
#include <semphr.h>

int main();
void init_steppers();
void init_gpio();
void home_steppers();
void homing_sequence(PicoStepper device);
void set_stepper_values();

#endif