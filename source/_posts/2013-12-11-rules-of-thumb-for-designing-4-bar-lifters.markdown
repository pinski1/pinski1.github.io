---
layout: post
title: "Rules of Thumb for Designing 4-bar Lifters"
date: 2013-12-11 21:19
comments: true
categories: [The Unnamed]
---
The main weapon for The Unnamed is a 4-bar lifter. It takes its name from the [Four-bar Linkage](http://en.wikipedia.org/wiki/Four-bar_linkage) used to move the lifting arm


One of the most famous 4-bar lifter robots is the American Biohazard, it coupled a very low robot with a very high lift. Below is a video of it defeating Greenspan in May 2002.
 
<iframe width="420" height="315" src="//www.youtube.com/embed/zf3wN87oY0o" frameborder="0" allowfullscreen></iframe>

As I'm trying to emulate the weapon of Biohazard for The Unnamed I need design my own 4-bar lifter.

##Design##
While it is called a 4-bar linkage one of the bars is actually the robots chassis so this is fixed from a design point of view. The other 3 bars however are very much up to the designer, and because of this the number of variables it is very hard to work out the "best" design.

I began my design with a number of aims:

* It needs to fit into an area roughly 300mm by 50mm to stay inside the robot
* It needs to be reasonably fast, ~2 seconds to complete a lift

To do this I used SketchUp to position the bars which allowed me to easily get the lengths and angles. These lengths and angles where then inputted into "Four Bar", a 4-bar lifter calculated written by Adam Wrigley and available from [here](http://www.totalinsanity.net/tut/mechanical/4barfrontbar.php).

*Note: This software is old and will need an older version of dotNet in order to install.*

<!-- image -->





###Rules of Thumb###
After playing around with it a lot I've decided on these rules of thumb, I'm not a mechanical engineer so there is no theoretical justification, just what's happened when I've altered it.

* The rear bar controls how far forwards or backwards the lifter throws
  * if it's at a 45&deg; angle then you will have a vertical lift with little forward or backwards throw
  * if it's less than a 45&deg; angle then the lifter blade will move forward during the lift
  * if it's more than a 45&deg; angle then the lifter blade will move backwards during the lift
* The forward bar controls the height the lifter reaches at the end of a throw
  * the longer the foward bar is, the higher the lifter will be able to reach
  * the shorter the foward bar is, the lower the lifter will be able to reach

##Powering the Lifter##
Of course just having a mechanical design for the lifter bars is great, most of the work in fact, however you will need a way to power the lifter. Looking back to Biohazard

###Actuators###
<!-- biohazard, loki etc -->


###Motors###

<!-- test bot 4.5 MCE, see http://www.etotheipiplusone.net/?cat=30 -->


###Pneumatics###
One of the main advantages of lifters is that they are very similar to a flipper but without the high impulse power that can be provided by pneumatics.

##Control##

