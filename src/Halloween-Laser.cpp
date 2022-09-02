#include <stdio.h>
#include <string.h>
#include "pico/stdlib.h"
#include "pico/binary_info.h"
#include "picostepper.h"

#define delay sleep_ms
#define MAXSPEED 15000
#define ACCELERATION 1000000

uint8_t dir_x = 18;
uint8_t dir_y = 21;

uint8_t step_x = 19;
uint8_t step_y = 20;

int main() {
    return -1;
}