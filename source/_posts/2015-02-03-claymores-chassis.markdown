---
layout: post
title: "Claymore's Chassis"
date: 2015-02-03 18:09
comments: true
categories: [Claymore] 
---
It's been a long time since I last updated this blog. In that time the designs for Claymore have changed quite a bit. I've settled on a sensor layout as well as discarding the whole idea of a lasercut chassis. The biggest driver in the decision to discard the laser cut chassis was me finally accepting that the Faulhaber motor gearboxes were unworkable in their current state. They were in a prime position to be the main mounting point but due to their thin all-plastic design there was no way to mount to them satisfactorily.

##Chassis
Since becoming a member of [Cambridge Makespace](http://www.makespace.org) one of the more amazing tools I've had access to is the [Metal Mill](http://wiki.makespace.org/Equipment/WarcoMill). This tool cuts through aluminium and steel like a dream and is the main driver behind my decision to build the chassis out of milled aluminium. As the electronics is designed to fit inside the chassis this then requires a redesign of the electronics too.

###Motor Mounts
The first thing I re-designed was the motor mounts, the dimension are largely copied from the plastic originals however I added more thickness to the base to allow me to drill and tap these for mounting. Unlike the laser cut chassis the motors mount to the base of the chassis rather than the top. This allows the electronics to drop in from the top and the battery to be held in with gravity.

{% img https://lh3.googleusercontent.com/c8pAhuXKJq9DdZwmBq-qLuj7XwlK3pwpjloHGZDiGLermzhkI8_erCZAs3ffWzb85yu5zzgQUOpoOUrA-qLsaFaEZJ1wd7sKnLouCcpQvCeKBjko8kQc-Gyn-9842AdVhjYJbeuAYYzIyFck1x2KrHxrbXXLynjLl2Vm77aDQz2jF3mQxLCVv94iNqnMEyWXVX1aEPeN_9Gf8k-rv8jJ4f6ol8wXgCC3bpvq7VcvVr0gjQwjgeKX4Z6nh8qdfAJhRfyCJzo836vOExeoZecP08xvv_xizDkrun6rr6AX7u8fXwmMNCmRNdW10_-aXZi1ZNAFyJFaO8ux-Z1LXGWlAxS0F29tOIlkZYfaUWvGnk2jtv0bcQzVeQTb_8y1uT4ahXF9ZeaKQkAK3fvXVmPpHHAnTpwkqfU5DLblefaxlSshonDoTwl_aNM1J8uLMYkiUeZV4jW6ZCk5q3f2waj4arQmWjnlfrQnanE_JBmxZUBrJJ89tFC2I2jeAqJpGCy6qldhj8u5iE97tdhJ8InM7E9QHXzJi_5_fXFW41nNK_8=w859-h775-no %}
Rather than to screw directly into the aluminium which is quite soft and will strip after a few remove/replace cycles I used [Helicoils](http://www.repairengineering.com/helicoil.html). These spring-like stainless steel inserts screw into an over size tapped hole and have an internal thread which is the sized to fit your bolts, in my case M3. This allows me to remove/replace parts repeatedly with no loss of strength.

{% img https://lh3.googleusercontent.com/mxZ73AzRrfBPjLWVYDDbv5QXiFLXV7Ul2kVtMclEaItexVyVK2Rtp7XnBV68tq3jDX-d28E2dgP10ZHA62TjGGEfirg29Y2u5hL96BqksC9nY3lv_SGaGOu2usswZ-fpkESVWluz9vtsKbMpqHOqti-MFkBe56R5FCs4-BQnT1EvMVTUnpEI1E8xve6REHZ8LbIbxTs2Ul_10bC6kMrRYG3jGsG5tcIvZME9d04d7pQNi9vExoCWFVUpEjTUAZ-HZFYtVL_p_LUlIhuMXj49s-kwoLt4LfFwfWOtyoOKzNd8S2dh2qr7zFF-DCWThRPrH3EKlUgsjR0ByD90vKhih8eyaaAYqznnU2bOCBOBK2STh7IxAYggrGqQU3gmdZk_7GWvWEpgTOE5wQ9D2Pi_bmOVgiWM_FUF879YV1WPig8SfWNM5zoUnsj-hhwho4QLYYPRD98C__A3Ob1xAtD80kkH38LCCmVvMv76_sZkqBZoudQVvJSrvz8_JKoPFgvaOhaEClKY-6w-XQ9LLNgzMSpOjrHr5aqChrOAM1k5uZA=w647-h731-no %}
###Base Plate
The base of the chassis is made out of 1.6mm thick aluminium sheet that is cut and bent into an "L" shape. This reduces the need for an awkward mounting system in the rear of the chassis where the motors will mount and also stiffens the chassis a bit. To mount the sides to the chassis base I made up some small aluminium blocks that had 5 helicoiled threaded holes. These mount to the chassis with 2 bolts, to the sides with 2 bolts and attach to the PCB with 1 nylon standoff.

{% img https://lh3.googleusercontent.com/nbHAP4oXO_0pmydBpJG0NBb6aMRhANCBXabvg_MQ8-AwCWhbHe6Yg-SW52cIdrryj8dKYfTlgjuORFi5ZvLKduyVLhYXg99hg_f0PMlSN9eggfnzL2mXg70B5UCYmho-fE7VzgU4KzJTcJYPtXZrWROSyldP98FSnG_1bc0J8-3bB50jVhISgb3DeBNorR9s8X1cNUaGbZBfZq5wupdhmFjG3_G5skcKI6coKsu7F-dqJhOrp-N4dF3PxeI9G7zbZW0mWp6_nDGYCNjmt0Cd8LuBF7ktgXjQv9odcG0HVb3OEi5qZ3a0HfS-0nAJe6CYc15rJ3nxiBN-wkOLLhvYAOrOhZurfAFFXRi5ne_ao5_S6E6yxyk7F6N9yC3UCh82qDHoH7c2tqyLUy7Z4Xwyf7k_KZ67APq3Yr5hoLzf90k1a5v8zcAQ-hryspHPH9PFfkL_ujJ7sXFDZFra8nICJYQOFBNhcUf7-3_xLgXRxKEfurFxkxIuUPNfFgQ89m0cRFewrRX4vzMfAnZpjrLE6DbozMvpQt--7Tz5MBGuX9A=w990-h775-no %}

###Chassis Front
The front of the chassis is one large aluminium block to ensure that the front of the robot is kept down during high acceleration as well as to provide a ridgid mounting point for the sensors. Before I re-designed this block I bought some of the sensors I will use (Sharp GP2Y0D340K [Datasheet](http://sharp-world.com/products/device/lineup/data/pdf/datasheet/gp2y0d340k_e.pdf)) and measured their range and detection pattern. I found that by spacing 3 sensors ~15&deg; apart I could cover a 90&deg; arc in front of the robot out to ~300mm.

{% img https://lh3.googleusercontent.com/riwuDrohYvcXKN-hFAQCrDgvT2oJrJ95MEBCLVF6_VE6pfbb8rlx7RFsXXthNNBTUv83z3G-KW4wr6xj7zD0UkZtgBWSHd4SC93g1tMX9rAyG2kWgcmpsmdERbf3Xy5xBy9PwVtTgVAxTMPgbF4tMsIa6bryXcYvd_qVgz6Qp18raa7HpRgbpMYJ30DwH2TfnPNcYETzczX_0LlCDyjRQOqsfOmGa1I6hI6uGQorwB03ua1INMle8ByaRdYwimAx4shCI0tyzVDktOVizG4WTtwnOS5wbjaZEbIQjXsYCsv6QX49vYPr1CF2JdE0-ggHtC0VK25Eg7KlVDCBq-YQIrqO1mksgk-mk8FMTwXoYS-wSh6yCY6qEN0chrf0u5N16r184aPLNKb65r0bFm_nGgUpuygmF_A9YciB2loZNClqmvxEOs3N5hZC74hcZuoDg43UxDBWyM_PeXzXLT6CeCxvq5MC1LEEBvKw53g9ZLpq-6zq76w7oFZfxGZFL2cFNo1UjCmm7n7CQyviggab2fTUEaiYRqdJoEXUGQDbUR4=w1518-h775-no %}

###Skid and Sensors
To keep the front of the robot from damaging the dohyo surface I machined a skid out of an engineering plastic called Delrin. This plastic is tough yet slippy so should be ideal for this. To detect the edge of the dohyo I added 2 edge sensors right on the front most edges of my robot. These should detect the transition from the black of the main dohyo surface to the white of the 25mm thick edge strip.

{% img https://lh3.googleusercontent.com/8xJHOW9gUL3XZORE1a-S5kZxE-7Ya5FQIsBY55SDplvnGU4Nv68cOKtKQalN8MHI-9AiU1Jqla4rIKMM5f6vtxpeI3MAYAQt5hnXJqnH5FpzP-XVEnDuXTp0QIEHS2A-AGUAh4aMMzenN1RO5h_XLgqiOYUZ9V6GhOngDhpqfN16E3dcsxuF4yehOkY9eHs0DD7gbse_9I_KYH8L513iMVlIT0wD-Zs-Am0cndbeLgUcc64HDfU6kKYi0u5mYGORQYABaivSOQUsBwxUfvJL6eQXOBogRiNJynY1AKrlxBUz2gOrkXEqaZRaGaT0Aks0c6wuieo872XkLN4_U4N8xtsyxQRIqaKuYYmPVIS3Uml3eP-YW-sL-0fyQWPQXg0163kCE9K5WlG1JwhOOcmlu13gWsbmOaEOezLJFp4c8G-G75oPVQFRI6WXbt53LP5IT_MGgqN4z6IFCeDOgyruINXdsp5oS6RZJ3NwfbCelUtvEXh0GprIVJfFVjlL2-Zr4aotg-giQve6frx43ukFURkHHf2-xisXQ_T6ZuZVP4c=w905-h775-no %}

###Ascetics
As plain aluminium is very shiny which will reflect infra-red light very well I will need to darken the exposed aluminium surfaces. Ideally I'd anodize the aluminium however I don't think I'll get a great finish and it would be tricky to do myself. Instead I'm planning to use a matt black vinyl wrap to cover the aluminium surfaces. This should be a simple process but should give a good finish.

{% img https://lh3.googleusercontent.com/we3OpT9YxRbRFrPtlJLm-GDH9svQFboi_7H94g9kyqYHXnohRrzJcFg76C35Oic5ZkKtcXIKzIrTVAWXp3sKxRZHUHjNtUDpJ-L3AyaACKlVD2HTpMjUmnAA6kNgjgeTH9fNJEqSWSvvBaCckh22cnW1LIjaEyuKQaVu4iYbkNzKDWx9agDO__XL1tGl_ghH2PCTYOUYdwErDtryvikvLJavPTZ9EpHVUtyPWoDCH2iMLDkYAaVKfDSkyZBuAfVJXeEB7X9_pBDjSGnvnbslpDz0PdjwIfEuzEZ3g1nme3AAnTitQ_sETHYExbTLmn8yRT1jDb8QF8XUJdyUGxZRkKaeK7ly9M7k68wE0MfK_ezUR9trD6gDMl2F97_RI2wlxkENWflKefF27mHIeTmZkBRgLN5m16R8zMsj9NA5BDOc31ib0mIGc_PJKMcziJI38FiT1ikDL5_9lsKEZ0PopEDFjYp861SE7DYs6pP7W4WNj3lVs7l-re3JruMnHMTiIUcCwKdrQDbJfrwc7iMSQixn02NHDKeT2fHGE-WyVI8=w1319-h775-no %}

As the electronics will be mounted on top of the motors & aluminium blocks I need a top cover to protect them. I've decided that I will laser cut a 3mm translucent acrylic top with holes for buttons. This should looks good and provide enough protections from falls to the electronics.

{% img https://lh3.googleusercontent.com/dYGSnaswpgcf1U5CH-3ptO27Euulmi0rRaYMPJu21bjcYRmr7j-zxCveLl-6at2So3_NfIw7JB5v7IK82AxloS_T9W1wOBfa8uU3qtShIwq5ST-IIIPkXIkFBYvE5cYxewbFj0Sh3atmLkgI-zU8dLg81S4CEeciqlfVaFeB6Swqd-6BEW3sKaZafA-Pk8Dzj0ZjM419H3eGEY8-7buTluDoNw1DK4sBahUBVX_eNo46boTVtpGeCeKoavF_JAAprJaX2zTg-UPtbkXZSY9ah1rlhwv_UhaEOIo7Xge3RDHgFVuLI_kRPAlYrqCgqSbp-9xh8q2lwRMKlff-qi_D1wP1094_FRHCvOrQZXC3eD7_jpgYb2H1yHplTgotF2qi35Kcpo4WDjrx8mqhBnsJhX6cEGfrHk60X1O_7r9ZAsr3KR3MjNaRKr0S4pADB26eh0ZsXva9mnh89uhNNUA7VZvDqLczDp1wNa1P_bDnMOQEPwl-cXvsebCR9WIW5BfsiSnG-0qI_kzsJTO_rqcLjjxAiUkREewuuS2auiYvxC4=w1027-h775-no %}

##Electronics
The main change has been the PCB shape, in order to fit the battery the PCB is now a "U" shape with angled cut outs for the sensors. Unfortunately as this is a small PCB with lots of components and some very narrow places I'm still trying to route tracks.

{% img https://lh3.googleusercontent.com/7LMcQres7WRcjQ8CMgLH8fArR8JMIkmzyOYs_VsSHftFbuleA0YhpCVE9hPrmbEl5ANVvvvI7utjY84rbn1CtljAbd55wjVFYxvNbPbWXlHBOA8J_kOV6Qn1-djhU1zzmFcJV7Lf2LXQDP9t9ShjJJxYdn--SktIFi_jVibxAP9XiFdtBVEXrSIbZ2Kr1TtjlYlmD2hkcxeo2fpoxilp5rB5_rMuaUsDsg7PaNTaW02PPkaaJktHvVq7_2Mgx0aVlxok96Frl5l74VhR6Yrre152lfx2q7OkK9h0BhMgA1-letXeuWKSFlYYx3uN6U27Q_FuGvaUYO24mVjbYWbFBGAd2ykekcsc7xlI1Q556XVEaNFBSffL2D5cKj-Rbqi7fv5m58hGgaPKuekrOxdMcHxVgj2TrB5eE50YE0CpKtKM__ByhozFuJO3XI2CpINCdW3L3WLgbfhGw0WR47o4KxW8JTqU3gR0zZPHn8VrlUdIGr8Uks66SNxgLiu8dBAcrHgTQzDN5H1dL42uiyvZvIAn7FaTp8e3RWSdhiOJwSw=w1209-h731-no %}

<!-- picture of paper cutout -->

###Power handing
One key aspect of the chassis redesign was the dimensions of the battery. The battery is a key component of the mini-sumo as without it nothing will run. I've now decided to use Venom 10C 3 cell LiPoly batteries and have bought 2 to allow one to charge while one is being used. They're quite popular so there should be a ready supply of spares if required. They weigh 45grams and their dimensions are 68mm x 26mm x 18mm. It is important to note that a fully charged 3 cell LiPoly battery will have a pack voltage of 12.6V.

{% img https://lh3.googleusercontent.com/eqvBvWKCNpvLsv-TZxV9MMhstYHczOxtjD-vj_1wFzDmnxcni64dERu76yQ8iTJrbOIzr9_-Cgw_SXFhgcwFJWygNiLtrYivcunIx_P9TpJpwOkAOcUJi_1s_Jtjv9lPkFnEwM_DP_2IAu-aLIb7-NHmsR6SWiaY9k6gV8JCguuMcPb1KLsn4G-WV2DIwbZUjR5GTD0Jc2hA35e4dW4eLtTnnwXBk03f7_fAD4WwrSm3BfauJZRVCrFiFY_80uRNirucsAi2adZJeHF1d7isqmGcbhBgVdc8osWEkZl-poo6OxGXGtRd9lI55mPe6sPdgPiQWhr1UXe04Vk8MVmbSx0RaNcOln0anmcX26sENU7MH5a3t8oX04tDOOmk-UsAfBkLnVRwXqCdQH6-RKuBSXV2DYH5WQxVF4NFiLD-_4JPzdigoIKE9F2vu4rEeWvmkOdyE8dSQqouHWz1k0H4QDg2yyhrhsafkMcz9mKXdtHUIv9q1u3FL8X0KeuOo8t1FHq3twtlbCqHgHmbmkPDA9SGPCK0WQyuHKrkHlZQE6c=s500-no %}

As the motors will be separated by the battery it will be hard to route a single motor controller chip like the [TB6612FNG](http://toshiba.semicon-storage.com/info/lookup.jsp?pid=TB6612FNG&lang=en) to both motors. Thus I have chosen to use  separate motor drivers, however I also need the motor driver chips to be compact as I do not have much space on the PCB. The motor chips I have chosen are Texas Instruments [DRV8838](http://www.ti.com/product/drv8838) however these motor driver chips cannot handle power supplies of greater than 11Volts. To protect the DRV8838s I've placed a large diode in series with the battery that has a Vfwd of 1.6Volts which should drop the voltage satisfactorily.

Another problem is that while the motors will be running at 11Volts, the GP2Y0D340K sensors require 5Volts to work, and the rest of the logic requires 3.3Volts to work. I decided to solve this by using a switch mode power supply to convert the battery Voltage down to a stable 5Volts for the range sensors and then I am using a linear regulator to convert from 5Volts down to 3.3Volts. This minimises the board space required while maintaining a high efficiency. This should cost too much nor generate too much heat.

###Sensors
The GP2Y0D340K range sensors will plug into turned pin sockets mounted directly to PCB at the right 15&deg; angles. This allows me to change sensors if they get damaged but also provides a secure method of fastening them to the chassis via the PCB.

The [QRE1113](https://www.sparkfun.com/products/9454) floor sensors will be mounted in Sparkfun breakout boards which bolt to the front block as seen in the picture above. They will have wire pigtails that connect to the PCB via tiny 3way JST [SH](http://www.jst-mfg.com/product/detail_e.php?series=231) connectors. I've still not quite decided where on the PCB these will mount but they don't take up much room at all.

###Interfacing
As this is an autonomous combat robot I will need to change the code regularly to alter and improve tactics. The best way to do this is by including an ARM [mbed](http://developer.mbed.org/) compatible chip that can be programmed via a built in USB bootloader. The NXP [LPC1347](http://www.nxp.com/products/microcontrollers/cortex_m3/lpc1300/#overview) ARM Cortex-M3 microcontroller fits these requirements perfectly. To avoid cutting holes in the chassis the USB connector is placed pointing forwards between 2 of the range sensors. The buttons to reset and put the chip into bootloader mode will peek out through laser cut holes in the acrylic top cover.

<!-- image of USB port -->

To provide detailed status information I've added a monochrome 128px x 32px I<sup>2</sup>C [OLED screen](http://www.adafruit.com/products/931) to the PCB. This currently shows battery and build information on boot up and then motor and sensor status during the match.

