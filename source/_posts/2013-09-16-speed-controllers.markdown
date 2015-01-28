---
layout: post
title: "Speed Controllers"
date: 2013-09-16 17:19
comments: true
published: true
categories: [The Unnamed]
---
The Unnamed will be powered by 2 Gimson GR02s which drive a wheel and a pulley each, which turn another wheel and pulley combo. This gives me four wheeled drive which helps with acceleration and manoeuvrability. However I need something to take the servo signals (a period of 20 milliseconds with a high pulse between 1 millisecond to 2 milliseconds to determine speed and direction) and convert them into motor signals.

A GR02 will, when stalled, pull approximately 61.6 Amps according to the manufacturer. This means I need to find something that can withstand that much current for short moments of time. The best way to do this is to do some research and build up a table of options.

|&nbsp;|[RageBridge](http://e0designs.com/products/ragebridge/)&emsp;|[BB TZ-85A](http://www.botbitz.com/index.php?route=product/product&path=59&product_id=59)&emsp;|[TZ-85A](http://www.hobbyking.com/hobbyking/store/__29644__Turnigy_Brushless_ESC_85A_w_5A_SBEC_UK_Warehouse_.html)&emsp;|[Sabertooth 2x25A](http://www.dimensionengineering.com/products/sabertooth2x25)&emsp;
|---------|----------|---------|------|--
|Channels&emsp;| 2 | 1 | 1 | 2
|Continuous Current&emsp;| 30 Amps | 85 Amps | 85 Amps | 25 Amps
|Peak Current&emsp;| 90 Amps | 100 Amps | 100 Amps | 50 Amps
|Min Voltage&emsp;| 12 Volts | 7.4 Volts | 7.4 Volts | 6 Volts
|Max Voltage&emsp;| 36 Volts | 25.2 Volts | 25.2 Volts | 30 Volts
|Dimensions&emsp;| ? | ? | ? | ? 
|Weight&emsp;| 99.2 Grams | 89 Grams | 89 Grams | 90 Grams
|Price&emsp;| &pound;116.16 | &pound;43.94 | &pound;28.22 | &pound;78.48|
<br />
One thing to note about this comparison is that the TZ-85As are only single channel, I will need two to drive both my motors. I'm also not confident that they will withstand 85 Amps continuously. However there have been widely used without complaints in the Australian robot combat leagues. I've included the pre-programmed ones sold by BotBitz as well as un-programmed ones directly from HobbyKing.

{% img https://lh5.googleusercontent.com/-W_1vNbxzFk0/VMlULs7o7eI/AAAAAAAAC4Y/rOeGUtbUxaY/w510-h398-no/Tz85A.jpg %}

Looking at that table the TZ-85As seem to be the best for current handling capabilities and their maximum voltage is greater than the motor can handle. They are also quite compact and if I buy them from HobbyKing and re-program them myself they work out to be much cheaper. The lower cost also means that I feel alot better about modifying them as having spares around will not be expensive.
