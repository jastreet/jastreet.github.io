---
layout: default
---

[My Resume](./assets/JASResume2023.pdf)

### Skills: C, ARM, SystemVerilog, Python, MATLAB

## Education
B.S. Electrical and Computer Engineering  
University of Washington, Seattle (_June 2024_)  
Concentration: VLSI Design / Digital Systems Design

## Experience

**Engineer @ Li3Go (_June 2022 - Present_)**
- Implemented a patented multi-grid power management system using Python on a prototype class A motorhome retrofitted with solar panels.
- Designed hardware agnostic database schema to support multiple brands of solar inverters.

**Vice President @ Husky Flying Club (_Sept 2020 - Present_)**
- Successfully planned, pitched, and managed a $105,811 grant to build the first UW light-sport aircraft awarded by the Student Tech Fund Committee.

**Student Tech Support @ Spokane Public Schools (_June - Sept, 2018 - 2021_)**
- Upgraded hardware and software, organized and restructured computer labs.
- Assisted in preparing 60,000 student laptops for the rapid adoption of online learning due to COVID-19.

## Projects
Due to University policy I am not able to publicly post code or files for many of these projects, but if you're curious (and not a UW student) feel free to reach out on LinkedIn for any files or code.  
(If any images are too small, right click -> open image in new tab)

### Computer Architecture
By graduation, I will have taken at least six computer architecture courses using SystemVerilog, and C on the ARMv7 architecture. So far, the most challenging task I've completed is the implementation of a 5-cycle pipelined ARM CPU from Digital Design and Computer Architecture ARM® Edition by Sarah L. Harris and David Money Harris. Below is the textbook's CPU diagram complete with full hazard protection and pipelining.
![p1a](./assets/img/p1a.png)  

As they say, there is only one way to eat an elephant: one bite at a time. So I began by moving up in layers of abstraction starting at the very beginning, a 1-bit full-adder SystemVerilog module. Then, writing a 32-bit full-adder module. Now with a 32-bit full adder, I was able to write an ALU for arithmetic operations. And after writing the register file module, I was able to begin splitting up the CPU by segmenting each cycle (Fetch, Decode, Execute, Memory, Writeback) into a separate SV module. This is the block diagram with each control signal going between each stage.
![p1b](./assets/img/p1b.png)  


Next it was simply a matter of consulting the ARM reference manual for the various instructions with their respective machine code, setting ALUFlags with the Cond unit and implementing the combinational logic of the Hazard Unit. Finally, I wrote a simple ARM program to make use of stalling, flushing, and branching. Below is a screenshot from the top-level module of the CPU executing the test program, each line is one of the various control signals accessible by the top-level module. Take note of the PCPlus8D (Program Counter) line moving through each word of the instruction memory.
![p1c](./assets/img/p1c.png)

### Circuit Design and Analysis
For the final lab of my EE331 course, students were tasked with designing an adjustable AC to DC power supply from scratch. The power supply took in 7.5V RMS AC current and output 10-20V DC adjustable with a potentiometer. Below is the block diagram for my design.  
![p2a](./assets/img/p2a.png)  

The final schematic for my design:
![p2b](./assets/img/p2b.png)  

And this is my simulation results measuring the DC output across a 10k load. Each line is a different simulated 'percentage' on the potentiometer.
![p2c](./assets/img/p2c.png)

### Signals Processing

#### Audio Filtering
Here is an example of audio smoothing I implemented using numpy and matplotlib. First I create a random noisy audio signal.

```python
# Base and noise signal

sample_rate = 1000 
time  = np.arange(0,2,1/sample_rate) 
n = len(time)

p = 10 # points for piecewise linear signal
amp = 20   # amplitude range of base signal
base = np.interp(np.linspace(0,p,n),np.arange(0,p),np.random.rand(p)*amp)

# Create some random noise to be added to the above base signals
noiseamp = 2
noise = noiseamp * np.random.randn(n)

noisy = noise + base
```
![p3a](./assets/img/p3a.png)

Next, using convolution I smooth the signal with SciPy.
```python
# Use signal.lfilter to apply my filter

mean_filter = np.zeros(len(noisy))
k = 10

N = 2 * k + 1

a = [1]
hfilt = np.ones(N)* 1/N
b = hfilt

filtsig1 = np.convolve(base, hfilt)
time1 = np.arange(0,2020)
time2 = np.arange(0,2000)

fig = plt.figure(figsize = (8,8))
plt.plot(time1, filtsig1, color = 'blue')


filtsig2 = sig.lfilter(b, a, noisy)
plt.plot(time2, filtsig2, color = 'red')
```
![p3b](./assets/img/p3b.png)

