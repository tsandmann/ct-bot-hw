# ct-Bot v2 prototype test boards

These boards (a simplified mainboard, a teensy mcu board, and three sensor boards) are ***prototypes*** just for ***development and testing***. They are provided "as is" without warranty of any kind.

## Simplified mainboard

To achieve a more cost-effective prototype board with only two layers, some optional extensions have been omitted, and the various I2C buses have been combined. See [mainboard_2l_0.8.3.pdf](mainboard_2l_0.8.3.pdf) for the simplified schematic. However, the basic functionality has been successfully tested. See [known issues](#Known-issues-and-notes) for problems discovered so far.

## Known issues and notes

Please note: these problem lists may be highly incomplete, as not all functions have been tested yet!

### [Mainboard](mainboard_2l_0.8.3.pdf)

* *I2C0* Pullups may be incorrect, depending on the connected modules, line capacities are not considered.
* A pullup is missing on ESP32's RX line.
* Reset buttons for MCU and ESP32 are missing.
* Analog signal paths are noisy due to simplified 2-layer design.
* There may be crosstalk due to the simplified 2-layer design.
* The BNO055 sensor connector should be extended by another one for an MPU 6050 sensor (as a better alternative).

### [Teensy MCU board](mcu_teensy_0.8.4.pdf)

* 3V3 reference voltage should be added to increase accurancy and stability of ADC.
* *I2C0_5V* is not necessary.
* *U2* and *Q1* are not necessary.
* RTC bat is not necessary.

### [Line sensor board (bottom)](sensors_b_0.8.4.pdf)

* Signals for left and right line sensors are swapped. Workaround: exchange *LINE_L* and *LINE_R* on mainboard connector or swap pin mappings in software.
