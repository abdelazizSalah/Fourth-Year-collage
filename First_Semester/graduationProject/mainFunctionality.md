# AEye Functionality. 
* Indoor routing. -> to avoid accident in the street. 
* outdoors -> e7na khayfeen en 7d yestkhdm el app,  ye3tmd 3leh, fa yet5bt b 3rbya masln aw keda, fa el mawdo3 khatar.
## Functionalities
1. Navigation 
   1. Navigate to a certain location then save the route, by going there once, then when we want to go again, we just say the location (Voice Recognition).
   2. This occurs by starting the navigation from certain place, then he should go to the destination and then press save. (storing certain route). 
   3. e7na momken yeb2a m3ana GPS, rabteno bl app, w hwa bygebly el direction lel destination, w ana babd2 eny a3ml el SLAM bta3y, 34an a-build el map w abd2 a7rk el shakhs da (lw nezl odam el sherka b uber, fana 3auz aro7 le makan ana 3amlo save). 
   4. el mfrod el mwdo3 da yeb2a ashal kter lw el shakhs kan 3amal save lel location da abl keda, aw el route nfso, lakn lw awl mara, fa e7na bardo lazm nes3do eno ye2dr yro7. 
   5. From those statements, we can generate two modules 
      1. Go to a new location. (Assumption: lazm shakhs byshof y7otelo el location el gded da). 
      2. Go to a saved location.  (Assumption: using a speech recognition system, we should select a previous route). ( very useful for indoor navigation).
      3. ay mkan ana ray7o, a2dar a3ml save lel route el ana mshet feh. -> IMP
      4. Someone can scan the whole floor, and start labeling them, fa lw ra7 el 7amam masln, y2ol da esmo 7amam, w hakaza, w el mfrod en ana mn ay location baa lw fe odt el nom masln, a2ol 3auz aro7 el 7amam, fa yebd2 ytl3lo el route el yro7 beh, de hatb2a mofeda gedan fe amakn hwa byo3od feha kter, zy el door bta3na fl kolya, fl beit, w hakzaa
   6. Important notes: hn3rf ezay eno tel3 selm, tel3 asanser, fe mozl2an w hakaza... (Assumption: from flat point to another flat point). 
   7. lw feh slalm, lazm ne3ml object detection en feh selem w n2olo mtnzlsh 5atar aw emsk fl trabzen yasta!
   8. SLAM -> Simultaneous Localization and Mapping.
2. Face Recognition
   1. Connecting it with my phone, and store peoples' names and photos, and when I see any of them, I should detect him.
   2. This should be truned on/off.  
   3. option to give a command, to take a photo of a new person , and give him a name, and all of these steps should be automated with one command.
   4. input -> camera, output -> voice.
3. Emotion Recognition
   1. Turning it on/off.
   2. input -> camera, output -> voice.
   3. To know the people's emotions surronding him. 
4. Signs/Papers Readers.
   1.  turn on/off.
   2.  input -> camera, output -> voice.
   3.  Similar to OCR. 

## Scenarios
1. Camera sent frames.
2. Preprocessing them.
3. send them to the model.
4. the perceptor should understand them, and provide me with something, to be able to take a decision. 



## Notes
1. e7na hanshtghl server side, wla in the application side (on mobile). 
2. C++ inside code
3. Iphone / Android ? 

## Things to be done: 
1. Lw hn3ml scan lel mkan, fa hyb2a 3ndna 2 modes of opertions. 
2. lazm nghz eh hadaf el project da, w ezay hna7sn 3la el mwgod, w lw homa kolohom 
3. survey 
   1. effective wla laa
   2. eh l fr2 benk w ben el so2
   3. hat3ml el klam da ezay.  
   4. ema enk btl2eh 3la el net w enk ts2l nas aslun. 
4. Sequence of the presentation: 
   1. look for previous years presentations.
5. 7adar as2ela ktera w gaweb 3lehom.  