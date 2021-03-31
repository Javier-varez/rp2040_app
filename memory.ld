MEMORY
{
  /* NOTE 1 K = 1 KiBi = 1024 bytes */
  /* To suit Raspberry Pi RP2040 SoC */
  BOOT_LOADER : ORIGIN = 0x10000000, LENGTH = 0x100
  FLASH : ORIGIN = 0x10000100, LENGTH = 2048K - 0x100
  RAM : ORIGIN = 0x20000000, LENGTH = 256K
  SIO : ORIGIN = 0xD0000000, LENGTH = 1K
  IO_BANK_0 : ORIGIN = 0x40014000, LENGTH = 1K
  RESETS : ORIGIN = 0x4000C000, LENGTH = 1K
}

SECTIONS {

  /* ### Boot loader */
  .boot_loader ORIGIN(BOOT_LOADER) :
  {
    KEEP(*(.boot2*));
  } > BOOT_LOADER

  .sio_regs (NOLOAD) : {
    *(.sio_regs)
  } > SIO

  .io_bank_0_regs (NOLOAD) : {
    *(.io_bank_0_regs)
  } > IO_BANK_0

  .reset_regs (NOLOAD) : {
    *(.reset_regs)
  } > RESETS
} INSERT BEFORE .text;

