# Assembly-and-Disassembly

## 1. Board Used

- **Board:** STM32 BlackPill F401CC
- **Microcontroller:** STM32F401CCU6
- **GPIO Pin:** PA5
- **LED:** On-board LED connected to PA5

## 2. What We Did

We made the on-board LED connected to PA5 blink using **ARM Assembly Language**.

We did not use Arduino functions like `digitalWrite()`. Instead, we controlled the microcontroller directly through its hardware registers.

This helped us understand how the LED is controlled internally by the microcontroller.

## 3. How It Works

1. **Enable GPIOA Clock:** First, we enabled the GPIOA clock because the GPIO peripheral needs its clock to operate.

2. **Configure PA5 as Output:** We configured PA5 as an output pin so that we could control the LED.

3. **Turn LED ON:** We set PA5 HIGH, which turns the LED ON.

4. **Delay:** We used a software delay so that the LED remains ON for some time.

5. **Turn LED OFF:** We set PA5 LOW, which turns the LED OFF.

6. **Repeat:** After another delay, the program jumps back to the beginning of the loop.

The LED keeps blinking continuously:

**LED ON → Delay → LED OFF → Delay → Repeat**

## 4. What Is Assembly Code?

Assembly is a low-level programming language that is close to the hardware.

In this project, we used Assembly instructions to perform three main operations:

- Enable the GPIOA clock.
- Configure PA5 as an output.
- Set PA5 HIGH and LOW with a delay in between.

## 5. What Is Disassembly Code?

When Assembly code is assembled, it is converted into machine code that the processor can execute.

Disassembly converts the machine-code instructions into a human-readable format. It shows the memory addresses, hexadecimal opcodes and corresponding instructions.

In our project, the actual disassembly showed:

- **ORR:** Used to enable the GPIOA clock.
- **BIC and ORR:** Used to configure PA5 as an output.
- **MOVS and STR:** Used to prepare and write the values that turn the LED ON and OFF.
- **SUBS:** Decreases the counter to create the software delay.
- **BNE:** Repeats the delay loop until the counter reaches zero.
- **B:** Jumps back to the LED blinking loop.

We inspected the compiled ELF file to understand how our original Assembly instructions were converted into machine-code instructions.

## 6. How to Run

1. Open the project in Arduino IDE.
2. Select the board: **BlackPill F401CC**.
3. Select **Export Compiled Binary** to generate the `.bin` file.
4. Open STM32CubeProgrammer.
5. Connect the board using ST-LINK.
6. Download the `.bin` file at address `0x08000000`.
7. Press the RESET button.

The PA5 LED starts blinking.

## 7. Result

The PA5 LED turns ON, waits for some time, turns OFF, waits again, and repeats continuously.

**Successfully implemented LED blinking using ARM Assembly Language and inspected its actual Disassembly code.**

## 8. Conclusion

Through this project, we learned how to control GPIO pins directly using ARM Assembly instructions and STM32 hardware registers. We also understood how Assembly instructions appear in the actual disassembly of a compiled ELF file.
