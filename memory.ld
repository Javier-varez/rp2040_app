MEMORY
{
  /* NOTE 1 K = 1 KiBi = 1024 bytes */
  /* To suit Raspberry Pi RP2040 SoC */
  BOOT_LOADER : ORIGIN = 0x10000000, LENGTH = 0x100
  FLASH : ORIGIN = 0x10000100, LENGTH = 2048K - 0x100
  RAM : ORIGIN = 0x20000000, LENGTH = 256K
  SIO : ORIGIN = 0xD0000000, LENGTH = 1K
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
} INSERT BEFORE .text;

