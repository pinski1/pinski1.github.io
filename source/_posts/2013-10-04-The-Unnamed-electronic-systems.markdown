---
layout: post
title: "The Unnamed electronic systems"
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

They are commonly made out of a high power collector such as a Deans connector that has the male plug pins shorted together and the female receptacle pins in line with the battery power leads. The female connector is used in line with the main power wiring to reduce the chances of a short circuit activating the robot unexpectedly.

###Powered Indicator
The powered indicator must be a steady indicator that is lit when the robot is powered, it cannot be a filament bulb. This gives a clear indication if the robot is powered.

###Motor Drivers
I'm planning to have 3 motors in my robot, 2 for drive and 1 for the weapon, in all 3 cases I will need to control the motors in both directions. As the motors I shall be using are powerful I will need motor drivers that can withstand high voltages and currents continuously as well as far higher peak currents. Of course despite these requirements they need to be compact but affordable as I don't want to spend all my money on awesome motor controller only to not have enough money for a weapon, or worse, no money for a chassis. One other important feature is reliability, often many robots lose a bout simply because their motor controller suffered a fault, burnt out or became disconnected, I do not want that to be the case for my robot.

For the moment I'm planning to use modified Tz85A brushless speed controllers.

####Movement
I will be using two Gimson GR02 18 Volt 1:24 motors to drive two wheels each via a chain transmission. The motors will pull approximately 8 Amps under load but will pull up to 62 Amps when stalled which means I will ideally want a motor controller that can take 10 Amps continuously and withstand short spikes of up to 65 Amps. 

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
|1|Misc Electronics&emsp;|0|0|0|0
|Totals:|||39||186
<br />
Assuming a bout lasts 10 minutes then I will need a battery capacity of 6.5 Amp hours (Ah) if all the motors are constantly operating, the absolute worst case suggests I'd need a 31 Ah battery if the motors were continuously stalled. Neither of these estimates are particularly realistic as I will not be driving at top speed for all of a bout, and nor will the lifter be constantly extending and retracting. Obviously the 6.5 Ah figures is much more attainable so I will aim to have a battery that is close to this value. Another consideration is the voltage of the battery, the GR02s and the GLA-S are both rated at 18 Volts however I'm planning to over Volt them by using a 22.2 Volt battery, the motor controllers have PWM control so I will probably clamp the Voltages to 20 Volts to be safe.

###Radio Control Receiver
To control the robot I am planning to use a DSM2 compatible transmitter and receiver set, DSM2 is a 2.4GHz standard that allows different receivers and transmitter from different manufacturers to work together. My robot will require a minimum of 3 channels, one for each drive motor and one for the weapon. I could use a further 4th channel to enable inverted control for when my robot is flipped over or to enable other functions remotely.

##My Solution
With these considerations in mind I came up with the following circuit:

{% img https://lh3.googleusercontent.com/-AO9cxGub2X8/UnT7i4gSR2I/AAAAAAAACt8/3wYcZNjn4qU/w1358-h681-no/The+Unnamed.png %}

The diagram is largely self-explanatory however the large black/grey block in the centre is a [Wago 862-0504](http://global.wago.com/en/products/product-catalog/terminal-blocks-connectors/modular-terminal-blocks-terminal-strips-panel-mounting/chassis-mount-terminal-strips-witth-cage-clamp-s-connection/index.jsp) terminal block which looks like this:

{% img https://lh5.googleusercontent.com/-7PtgQRQLKw8/Uk7ed3MnKiI/AAAAAAAACtA/2Jze4lsfm4A/w249-h200-no/Wago+862-0504.png %}

It has 4 poles with each pole having 4 spring loaded connections that are capable of holding wires between 20AWG and 12AWG. This terminal block is ideal for the central connection node of my electronics system. The spring loaded clamps will allow me to easily make and remove connections whilst securely grabbing any cable and holding it tight. It should also allow me to keep the wiring neat and tidy which will help me in maintaining the robot.

{% img https://lh3.googleusercontent.com/-LMULGvk0l9Y/Uk7g0use87I/AAAAAAAACtU/aa2__sqgwHs/w500-h376-no/XT60+connectors.png %}

I've omitted the connectors from this diagram to keep it simple, however I'm planning to use XT60 connectors like the ones above to join the battery to the wire link and the motors to the speed controllers. By connectorising these key parts of the system it enables me to quickly re-configure the robot for maintenance or debugging. They're polarised so I cannot plug things in backwards as well as gendered so I can ensure that the parts of the system that supply power have female plugs to reduce the chances of shorts.