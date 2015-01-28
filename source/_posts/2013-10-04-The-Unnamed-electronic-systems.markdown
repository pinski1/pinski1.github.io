---
layout: post
title: "The Unnamed Electronic Systems"
date: 2013-10-04 14:57
comments: true
published: false
categories: [The Unnamed]
---
While I'm working on mechanical structure of The Unnamed I also need to consider how I will control the final robot. The rules <!-- link --> state that there need to be 2 elements before my robot is allowed to enter:

* Removable link
* Powered indicator

Of course the robot will need other items to operate such as:

* Battery
* Motor Drivers
* Radio Control Receiver

###Removable Link
The idea behind requiring a removable link is simple, it provides a guaranteed way of cutting of the power in case of emergency. It must be located in an accessible place and may only be covered by a clearly marked, and easily moved cover. In many robots the removable link also does double duty as the master power switch.

They are commonly made out of a high power collector that has the male plug pins shorted together and the female receptacle pins in line with the battery power leads. The female connector is used in line with the main power wiring to reduce the chances of a short circuit activating the robot unexpectedly.

###Powered Indicator
The powered indicator must be a steady indicator that is lit when the robot is powered, it cannot be a filament bulb. This gives a clear indication if the robot is powered.

As it cannot be a filament bulb LEDs are often used. It will need to be connected into the removable link side of the robot so that it will only light if the link is in place and the robot is active.

###Motor Drivers
I'm planning to have 3 motors in my robot, 2 for drive and 1 for the weapon, in all 3 cases I will need to control the motors in both directions. As the motors I shall be using are powerful I will need motor drivers that can withstand high voltages and currents continuously as well as far higher peak currents. Of course despite these requirements they need to be compact but affordable as I don't want to spend all my money on awesome motor controller only to not have enough money for a weapon, or worse, no money for a chassis. One other important feature is reliability, often many robots lose a bout simply because their motor controller suffered a fault, burnt out or became disconnected, I do not want that to be the case for my robot.

For the moment I'm planning to use modified Tz85A brushless speed controllers.

####Movement
I will be using two Gimson GR02 18 Volt 1:24 motors to drive two wheels each via a High Torque Drive (HTD) belt. The motors will pull approximately 8 Amps under load but will pull up to 62 Amps when stalled which means I will ideally want a motor controller that can take 10 Amps continuously and withstand short spikes of up to 65 Amps.

As I shall be using differential steering to control my robot I will need some way of mixing a remote control channel with left and right signals with a remote control channel with forward and backwards signals. This can be done either with a suitably intelligent dual channel motor controller or by using a V-Tail mixer to combine the signals.

####Weapon
My current plans for a weapon call for an electrically powered actuator as part of a four-bar-lifter. I'm expecting the actuator to be a [Gimson GLA-S](http://www.gimsonrobotics.co.uk/GLA-S_linear_actuator.html) 100mm linear actuator. Gimson state that the expected stall current is 62 Amps and the expected load current is 23 Amps, this means ideally I want a motor controller than can survive 62 Amps peak but I'll definitely want to be able to manage 30 Amps continuously. This actuator should reach full extension (205mm to 305mm) in approximately 5 seconds under load which could be too slow however this will require further work before I am certain.

Linear actuators do not spin continuously and will reach a limit where they cannot travel any further without damaging the motor or the actuator, to signal when the actuator has hit these points limit switches are installed. While limit switches are built into the SLA-S actuator they are not connected to the motor directly as they would not be able to handle the current, this requires me to add a circuit to detect inputs from these switches and control the motor accordingly.

###Battery
To power the motors in the robot a battery is needed, its characteristics such as voltage and capacity are defined by what I need it to power. The Unnamed has:

|Qty&emsp;|Description&emsp;|Load Current (Amps)&nbsp;|Sub-Total (Amps)&nbsp;|Stall Current (Amps)&nbsp;|SubTotal (Amps)&nbsp;
|-|-|-|-|-|-
|2|Gimson GR02|8|16|62|124
|1|Gimson GLA-S|23|23|62|62
|1|Misc Electronics&emsp;|0.2|0.2|0.2|0.2
|Totals:|||39.2||186.2
<br />
Assuming a bout lasts 10 minutes then I will need a battery capacity of 6.6 Amp hours (Ah) if all the motors are constantly operating, the absolute worst case suggests I'd need a 31 Ah battery if the motors were continuously stalled. Neither of these estimates are particularly realistic as I will not be driving at top speed for all of a bout, and nor will the lifter be constantly extending and retracting.

The 6.5 Ah figures is much more attainable so I will aim to have a battery that is close to this value. Another consideration is the voltage of the battery, the GR02s and the GLA-S are both rated at 18 Volts however I'm planning to over Volt them by using a 5 cell Li-Poly battery at 20.4 Volt, the motor controllers have PWM control so I will probably clamp the Voltages to 20 Volts to be safe.

###Radio Control Receiver
To control the robot I am planning to use a DSM2 compatible transmitter and receiver set, DSM2 is a 2.4GHz standard that allows different receivers and transmitter from different manufacturers to work together. My robot will require a minimum of 3 channels, one for each drive motor and one for the weapon. I could use a further 4th channel to enable inverted control for when my robot is flipped over or to enable other functions remotely.

##My Solution
With these considerations in mind I came up with the following circuit:

{% img https://lh3.googleusercontent.com/-AO9cxGub2X8/UnT7i4gSR2I/AAAAAAAACt8/3wYcZNjn4qU/w1358-h681-no/The+Unnamed.png %}

I've chosen a 5 cell 4.7AmpHour 30C Lithium Polymer battery from [OptiPower](http://www.optipower.co.uk/), this should provide enough power for long enough to last a bout. It will be capable of sourcing 141Amps (30C &times; 4.7AH) continuously with peaks of 376Amps (80C &times; 4.7AH).

To protect the motor drivers and RC electronics I've put a 100Amp automotive [Maxi Fuse](http://en.wikipedia.org/wiki/Fuse_%28automotive%29). As it is a cartridge fuse it's easy to replace if it gets blown but is also robust enough to act as a removable link. By choosing an automotive fuse cartridge it should be easy to buy spares and even replacement fuses with smaller ratings.

I'm going to use a high power red LED to indicate that the robot is powered, this will be connected after the fuse such that if the fuse blows the LED will not light.

The terminal block is ideal for the central connection node of my electronics system. The screw clamps will allow me to easily make and remove connections whilst securely grabbing any cable and holding it tight. It should also allow me to keep the wiring neat and tidy which will help me in maintaining the robot.

{% img https://lh4.googleusercontent.com/-bXl4wB7CVoE/VMkv8_GFWbI/AAAAAAAAC3g/hCPnhk3cbhM/w1278-h474-no/xt%2Bconnectors.jpg %}

I've omitted the connectors from this diagram to keep it simple, however I'm planning to use XT60 connectors like the ones above left to join the motors to the speed controllers. The battery will connect to the wire link with an XT90 connector, show above right, which is a the bigger brother of the XT60. By connectorising these key parts of the system it enables me to quickly re-configure the robot for maintenance or debugging. They're polarised so I cannot plug things in backwards as well as gendered so I can ensure that the parts of the system that supply power have female plugs to reduce the chances of shorts.