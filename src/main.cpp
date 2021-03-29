
#include <cstdint>
#include <cstdio>

struct SIO {
  uint32_t cpuid;
  uint32_t gpio_in;
  uint32_t gpio_hi_in;
  uint32_t gpio_out;
  uint32_t gpio_out_set;
  uint32_t gpio_out_clr;
  uint32_t gpio_out_xor;
  uint32_t gpio_oe;
  uint32_t gpio_oe_set;
  uint32_t gpio_oe_clr;
  uint32_t gpio_oe_xor;
  uint32_t gpio_hi_out;
  uint32_t gpio_hi_out_set;
  uint32_t gpio_hi_out_clr;
  uint32_t gpio_hi_out_xor;
  uint32_t gpio_hi_oe;
  uint32_t gpio_hi_oe_set;
  uint32_t gpio_hi_oe_clr;
  uint32_t gpio_hi_oe_xor;
};

volatile SIO s_sio __attribute__((section(".sio_regs")));

int main() {
  s_sio.gpio_oe = 1 << 25;
  s_sio.gpio_out = 1 << 25;

  while (true) {}
  return 0;
}
