#ifndef QUEUE_H
#define QUEUE_H

#include <stdint.h>
#include <stdbool.h>
#include <stdlib.h>

#define QUEUE_SIZE 1024

typedef struct {
   size_t tail;
   size_t head;
   size_t sizeMask;
   uint32_t data[QUEUE_SIZE*2];
} RingBuffer;

void ringBufferInit(RingBuffer *buffer);

size_t ringBufferLen(const RingBuffer *buffer);

bool ringIsFull(const RingBuffer *buffer);

bool ringIsEmpty(const RingBuffer *buffer);

void ringEnQueue(RingBuffer *buffer, uint32_t data);

uint32_t ringDeQueue(RingBuffer *buffer);

void ringClear(RingBuffer *buffer);

#endif