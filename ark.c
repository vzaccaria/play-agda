#include <math.h>

unsigned char st[16];
unsigned char key[16];
unsigned char pt[16];
unsigned char mask[16];

void ARK() {
  unsigned char i;
  for (i = 0; i < 2; i++) {
    st[i] = pt[i] ^ (key[i] ^ mask[i]);
  }
}
