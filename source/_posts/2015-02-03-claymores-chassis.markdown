---
layout: post
title: "Claymore's Chassis"
date: 2015-02-03 18:09
comments: true
published: false
categories: [Claymore] 
---
It's been a long time since I last updated this blog. In that time the designs for Claymore have changed quite a bit. I've settled on a sensor layout as well as discarding the whole idea of a lasercut chassis. The biggest driver in the decision to discard the laser cut chassis was me finally accepting that the Faulhaber motor gearboxes were unworkable in their current state. They were in a prime position to be the main mounting point but due to their thin all-plastic design there was no way to mount to them satisfactorily.

##Chassis
Since becoming a member of [Cambridge Makespace](http://www.makespace.org) one of the more amazing tools I've had access to is the [Metal Mill](http://wiki.makespace.org/Equipment/WarcoMill). This tool cuts through aluminium and steel like a dream and is the main driver behind my decision to build the chassis out of milled aluminium. As the electronics is designed to fit inside the chassis this then requires a redesign of the electronics too.

###Motor Mounts
The first thing I re-designed was the motor mounts, the dimension are largely copied from the plastic originals however I added more thickness to the base to allow me to drill and tap these for mounting. Unlike the laser cut chassis the motors mount to the base of the chassis rather than the top. This allows the electronics to drop in from the top and the battery to be held in with gravity.

<!-- CAD image -->

Rather than to screw directly into the aluminium which is quite soft and will strip after a few remove/replace cycles I used [Helicoils](http://www.repairengineering.com/helicoil.html). These spring-like stainless steel inserts screw into an over size tapped hole and have an internal thread which is the sized to fit your bolts, in my case M3. This allows me to remove/replace parts repeatedly with no loss of strength.

<!-- picture of helicoils? -->

###Base Plate
The base of the chassis is made out of 1.6mm thick aluminium sheet that is cut and bent into an "L" shape. This reduces the need for an awkward mounting system in the rear of the chassis where the motors will mount and also stiffens the chassis a bit. To mount the sides to the chassis base I made up some small aluminium blocks that had 5 helicoiled threaded holes. These mount to the chassis with 2 bolts, to the sides with 2 bolts and attach to the PCB with 1 nylon standoff.

<!-- image of semi-populated chassis -->

###Chassis Front
The front of the chassis is one large aluminium block to ensure that the front of the robot is kept down during high acceleration as well as to provide a ridgid mounting point for the sensors. Before I re-designed this block I bought some of the sensors I will use (Sharp GP2Y0D340K [Datasheet](http://sharp-world.com/products/device/lineup/data/pdf/datasheet/gp2y0d340k_e.pdf)) and measured their range and detection pattern. I found that by spacing 3 sensors ~15&deg; apart I could cover a 90&deg; arc in front of the robot out to ~300mm.

<!-- image of front block -->

###Skid and Sensors
To keep the front of the robot from damaging the dohyo surface I machined a skid out of an engineering plastic called Delrin. This plastic is tough yet slippy so should be ideal for this. To detect the edge of the dohyo I added 2 edge sensors right on the front most edges of my robot. These should detect the transition from the black of the main dohyo surface to the white of the 25mm thick edge strip.

<!-- image of underside of front block, inc. edge sensors & skid -->

###Ascetics
As plain aluminium is very shiny which will reflect infra-red light very well I will need to darken the exposed aluminium surfaces. Ideally I'd anodize the aluminium however I don't think I'll get a great finish and it would be tricky to do myself. Instead I'm planning to use a matt black vinyl wrap to cover the aluminium surfaces. This should be a simple process but should give a good finish.

As the electronics will be mounted on top of the motors & aluminium blocks I need a top cover to protect them. I've decided that I will laser cut a 3mm translucent acrylic top with holes for buttons. This should looks good and provide enough protections from falls to the electronics.

<!-- image of top -->

##Electronics
The main change has been the PCB shape, in order to fit the battery the PCB is now a "U" shape with angled cut outs for the sensors. Unfortunately as this is a small PCB with lots of components and some very narrow places I'm still trying to route tracks.

<!-- picture of EAGLE output -->

<!-- picture of paper cutout -->

###Power handing
One key aspect of the chassis redesign was the dimensions of the battery. The battery is a key component of the mini-sumo as without it nothing will run. I've now decided to use Venom 10C 3 cell LiPoly batteries and have bought 2 to allow one to charge while one is being used. They're quite popular so there should be a ready supply of spares if required. They weigh 45grams and their dimensions are 68mm x 26mm x 18mm. It is important to note that a fully charged 3 cell LiPoly battery will have a pack voltage of 12.6V.

As the motors will be separated by the battery it will be hard to route a single motor controller chip like the [TB6612FNG](http://toshiba.semicon-storage.com/info/lookup.jsp?pid=TB6612FNG&lang=en) to both motors. Thus I have chosen to use  separate motor drivers, however I also need the motor driver chips to be compact as I do not have much space on the PCB. The motor chips I have chosen are Texas Instruments [DRV8838](http://www.ti.com/product/drv8838) however these motor driver chips cannot handle power supplies of greater than 11Volts. To protect the DRV8838s I've placed a large diode in series with the battery that has a Vfwd of 1.6Volts which should drop the voltage satisfactorily.

Another problem is that while the motors will be running at 11Volts, the GP2Y0D340K sensors require 5Volts to work, and the rest of the logic requires 3.3Volts to work. I decided to solve this by using a switch mode power supply to convert the battery Voltage down to a stable 5Volts for the range sensors and then I am using a linear regulator to convert from 5Volts down to 3.3Volts. This minimises the board space required while maintaining a high efficiency. This should cost too much nor generate too much heat.

###Sensors
The GP2Y0D340K range sensors will plug into turned pin sockets mounted directly to PCB at the right 15&deg; angles. This allows me to change sensors if they get damaged but also provides a secure method of fastening them to the chassis via the PCB.

The [QRE1113](https://www.sparkfun.com/products/9454) floor sensors will be mounted in Sparkfun breakout boards which bolt to the front block as seen in the picture above. They will have wire pigtails that connect to the PCB via tiny 3way JST [SH](http://www.jst-mfg.com/product/detail_e.php?series=231) connectors. I've still not quite decided where on the PCB these will mount but they don't take up much room at all.

###Interfacing
As this is an autonomous combat robot I will need to change the code regularly to alter and improve tactics. The best way to do this is by including an ARM [mbed](http://developer.mbed.org/) compatible chip that can be programmed via a built in USB bootloader. The NXP [LPC1347](http://www.nxp.com/products/microcontrollers/cortex_m3/lpc1300/#overview) ARM Cortex-M3 microcontroller fits these requirements perfectly. To avoid cutting holes in the chassis the USB connector is placed pointing forwards between 2 of the range sensors. The buttons to reset and put the chip into bootloader mode will peek out through laser cut holes in the acrylic top cover.

<!-- image of USB port -->

To provide detailed status information I've added a monochrome 128px x 32px I<sup>2</sup>C [OLED screen](http://www.adafruit.com/products/931) to the PCB. This currently shows battery and build information on boot up and then motor and sensor status during the match.

