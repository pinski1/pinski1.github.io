---
layout: post
title: "A Chassis for Claymore"
date: 2013-09-27 14:52
comments: true
published: false
categories: [Cupcake-o-Matic,Claymore] 
---
The next step in Claymore's development is to get a complete chassis cut out. My choice of 6mm laser cut plastic limits me to one material, clear cast acrylic. Now acrylic is a brittle material so it has a tendency to crack around sharp corners that have been cut into it. To mitigate the risk of the acrylic cracking it is recommended to round cuts such that there are no sharp 90&deg; cuts, there is more information [here](http://support.ponoko.com/entries/498833-How-to-make-interlocking-acrylic-designs). However it is very easy to laser cut so has become a popular material. The place where I will get the laser cutting done, [Blueprint Modelshop](http://www.blueprintmodel.co.uk/), have a minimum order size of 450mm x 310mm which is much larger than a chassis so I need to add extra items to fill it up so as to not waste the area. It just so happens that I need another thing laser cut and that is a power entry support for the Cupcake-o-Matic.

##Claymore Chassis
With the chassis design largely tested by cutting version 1 out of 5mm acrylic only minor changes will need to be made in order to perfect it.

###Corner Radiusing
The link to Ponoko about corner radii above actually has a Pettis join, something I use plenty of in my design, as their second image. Most notably about that image are the cracks that the nut causes in the acrylic that start at the sharp corners. The post goes on to entail ways of avoiding this, namely adding a small, 0.5 mm is recommended, radii at each corner. That is something I've been meaning ot do on version 1 how ever it would take some time to do and would make modifying the rest of design later a pain. This time I'll make sire I add it to all the corners that will be under stress.

<!-- add an image? -->

###Laser Kerf
When you cut a material with a saw some of material is removed from both parts, this forms the dust, e.g. sawdust. The amount of material removed is governed by the width of the teeth of the saw, the kerf. All methods of cutting have a kerf although it can vary widely. When designing parts to fit together tightly the tolerances of the cuts are important and 

[linky](http://www.cutlasercut.com/resources/tips-and-advice/what-is-laser-kerf)
0.21mm for 6mm acrylic

<!-- images -->

###Colouring

* Clear acrylic isn't very stealthy/low observation so I need to improve that
* Could:
  * use black acrylic
  * paint it black
  * use black tape
Using Matt Black Car Vinyl as it is rather cheap on eBay (99p for 200mm x 100mm). It come sticky backed, and will hopefully further reduce the chances of cracks spreading

<!-- link to eBay? -->

###Adding a Wedge
Something that I meant to add to version 1 of the chassis but completely forgot about was the steel wedge. I'm still not entirely sure how to add it to version 2 of the design.


##Cupcake-o-Matic Power Entry support

* old cupcake has a large PC PSU bay underneath the build surface X Y axis mechanism
* master plan is to install PSU, RPi & Sanguinololu electronics in old PC PSU bay
  * also to route all wiring neatly down into this bay
* plan to add IEC socket + fuse + switch to Cupcake-o-matic back entry
* the rest left open to allow easy access to RPi & Sanguinololu cable connectors

<!-- images out 