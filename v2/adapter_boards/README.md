# ct-Bot v2 adapter boards
These two little adapter boards (for *DRV8835 motor driver* and *teensy 3.5/3.6 development board*) are ***prototypes*** just for ***development and testing***. They are provided "as is" without warranty of any kind.

## Teensy adapter
The teensy adapter board allows for usage of a Teensy 3.5 (https://www.pjrc.com/store/teensy35.html) or Teensy 3.6 development board (https://www.pjrc.com/store/teensy36.html) with the original (v1) ct-Bot mainboard. The adapter replaces the ATmega1284P (*IC1*) and has to be plugged into its socket. More information about the pin assignment has to be read out of the schematic.

### Note
You have to **remove** any **pull-up resistor** on the **servo PWM lines** to avoid damage to the teensy board. Usually there is only on the the extension board (R17) which is no problem. If you added one manually on the mainboard, you have to remove it.

## Motor driver adapter
The motor driver adapter board allows for usage of the DRV8835 motor driver carrier (https://www.pololu.com/product/2135) with the original (v1) ct-Bot mainboard. The adapter replaces the L293D (*IC2*) and has to be plugged into its socket.
