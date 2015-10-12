---
layout: post
title: "eFuse for Robotics"
date: 2015-10-12 21:27
comments: true
categories: 
---
*A solid-state electronic alternative to discrete fuses*

When I was building my featherweight combat robot, [The Unnamed](http://wiresandbits.co.uk/blog/categories/the-unnamed/), I had to include a fuse. I decided that the best way to do this was to use an automotive [Maxi fuse](https://en.wikipedia.org/wiki/Fuse_(automotive)) as a removable link. As Maxi fuses are cartridge fuses this would make inserting/removing the fuse very easy, and should it ever blow it would be quite simple to replace it.

Unfortunately when I would plug the fuse in it would generate lots of arcs and sparking. This was because the 3 Tz-85A speed controllers each have 2x 220&micro;F capacitors fora total of 1320&micro;F. This means that for an instant (6.6microseconds) the current draw on the battery is 3700Amps. This may damage the battery and was certainly damaging the fuse contacts.

To solve this I decided to build an electronic fuse. Electronic fuses are also known as hot-swaps, load switches or crcuit breakers. They can trip on over current, over voltage, under voltage and will clamp the initial current draw (known as inrush current). Rather than build the circuitry entirely from scratch I used a chip from Texas instruments, the [LM5069](http://www.ti.com/product/lm5069). I just had to add a transistor, a sense resistor and I would set the voltage limits with some additional resistors.

{% img https://raw.githubusercontent.com/pinski1/eFuse/master/Hardware/eFuse%20Iussue%20A%20-%20Soldered.png %}

This board is currently set up for my robot, the under and over voltage limits are set for a 5 cell Lithium Polymer battery. This means that should the voltage drop below 14.0 Volts (2.8 Volts per cell), rise above 23.5 Volts (4.7 volts per cell) or the current rise above 55 Amps the fuse will cut out. However the main advantage of an electronic fuse then comes into play. Becasue it's reacting to limits rather than physically damaging itself it can reset so I've set it up to reset 3 seconds after a fault.

The issue A board was tested in my robot for two whiteboard matches. This is a match with multiple opponents and without any scoring system. It successfully reduced the inrush current but as I'd set the current limit to so low it would constantly trip, stopping the robot. 