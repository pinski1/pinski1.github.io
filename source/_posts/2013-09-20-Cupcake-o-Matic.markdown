---
layout: post
title: "Cupcake-o-Matic"
date: 2013-09-20 13:41
comments: true
categories: [Cupcake-o-Matic]
---
_This post is a copy of a log I wrote up [here](http://wiki.london.hackspace.org.uk/view/Project:Cupcake-o-Matic)._

The Makerbot Cupcake CNC was Makerbot's first foray into the 3D printer kit market, and one of the first 3D printer kits on that market. The Cupcake CNC takes a lot of it's design cues from 2 sources, the initial reprap 3D printer, [Darwin](http://reprap.org/wiki/Darwin), and the other from the need to make it laser cut-able. It was followed by the Thing-o-Matic which fixed many of the problems associated with the Cupcake CNC.

{% img https://lh3.googleusercontent.com/-r1cPZChABMQ/Ujx77GRrmeI/AAAAAAAACn0/Yjtqp7HYJvk/w471-h835-no/Cupcake_cnc_224.png 'The modified Cupcake' %}

##The Start
I bought a Cupcake CNC from Makerbot Industries in September 2009. I received Cupcake 224 from batch #6. I quickly assembled it and attempted a test print all in about 24 hours. It did not work. I could not get it to extrude plastic through the MK4 Plastruder reliably, when it did extrude I could then not get it to stick to the acrylic build platform. I left it be for a couple of years annoyed with what seemed a wasted purchase until January 2012 when I bought a MK5 drive gear from [KD85](http://kd85.com/) , the closest European distributor. I also added a heated build platform to my order to ensure the extrusion would stick to the bed.

These two upgrades allowed me to start printing reliably and I immediately started printing a new extruder to improve the MK4 plastruder. I was aiming to replace it with a stepper motor driven one so as to improve the build quality with a better model slicer such as Slic3r. I ended up printing out multiple extruder bodies as I repeatedly printed the wrong ones. One good side affect of this was that I also ended up printing out the rest of the [Huxley Pro](http://reprap.org/wiki/RepRapPro_Huxley) parts to match the NEMA14 stepper extruder body. A friend of mine has suggested he may find a use for it.

This vast amount of printing soon left me with very little of the 1lb natural ABS spool I received with the kit. I decided to buy some blue PLA as I thought it would be the ideal choice for future printing.

##The Modifications
I have made the following modifications to my Cupcake CNC:

###Updating the Electronics
The Cupcake originally came with the RepRap [Generation 3 Electronics](http://reprap.org/wiki/Generation_3) set:

* [RepRap Motherboard v1.2](http://reprap.org/wiki/Motherboard_1.2) x1
* [Extruder Controller v2.2](http://reprap.org/wiki/Extruder_Controller_2.2) x1
* [Stepper Motor Driver v2.3](http://reprap.org/wiki/Stepper_Motor_Driver_2.3) x3
* [Opto Endstop v2.1](http://reprap.org/wiki/OptoEndstop_2.1) x6

The idea was that as each board carried out a specific function it would be easy to design and easy to replace/fix. Unfortunately it wasn't ideal as everyone has 3 axes and an extruder and by separating the boards it took up a lot of space and required lots of messy connecting wires.

One problem is that the Motherboard could only support 3 stepper motors however most 3D printers started to use a fourth stepper motor to drive the extruder. This led to some interesting hacks to add another stepper control channel to the Motherboard, the most popular of these was the [3G 5D Shield](http://www.thingiverse.com/thing:11837). It took one of the end stops from each Stepper Motor Driver and used them to generate the Enable, Step and Direction signals for a fourth Stepper Motor Driver. I did in fact make the required modifications to my Motherboard, see [here](http://www.thingiverse.com/derivative:25852), but I never did get round to using it as I decided that I wanted to step away from having so many separate boards mounted on my Cupcake's chassis.

Whilst looking at alternatives for the electronics I came across the [Sanguinololu](http://reprap.org/wiki/Sanguinololu) controller board. Checking on eBay had a Sanguinololu v1.2+ listed, complete, for  &pound;89.00 + P&P. I decided that it would be better to just buy these electronics which would allow me to simply drop in popular firmwares such as Sprinter, Marlin or something more esoteric without having to modify everything so that it would work with a RepRap Motherboard. I simply have to edit the configuration files to match my Cupcake. Of course it is not as simple as plug and play, the new firmwares allow for things like acceleration and software based end stops so will require some tweaking. Nor do many of the connectors match, the stepper motors had 0.156" pitch connector but needed 0.1" connectors, it also meant that I could not use a PC PSU for power any more.

###Improving the Power Supply
The Cupcake electronics were designed to use a PC power supply as a cheap and readily available power source. A 300 Watt PSU costs very little and produces +12V and +5V directly, but due to the range of PC PSUs there is a lot of variation. Some PSUs needed a load on the +5V rail in order to produce voltages, even on the +12V rail, that were within tolerances. They also have to be enabled by connecting a pin on the large ATX connector to ground, otherwise only the standby +5V rail was powered. This mean that despite their initial attractiveness they caused a lot of problems, not to mention their large bulk.

Now most RepRaps use LED power supplies off of eBay, the typical standard is a +12V 30A model. This should be enough to power both the electronics and extruder but also a large 200x200mm heated print bed. It isn't quite as cheap as a PC PSU (about twice the price at &pound;20) it's certainly more compact and easier to use. One of the advantages of having a single board 3D printer controller is that it allows you to use a single regulator to produce the +5V rail for the micro-controller and logic circuits. I began to use the +12V LED PSU with my Cupcake-o-Matic and it worked very well with the Sanguinololu. It freed up a lot of space in the PSU mounting area underneath the build mechanism.

I also came into possession of a old HP laptop power supply. This PSU was rated at 19.5 Volts and could supply 11.8 Amps, the higher volts would mean that the motors could run more efficiently and the heater and heated bed would warm up quicker. The decrease in total current doesn't affect the Cupcake-o-Matic as it only has a 100x100mm heated bed.

###Adding a Cantilever Z Axis
In order to move the extruder up and down in the Z-axis the Cupcake CNC used a platform suspended on 4 M8 nuts on threaded rods. These threaded rods were linked together with a timing belt such that if the motor moved one step (1.8&deg;) then all the threaded rods would rotate by the same amount. This meant you could get an accuracy of 0.00625mm per step. Unfortunately this was very slow and relied on the threaded rod being exactly straight which it rarely was. What would happen is as the Z platform rose during a build one or more of the threaded rods would move in the x or y axes there by throwing off any precise accuracy in these axes. Another serious problem with this arrangement was the assumption that the 4 M8 nuts would always remain level and wouldn't jam. As a result the Z axis platform would be wonky which didn't help when printing.

To first fix this I printed a [Z-Wobble arrester without pin](http://www.thingiverse.com/thing:3091). It replaces a nut on the Z platform and allows the threaded rod to move back and forth without necessarily dragging the platform in that direction. This was fiddle to install as it required the removal of a nut trap on the platform and then the nut to be moved down a bit, whilst still levelling the bed. It was hard to tell how well this was working but I certainly felt my Cupcake CNC worked better when the arrester was installed on the wonkiest threaded rod. However this did not fix the problem of having to level the Z platform so I began to research on [Thingiverse](http://www.thingiverse.com/) for a good solution to solve my troubles permanently.

The first solution I found was a middle point solution, the [ACME rod upgrade for Makerbot Cupcake](http://www.thingiverse.com/thing:18849). You needed to replace the bent M8 threaded rods and nuts with an ACME screw thread on CNC machined rods, this would be both smooth and straight. This seems like a great idea but it requires purchasing &dollar;85 worth of ACME threaded rod from the USA, which would cost a ridiculous amount with overseas shipping. So I had to shelve this idea with some regret.

The Thing-o-Matic had come out for some time ago at this point and I was rather interested in the Z axis which was made up of a cantilevered platform which had 2 smooth rods for stability and a linear stepper motor for positioning. What with the Thing-o-Matic being rather similar to the Cupcake CNC I looked around for a way to add this cantilever in. The first examples I found require the back plate be removed and then the fitting of some large plastic parts to be fitted to accommodate the rods and motors. These struck me as being a little too focused on the need to be 3D printable to actually be usable. However I also found the [Cantilevered Z-Stage for Cupcake](http://www.thingiverse.com/thing:14492) which is a laser cut design in 5mm plywood. Unfortunately I've not been able to find anywhere in the UK that supplies, let alone cuts 5mm plywood, it seems to be a uniquely US thing. With that in mind I had to settle for acrylic which is available in a range of colours with a 5mm thickness.

{% img https://lh4.googleusercontent.com/-8V--yy1HxiM/Ujx8AkSu2UI/AAAAAAAACoc/Rt5bklo7a9k/w1358-h766-no/Cupcake_cantilever_z_axis.png 'A cantilever Z-axis in laser cut acrylic.' %}

###A Better Extruder
The Makerbot Cupcake CNCs from batch 6 came with a laser cut [Plastruder MK4](http://wiki.makerbot.com/plastruder-mk4). To drive the filament a T2.5 timing belt gear was used, it had 17 teeth which would bite into the filament, however the teeth were blunt so could not get a good grip on the filament reliably. This lead to the extruder jamming mid way through a print. When the Plastruder MK4 came out it was a new design but it was quickly superseded by improvements from the RepRap project.

These improvements took the form of the [Wade's Geared Extruder](http://reprap.org/wiki/Wade%27s_Geared_Extruder), a simplified version of [Adrian's Geared Extruder](http://reprap.org/wiki/Geared_Nema17_Extruder_Driver). The Wade's extruder is notable for its use of a single mounting block, a stepper motor, two gears and an idler assembly. The gears drive a 'Hobbed' bolt, this is a bolt where a thread has been cut across the bolt's circumference. The thread grips the filament but does not cut into it unnecessarily.

When I managed to get my MK4 working I printed out, among others, a [Greg's Hinged Accessible Extruder](http://www.thingiverse.com/thing:8252) as I wanted the best extruder. I was unsure as to what hot end I would end up with so ended up removing that part of the SCAD code. This probably wasn't my best idea as it makes mounting the Cupcake hot end very difficult and I've had to use some long M4 bolts and a piece of laser cut 3mm MDF to clamp it in place. This bodge, to be kind, can be seen in the image to the right. I'm hoping this bodge will last long enough for me to print an improved extruder, perhaps the latest modified Greg's but with mounting options for the 16mm diameter Cupcake hot end.

{% img https://lh6.googleusercontent.com/-hkS4tbBHrCM/Ujx7-USM01I/AAAAAAAACoQ/pxermp3R9wQ/w582-h835-no/Gregs_Extruder_mounted_in_cupcake.png 'The Gregs extruder setup.' %}

I'd also like to alter my hot end, at the moment it consists of the MK4 hotend but instead of nichrome wire wrapped around the brass barrel/nozzle I've added an aluminium heater block. This is a 20x20x10mm block of milled aluminium with a 5.6 ohm 2 Watt vitreous enamel resistor mounted inside. The thermistor is trapped on the outside with a small M3 washer screw. I'd love to reduce the amount of metal on my hot end and just use a nozzle mounted directly into the PTFE heat barrier and go back to using nichrome wire. This would let it heat up much faster but it would mean that it would need to be carefully controlled whilst extruding as it would lose heat much more easily. However I could use a [J-Head Nozzle](http://reprap.org/wiki/J_Head_Nozzle) hot end, these are popular due to their high reliability, unfortunately they can cost up to &pound;50 which is a lot for something so small.

##The Future
I'd like to add a few more upgrades to this "Cupcake-o-Matic" in the future namely:

* Add an LED ring around the hot end so as to easily see what is happening.
* Replace the hot end thermistor for a thermocouple to allow for a better control system.
* Add a webcam mount for videos or remote printing.
* Affix end stops to allow for automated homing.
* Exchange the Z axis drive with a lead screw instead of M8 rod (possibly TR8x1.5).
* Tune the whole 3D printer for quieter printing.

At the moment I view 3D printing akin to Linux. In order to be working on the cool parts you MUST have a rock solid back up machine so that you can rescue the cutting edge machine when needs be. I want my Cupcake-o-Matic to be my back-up machine.
