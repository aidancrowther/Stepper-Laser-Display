#include "queue.h"

void ringBufferInit(RingBuffer *buffer) {

   buffer->tail = 0;
   buffer->head = 0;
   buffer->sizeMask = (QUEUE_SIZE*2)-1;
}

size_t ringBufferLen(const RingBuffer *buffer) {
   if(buffer->tail >= buffer->head) {
      return buffer->tail-buffer->head;
   }

   return buffer->sizeMask-(buffer->head-buffer->tail)+1;
}

bool ringIsEmpty(const RingBuffer *buffer) {
   return (buffer->tail == buffer->head);
}

bool ringIsFull(const RingBuffer *buffer){
   return buffer->sizeMask == ringBufferLen(buffer);
}

void ringEnQueue(RingBuffer *buffer, uint32_t data){
   buffer->data[buffer->tail] = data;
   buffer->tail = (buffer->tail + 1) & buffer->sizeMask;
}

uint32_t ringDeQueue(RingBuffer *buffer){
   uint32_t data =  buffer->data[buffer->head];
   buffer->head = (buffer->head + 1) & buffer->sizeMask;
   return data;
}

void ringClear(RingBuffer *buffer){
   buffer->head = buffer->tail = 0;
}