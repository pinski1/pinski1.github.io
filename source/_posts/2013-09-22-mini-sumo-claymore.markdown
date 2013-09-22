---
layout: post
title: "Mini-Sumo Claymore"
date: 2013-09-22 14:39
comments: true
categories: [Claymore]
---
Whilst visiting the Birmingham [TechFest](https://www.bcu.ac.uk/tee/events/techfest) in 2011 with a few classmates from university I saw people with small autonomous robots, the robots were attempting to push each other out of a black circle. It turned out that this was a mini-sumo competition. The robots had to be autonomous, weight less than 500 grams and must fit in a 100mm cube. This sounded like an interesting challenge so I have tried to make my own.

<!-- youtube a video of a competition -->

###Rules###
The official rules are listed [here in PDF](http://www.tic.ac.uk/micromouse/RULES/MiniSumoRules.pdf) however the important points are:

* Matches take place in a Dohyo
  * This is a circular arena with a diameter of 77 centimetres painted black
  * It has a white line on the border 2.5 centimetres wide
  * There is nothing else surrounding the Dohyo for at least 50 centimetres
* The robot must:
  * Fit in a box 10 centimetres wide and 10 centimetres deep, there is no height restriction
  * It must not weight more than 500 grams
  * Autonomous robots must begin a match 5 seconds after a button is pressed
  * No jammers or damaging weapons allowed
    * But a flipper is not ruled out...

##Objectives##
Like The Unnamed I've set down some initial starting goals:

* It must weight 500 grams
* Fit inside the 100 mm cube
* Try and be less than 30mm high
* I want to focus on intelligence rather than brute force
  * But it helps to have brute force too
* Use 2 opponent sensors and 2 edge sensors
* Use 'modern' construction methods
  * This includes 3D printers and laser cutters
 
##Parts##
I started by collecting some parts for the robot. Normally I try and fully design a robot before ordering parts, this stops me from wasting money on things that won't fit with the final design, however more often than now I find myself never quite finishing it. This time I decided that as the robot will be rather small I may as well buy parts that look like they'll fit and then design a chassis around them.

###Drive System###
I figured the first step would be to organise a decent drive system after all the point of this robot is to push other robots out of the ring, it needs to be a solid system as it is my only offensive weapon. I started by trying to find motors from Faulhaber or Maxxon, both very high quality, very high cost precision motors. Googling for Faulhaber lead me to a [Robot Room](http://www.robotroom.com/FaulhaberGearmotor.html) post which then lead me to a surplus website selling them [here](http://www.voti.nl/shop/catalog.html?MOT-20-2). A couple of important things to note about these motors which made them ideal; they have pre-built right angle gearboxes already attached, they have encoders mounted on the rear to count rotations and while they're rated for 6 Volts they seem capable of handling ~12 Volts.

I'm planning to run the motors in a closed loop control system, this means that rather than setting a PWM value as is the standard I will instead set a counts per interval then the code will attempt to match that value by varying the speed of the motor. This means that should something slow me down, either battery levels draining or an opponent in front of me the controller will increase the PWM value until the counts per interval matches. The only downside to this method is that it is more complex and requires a decently powerful microcontroller, however I was planning to add one anyway so this is acceptable.

The motors at 6 Volts only rotate 80 times a minute or 1.3 times a second which is not very quick at all, if I instead run these motors at 12 Volts then I should get 170 Rotations per Minute (RPM) or 2.8 times a second. This is much better and coupled with the right wheels will make for a fast robot. To provide this 12 Volts I need a powerful but compact battery, I'm not too concerned about weight, but the smaller I can make my robot the harder it will be to sense. With that in mind I've chosen a Lithium Polymer (LiPoly) battery made up of 3 cells for a battery voltage of +11.1 Volts and a capacity of 800 milliamp hours, it measures 75mm x 23mm x 15mm and weights under 63 grams.

The final component of the drive system are the wheels. I want a robot that is around 30mm high so cannot choose wheels larger than that, they also need to maintain good grip on the floor to help push other robots around. I ended up buying a pair of Solarbotics [RW2 wheels](http://www.technobotsonline.com/solarbotics-rw2-aluminium-wheel-for-3mm-axle.html). These have a diameter of 31.2mm which translates to a top speed of 277 mm per second which would be fast enough for this purpose.

###Sensors###
The robot will require 2 types of sensors, one set to detect opponents and manoeuvre them off the edge of the Dohyo and another set to detect the edge of the Dohyo and avoid it.

The distance sensors should have a long range, but to avoid detecting things outside the Dohyo the maximum range must be limited to 50 centimetres + 2.5 centimetres = 52.5 centimetres but should be more than 77 centimetres  - 10 centimetres - 10 centimetres = 57 centimetres to ensure that the opponent can be sensed at all ranges. The minimum range should be as close to 0 centimetres as possible to avoid missing the opponent when it is directly in front. The (IR) distance sensors from Sharp are very popular as they fit nicely into this range bracket. I've chosen the [GP2Y0D340K](http://sharp-world.com/products/device/lineup/data/pdf/datasheet/gp2y0d340k_e.pdf) as it has a minimum range of 1.5 centimetres and a maximum range of 40-42.5 centimetres. The maximum range should be acceptable as the robot will be moving around as it scans for the opponent which will reduce the chances of the worst case scenario happening.

The edge detection sensors don't need quite so much range but they need to detect the change from the black Dohyo floor to the white edge border cleanly. The edge sensors I choose will need to sense the change quickly, if the robot is travelling at its top speed of 277 millimetres per second then the robot has 1.1 seconds to come to a halt to avoid driving off the edge. The popular sensors for this task are the [TCRT1000](http://www.vishay.com/docs/83752/tcrt1000.pdf) from Vishay. The TCRT1000 combines an Infra-Red (IR) transmitter receiver pair in a single package, correctly biased they be set up to give a digital output that ranges when the border is detected, this can then set off an interrupt to stop the robot.

###Logic###
To control the robot I will need some logic to receive inputs, process them and then act upon them, as I want the strength of my robot to be the processor this is where I need to choose a fast and powerful microcontroller. I will use the faster microcontroller to get inside my opponents Observe, Orientate, Decide, Act loop ([OODA](http://en.wikipedia.org/wiki/OODA_loop)), this is done by cycling through the loop faster than the opponent, causing the opponent to act upon a situation that has already changed.

For fast powerful microcontrollers that are still compact the ARM architecture is the most prevalent and of these I have the most experience with the [LPC1343](http://www.nxp.com/products/microcontrollers/cortex_m3/LPC1343FBD48.html). This will be a good choice as it has enough input/output pins for the robot and runs at 72 Megahertz which will allow it to react quickly to changes in its environment. Unfortunately it does not have any non-volatile memory so I may have to include an external EEPROM chip to provide the memory that will exist between power cycles.

The motors will require a specialised chip to drive them as the microcontroller outputs will not be sufficient. This chip will need to work with a +11.1 Volt supply from the battery for the motors and accept control signals  that are +3.3 Volts. The motors will pull approximately 0.4 Amps when stalled so the chip ideally needs to be able to handle approximately 1 Amp of current to be safe. There are a few available chips such as the [TB6612FNG](http://www.toshiba-components.com/docs/linear/TB6612FNG_en_datasheet.pdf) or the [A4950](www.allegromicro.com/~/Media/Files/Datasheets/A4950-Datasheet.ashx) I will choose a suitable one as the space constraints are discovered.

The LPC1343 requires a +3.3 Volt power supply, the sensors require a +5 Volt power supply, I have a +11.1 Volts battery on my robot, this means I will need to include 2 stages of regulation, one to +5V and another to +3V3. The best way to drop the +11.1 Volts down to +5 Volts is to use a Switch Mode Power Supply (SMPS), these are typically very efficient and generate very little heat. I will then use a linear regulator to drop from +5 Volts down to +3.3 Volts this will give me a very stable, noise free supply for the sensitive microcontroller.


###Chassis###
These disparate parts require a chassis to act as glue holding them together. As none of the robots opponents will be able to cause physical damage there is no need to armour my robot however the chassis will need to be stiff enough to withstand pushing and being pushed by other robots. By making at low as possible I reduce the cross sectional area that an opponent can detect, depending on my opponents sensors I can also construct my robot to further reduce my chances of being detected. For robots that use sonar sensors I can either deflect the ultrasound or absorb it to reduce the returned ultrasound levels, for IR sensors I can do the same but with different materials. I however will not construct my robot to take advantage of this in the first mini-sumo, however for my next robot I may look into "stealth" techniques.

The minimum height I can build my robot is set by my wheels, 31.2mm, the minimum width of my robot is set by the width of 2 wheels, 2 motors and the battery, 87mm, the minimum length of my robot is set by the length of the motors, 72mm. The total weight of those 5 components is ~200 grams. This means I have approximately 300 grams to fit the logic circuitry, sensors and chassis in. To accurately plan how I would do this I used SketchUp as a Computer Aided Design (CAD) program, it's not as functional as Solidworks or AutoCAD but it is far easier to use.

After many design ideas and tweaks I came up with an idea:
{% img https://lh6.googleusercontent.com/-TnAG8U0xAqc/Uj9I1sREXNI/AAAAAAAACro/a-_sV7KKI7o/w866-h755-no/Claymore_front_iso_v4.1.png %}

It was to be built out of laser cut 6mm plastic, ideally Delrin, Acetal, or Polycarbonate (preferably not acrylic) using Pettis joints to hold it together with hex cap screw and square nuts. These joins have proven them selves to be very rigid and very easy to cut out with a laser cutter.

{% img https://lh3.googleusercontent.com/HVLwRU5L3vmTO_1dLBvSWOXqMmJwF2gdlz_CROpXohg=w663-h498-no %}

The motors, not having any mounting attachments, would be zip-tied in custom 3D printed motor clips which had nut traps so they could be bolted onto the top plate of the chassis. This would form a monocoque structure which would be easy to fabricate, construct and dismantle for repairs/upgrades.

{% img https://lh4.googleusercontent.com/-vRsUFuJQyCU/Uj9I1n4VsiI/AAAAAAAACrg/CcDRTmb8KPA/w994-h835-no/Claymore_rear_iso_v4.1.png %}

To aid in the pushing of opponents a metal plate was added, this had a lip on the front that would protrude out and down. The idea being that as an opponent was found, engaged and pushed the lip would get underneath the opponent and raise their wheels reducing the contact with the ground degrading the grip.

##Testing##
Once version 1 of the chassis was laser cut and the parts installed the first problem was noted, the chassis was in fact cut out of 5mm acrylic, the design was for 6mm plastic. This difference was enough to completely ruin the strength of the structure however it was acceptable enough for testing. Another initial problem was that I was already using my LPC1343 [development board](http://www.universalair.co.uk/control/forebrain) in another project and could not remove it however I had recently bought a [Teensy 3](http://www.pjrc.com/store/teensy3.html) from the [Kickstarter](http://www.kickstarter.com/). To control the motors I use a TB6612FNG [breakout board](https://www.sparkfun.com/products/9457) I had available.

{% img https://lh5.googleusercontent.com/-kgKjf0jEcWQ/Uj78qt4TjJI/AAAAAAAACq4/GfYSNinDPf8/w1358-h766-no/2013-08-09+07.45.00.jpg %}

I connected everything up, wrote a quick program to control the motors and loaded it onto the Teensy 3. The first problem was the amount of noise that came from the motors, I thought something had gone horribly wrong, they shouldn't be that loud! Looking at the information on the Teensy 3's PWM it turns out the default frequency is 488.28 Hertz, this is far too slow and is well with in the human audible range. I changed the frequency to 18 kilohertz this is at the very top end of the audible frequency range and reduced the noise completely.
I've started to implement the code to read the number of counts per interval however I've yet to verify the numbers nor do anything useful with them.

``` cpp Claymore test code for Teensy 3
/* Pin Map */
#define MOTOR_L_IN_1    16
#define MOTOR_L_IN_2    15
#define MOTOR_L_PWM     22 
#define MOTOR_STBY      14
#define MOTOR_R_IN_1    17
#define MOTOR_R_IN_2    18
#define MOTOR_R_PWM     23  
#define MOTOR_L_A       11
#define MOTOR_L_B       12
#define MOTOR_R_A       2
#define MOTOR_R_B       3
#define LED_STATUS      13
#define SENSOR_OPP_L    0
#define SENSOR_OPP_R    0
#define SENSOR_FLR_L    0
#define SENSOR_FLR_R    0
#define RUN             0


/* Global Variables */
volatile unsigned long leftCounter = 0x00000000UL;
volatile unsigned long rightCounter = 0x00000000UL;
volatile char oldLeft, oldRight, newLeft = 0, newRight = 0;
static char encoderQuadrature[16] = {0,-1,1,2,1,0,2,-1,-1,2,0,1,2,1,-1,0};

/* Global Functions */
void leftMotorA(void) {
  oldLeft = newLeft;
  newLeft = (digitalRead(MOTOR_L_A) * 2) + digitalRead(MOTOR_L_B);
  leftCounter += encoderQuadrature[(oldLeft * 4) + newLeft];  
}

void leftMotorB(void) {
  oldLeft = newLeft;
  newLeft = (digitalRead(MOTOR_L_A) * 2) + digitalRead(MOTOR_L_B);
  leftCounter += encoderQuadrature[(oldLeft * 4) + newLeft]; 
}

void rightMotorA(void) {
  oldRight = newRight;
  newRight = (digitalRead(MOTOR_R_A) * 2) + digitalRead(MOTOR_R_B);
  rightCounter += encoderQuadrature[(oldRight * 4) + newRight]; 
}
void rightMotorB(void) {
  oldRight = newRight;
  newRight = (digitalRead(MOTOR_R_A) * 2) + digitalRead(MOTOR_R_B);
  rightCounter += encoderQuadrature[(oldRight * 4) + newRight]; 
}

void getMotorSpeed(int &leftSpeed, int &rightSpeed) {
  static unsigned long elapsed = 0x00000000UL;
  unsigned int localLeftCounter = leftCounter;
  unsigned int localRightCounter = rightCounter;
  leftCounter = 0x00UL;
  rightCounter = 0x00UL;
  elapsed = micros() - elapsed;
  leftSpeed = (localLeftCounter * 60000000)/elapsed;
  rightSpeed = (localRightCounter * 60000000)/elapsed;
  return; 
}

void setMotorSpeed(int leftSpeed, int rightSpeed) {
  if(leftSpeed > 0)
  {
    digitalWrite(MOTOR_L_IN_1, LOW);
    digitalWrite(MOTOR_L_IN_2, HIGH);
  }
  else if(leftSpeed < 0)
  {
    digitalWrite(MOTOR_L_IN_1, HIGH);
    digitalWrite(MOTOR_L_IN_2, LOW);
  }
  else
  {
    digitalWrite(MOTOR_L_IN_1, HIGH);
    digitalWrite(MOTOR_L_IN_2, HIGH);
  }
  analogWrite(MOTOR_L_PWM, leftSpeed);

  if(rightSpeed > 0)
  {
    digitalWrite(MOTOR_R_IN_1, LOW);
    digitalWrite(MOTOR_R_IN_2, HIGH);
  }
  else if(rightSpeed < 0)
  {
    digitalWrite(MOTOR_R_IN_1, HIGH);
    digitalWrite(MOTOR_R_IN_2, LOW);
  }
  else
  {
    digitalWrite(MOTOR_R_IN_1, HIGH);
    digitalWrite(MOTOR_R_IN_2, HIGH);
  }
  analogWrite(MOTOR_R_PWM, rightSpeed);
  
  return;
}


void setup(void) {
  Serial.begin(115200);

  pinMode(MOTOR_L_IN_1, OUTPUT);
  pinMode(MOTOR_L_IN_2, OUTPUT);
  pinMode(MOTOR_L_PWM, OUTPUT);
  pinMode(MOTOR_R_IN_1, OUTPUT);
  pinMode(MOTOR_R_IN_2, OUTPUT);
  pinMode(MOTOR_L_PWM, OUTPUT);
  pinMode(MOTOR_STBY, OUTPUT);
  pinMode(LED_STATUS, OUTPUT);
  pinMode(MOTOR_L_A, INPUT);
  pinMode(MOTOR_L_B, INPUT);
  pinMode(MOTOR_R_A, INPUT);
  pinMode(MOTOR_R_B, INPUT);
  pinMode(SENSOR_OPP_L, INPUT);
  pinMode(SENSOR_OPP_R, INPUT);
  pinMode(SENSOR_FLR_L, INPUT);
  pinMode(SENSOR_FLR_R, INPUT);
  pinMode(RUN, INPUT_PULLUP);

  digitalWrite(MOTOR_L_IN_1, LOW);
  digitalWrite(MOTOR_L_IN_2, LOW);
  digitalWrite(MOTOR_L_PWM, LOW);
  digitalWrite(MOTOR_R_IN_1, LOW);
  digitalWrite(MOTOR_R_IN_2, LOW);
  digitalWrite(MOTOR_R_PWM, LOW);
  digitalWrite(MOTOR_STBY, LOW);
  digitalWrite(LED_STATUS, LOW);

  attachInterrupt(MOTOR_L_A, leftMotorA, CHANGE);
  attachInterrupt(MOTOR_L_B, leftMotorB, CHANGE);
  attachInterrupt(MOTOR_R_A, rightMotorA, CHANGE);
  attachInterrupt(MOTOR_R_B, rightMotorB, CHANGE);
  
  analogWriteFrequency(MOTOR_L_PWM, 18000);

}

void loop(void) {
  int left, right;

  digitalWrite(MOTOR_STBY, HIGH); // enable motors
  setMotorSpeed(200, 200);

  while(1)
  {
    getMotorSpeed(left, right);
    Serial.print("\f\rCounts/minute is: ");
    Serial.print(right, DEC);
    digitalWrite(LED_STATUS, !digitalRead(LED_STATUS));
    delay(2000);
  }
}
```

##Next Steps##
The next steps forward from this point would be to sort out the chassis, either re-design it to take advantage of 5mm plastics or get it cut from 6mm plastic. Once I've finalised my chassis design and actually have it I then can finish the logic board layout and get it sent off to be manufactured. Another step I can take in parallel would be see about implementing the closed loop control in the Teensy 3 or using my LPC1343 development board. I'm planning on running this robot at the June 2014 Birmingham Tech Fest so I'll consider May 2014 to be my final deadline for a completed robot.
