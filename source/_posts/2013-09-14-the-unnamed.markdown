---
layout: post
title: "The Unnamed"
date: 2013-09-14 09:51
comments: true
categories: [The Unnamed]
---
I've been a great fan of Robot Wars since 1998 leading to running a robot club in secondary school. None of the feather weight robots that were being built really got anywhere, and considering they were largely built out of MDF they weren't going to be very robust. However this did plant a seed in my mind which has been constantly growing and nagging. The MDF robots hit the painful snag of not having a decent way to mount wheels to the windscreen wiper motors and attempts to use the Rex's Robot Challenge method of washers and wood never worked well enough.

Now I've moved on a little bit and got a proper job I think it's time to have another go with 15 years of added experience.

##Scope##
I've got an electronic engineering degree and if that and my work experience have taught me one thing, requirements are king. With that in mind here I go:

* To design, build and compete with a 12-13.6kg robot
* To spend less than &pound;500 on parts
* To increase my mechanical knowledge
* To enjoy the fact my 100s of hours of work may well be destroyed in seconds by a full body spinner.

##Description##
Now in order to fulfil the compete part of that specification I want something that is reasonably simple and robust, no esoteric weapons. Cutting and impact weapons always seemed to lack any visible damage element (heavy weight Razor aside). This leaves spinners and flippers and I much prefer Chaos 2 to Hypnodisk...

I've been a great fan of Charles Guan's [blog](http://www.etotheipiplusone.net/) and I'm going to heavily plagiarise from his designs, after all he is a mechanical engineer from MIT who builds successful featherweights. Unfortunately I do not have access to quite his wealth of machine tools, I have access to a friend's combination lathe & mill, a few mechanical engineers to run ideas by and that's about it. I personally own a hacksaw, a 14V drill and 1 working 3D printer.

Pneumatics are something I'm totally unfamiliar with and so I feel for safety I will leave them well alone, instead I shall use a 4 bar lifter. Four bar lifters seem to be complicated to design but straightforward to construct which certainly fits my limitations. I'll couple that with some high power, high speed drill motors with gear boxes in an attempt to mix "Test Bot 4 SP1" and "Null Hypothesis" from Charles Guan.

##The Ingredients##
* 20mm thick Ultra High Molecular Weight PolyEthylene (UHMWPE) for the chassis frame held together with M8 bolts and threaded inserts
* 0.5mm tool steel (or better) side armour
* 3mm steel (or better) armour for front and rear
* 3mm polycarbonate for the top & bottom armour held with M5 bolts and threaded inserts
* 2 off Gimson GR02 18V 24:1 motors for drive
* 4 off ~75mmx20mm wheels, either 3" no names or Banebots 2-7/8"
* 4 off 5mm pitch, 9mm HTD belt & pulleys to drive 2 wheels per motor
* 1 off 6S1P 22.2V 5000mAh 35-70C Turnigy Nano-tech LiPoly battery pack
* 1 off custom motor & weapon controller with magic
* 1 off 2.4GHz RC set (suggestions welcome)
* 1 off weapon, 4 bar lifter, tending towards a linear actuator from Gimson.

##The Result##
This is the work of a few nights of playing around in SketchUp:
{% img assets/images/The_Unnamed_Featherweight_20-08-2013.png 'The Unnamed' 'The first render of The Unnamed' %}

The side armour will consist of 0.5mm of tool steel mounted to a 20mm thick panel of UHMWPE. I'm hoping that this composite armour should be capable of surviving spinner attacks because the tool steel should stop the teeth from biting very well and the UHMWPE will flex absorbing some of the spinners impact. Of course it's fairly replaceable and I may redesign it in future as I finalise it.

I've chosen polycarbonate for the top and bottom as I think featureless steel boxes are pretty boring to look at even if they are painted amazingly. I may have to thicken up the polycarbonate in a later redesign but it should be both strong and transparent enough for this robot.

The [Gimson](http://www.gimsonrobotics.co.uk/) GR02 motors will be the 18 Volt version with a 24:1 gear ratio output. I chose this rather than the 36:1 as while a ratio of 36:1 gave me a faster top speed, it had slower acceleration, the 24:1 gives me a faster acceleration which I feel will be better suited to arena combat. With 75mm wheels I'm estimating a top speed of around 3.2 metres per second, the number will go down due to the motors being loaded, but at the same time I'll be overvolting them from 18 Volts to 22 Volts.

Hopefully once I get an idea of how I'm going to mount the wheels and the dimensions of the lifter I should be able to push forward and order the parts. The current running cost is an estimated &pound;350 minus the cost of steel armour, the lifter and the electronics. The current running weight is 9.7kg all included however I expect that to creep up as the wheels and lifter arrangements are finalised.

