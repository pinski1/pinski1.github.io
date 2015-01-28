---
layout: post
title: "Rules of Thumb for Designing 4-bar Lifters"
date: 2013-09-25 21:19
comments: true
published: true
categories: [The Unnamed]
---
The main weapon for The Unnamed is a 4-bar lifter. It takes its name from the [Four-bar Linkage](http://en.wikipedia.org/wiki/Four-bar_linkage) used to move the lifting arm

One of the most famous 4-bar lifter robots is the American Biohazard, it coupled a very low robot with the ability to lift the opponent very high. Below is a video of it defeating Greenspan in May 2002.
 
<iframe width="600" height="450" src="https://www.youtube.com/embed/zf3wN87oY0o" frameborder="0" allowfullscreen></iframe>

As I'm trying to emulate the weapon of Biohazard for The Unnamed I need design my own 4-bar lifter.

##Design##
While it is called a 4-bar linkage one of the bars is actually the robots chassis so this is fixed from a design point of view. The other 3 bars however are very much up to the designer, and because of this the number of variables it is very hard to work out the "best" design.

I began my design with a number of aims:

* It needs to fit into an area roughly 300mm by 50mm to stay inside the robot
* It needs to be reasonably fast, ~2 seconds to complete a lift

{% img https://lh4.googleusercontent.com/-DdzypPtyBzQ/VMlC9p-gbHI/AAAAAAAAC4A/nAhbY0O4txU/w860-h685-no/Four%2BBar%2B-%2Bstarting%2Bscreen.png %}

To do this I used SketchUp to position the bars which allowed me to easily get the lengths and angles. These lengths and angles where then inputted into "Four Bar", a 4-bar lifter calculated written by Adam Wrigley and available from [here](http://www.totalinsanity.net/tut/mechanical/4barfrontbar.php).

*Note: This software is old and will need an older version of dotNet in order to install.*

###Rules of Thumb###
After playing around with it a lot I've decided on these rules of thumb, I'm not a mechanical engineer so there is no theoretical justification, just what's happened when I've altered it.

* The rear bar controls how far forwards or backwards the lifter throws
  * if it's at a 45&deg; angle then you will have a vertical lift with little forward or backwards throw
  * if it's less than a 45&deg; angle then the lifter blade will move forward during the lift
  * if it's more than a 45&deg; angle then the lifter blade will move backwards during the lift
* The forward bar controls the height the lifter reaches at the end of a throw
  * the longer the forward bar is, the higher the lifter will be able to reach
  * the shorter the forward bar is, the less height the lifter will be able to reach
  
After spending quite some time playing around with the lengths and angles I finally came up with a design that produced a result I was happy with.  
  
{% img https://lh3.googleusercontent.com/-ZY3PFmmdkEE/VMlC9UKsb_I/AAAAAAAAC38/ieWMySVafTc/w853-h685-no/Four%2BBar%2B-%2Bfinal%2Bresult.png %}

*Note: The calculator uses the units that you enter, in my case millimetres and kilograms.*

The drawing on the left shows the lowered position in red and the raised position in blue. The tip of the lifter is traced through the entire range with the pink line. As you can see the lifter raises 22.5 centimetres and also moves forwards by 5.0 centimetres, this the advantage of using a 4-bar linkage compared to a simpler flipper.

The graph on the right shows that the front arm is originally 12&deg; from horizontal and rotates until it is 58&deg; from the horizontal. The height increases linearly with rotation which should help the control of the lifter. The torque curve is constant around 39 Newton Meters for the majority of the lifter's movement however for the last 7 centimetres the torque rises very sharply to 129 Newton Meters. The torque figures are calculated assuming a 15 kilogramme weight (opponent) on the tip of the lifter however increases to this mass (multiple opponents, the arena wall) will cause the torque requirements to increase.

##Powering the Lifter##
Of course just having a mechanical design for the lifter bars is great, most of the work in fact, however I still need a way to power the lifter. Using the calculator above I need to provide more than 150 Newton metres of torque to the front arm of the lifter. Looking back to Biohazard it uses 2 electronic linear actuators to push against the front arms.

###Pneumatics###
One of the main advantages of lifters is that they are very similar to a flipper but without the high impulse power that can be provided by pneumatics. It would be possible to drive the 4-bar lifter with a pneumatic ram however I don't feel like I have enough knowledge and understanding of pneumatic systems to do this safely and will save this for a future robot.

###Motors###
An alternative to linear actuators is to have a very high torque motor to drive one of the linkages directly. This was the approach taken by Charles Guan with his [Test Bot 4.5 MCE](http://www.etotheipiplusone.net/?cat=30). This would be more difficult for me to impliment as I do not have lots of space and I need to source or design a suitable gear box. I will probably avoid this approach.

###Linear Actuators###
These are a popular method of driving lifters, although they're much rarer in HeavyWeight robots, Biohazard was an exception rather than a rule. A recent featherweight combat robot that made use of a lifter powered by linear actuators was [Loki](http://www.fightingrobots.co.uk/threads/11330-team-pasty-build-diary-loki/) who did quite well for themselves in the 2014 Featherweight Championships.

Looking on [Gimson Robotics](http://www.gimsonrobotics.co.uk/) they have the [GLA750-S](http://www.gimsonrobotics.co.uk/GLA-S_linear_actuator.html) which seems like exactly what I need. It is capable of 2300 Newtons of force, 50 millimetres of throw, and a top speed of 37 millimetres per second. However I will need more than just a motor controller to drive this as I need it to stop at the lower and upper end points else it will lock itself together.

##Control##
The GLA750-S uses the same motor (RS 550) as the GR02 gear motors, therefore it makes a bit of sense to use the same motor controller, the TZ-85A. However I need to add some way of stopping the linear actuator when it has reached the minimum and maximum lengths. Typically actuator have end stop switches built in which are connected as shown below in the image from Gimson Robotics:

{% img https://lh5.googleusercontent.com/-tc0a_J3iFf8/VMlggr23neI/AAAAAAAAC5E/gdtb71Crl4Y/w589-h258-no/gla_limit-switch-circuit.jpg %}

However for the GLA750-S the motor current is too high and will cause the switches to fail, even under no load conditions. This means I'd have to construct my own limit switches, most likely due to the currents the limit switches would then operate relays or MOSFETs to limit the motor.

Another option is to further modify the TZ-85A but not re-programming with the stock brushed DC motor control firmware. Instead further modifying the firmware to accept an analogue input and connecting a variable resistor or potentiometer to it. The potentiometer would vary in relation to the position of the linear actuator and would be in effect be a super sized servo. The advantage of this is that the RC pulses no longer specify a speed but a position which the linear actuator will always try and match. This way should external forces move the actuator out of position, it would apply more power (if available) until it matched the requested position again. This would require understanding the current modified firmware as well as extensive testing. Any mistakes could cause the linear actuator to irreparably damage itself.

That would be bad.
