void versusMode() {
  clear();

  pushStyle();
  background(0);
  textAlign(LEFT);
  textFont(fontVie);
  fill(255, 255, 255);

  text("Vie J1 :"+vieJ1, 0, height/20);
  text("Vie J2 :"+vieJ2, 0, height/20+height/20);


  popStyle();

  pushStyle();
  fill(255, 255, 255, 60);
  rect(0, height/2 - larBandeVersus/2, width, larBandeVersus);
  popStyle();

  if (initialisationVersus == 0) {
    posXVaisseauJ1 = width/2-LarVP/2; //width/2
    posYVaisseauJ1 = height/2 + height/4  ; //height/2
    posXVaisseauJ2 = width/2-LarVP/2; //width/2
    posYVaisseauJ2 =  height/4 ; //height/2

    vieJ1=initLifeVersus;
    vieJ2=initLifeVersus;
    startVersus = true;
    compteurVersus =3;
    tailleFontVersus = 100;
    endingVersus = false;
    explosionOn = true;
    initExplo = 0;
    iExplo = 0;
    winnerScreen = false;
    plusDeVie = false;

    initialisationVersus = 1;
    
    
        for (int i=0; i<nombreLaserJ2; i++) {  //réinitLaser
      nbLaserJ1[nombreLaserJ2] =false;
      lbJ1[i] = 0;
      nbLaserJ2[nombreLaserJ2] =false;
      lbJ2[i] = 0;
    }
    
  }


  //------------------- Trainer

  if (trainerXp1[nFrameTrainer-1] == trainerXp1[0]) {  
    moteursXP1 = false;
  } else {
    moteursXP1=true;
  }
  if (trainerYp1[nFrameTrainer-1] == trainerYp1[0]) { 
    moteursYP1 = false;
  } else {
    moteursYP1=true;
  }
  if (trainerXp2[nFrameTrainer-1] == trainerXp2[0]) {  
    moteursXP2 = false;
  } else {
    moteursXP2=true;
  }
  if (trainerYp2[nFrameTrainer-1] == trainerYp2[0]) { 
    moteursYP2 = false;
  } else {
    moteursYP2=true;
  }



  for (int i = nFrameTrainer-1; i> 0; i--) {
    trainerXp1[i] = trainerXp1[i-1];
    trainerYp1[i] = trainerYp1[i-1];
    trainerXp1[0] = posXVaisseauJ1 + LarVP/2;
    trainerYp1[0] = posYVaisseauJ1 +LonVP;

    trainerXp2[i] = trainerXp2[i-1];
    trainerYp2[i] = trainerYp2[i-1];
    trainerXp2[0] = posXVaisseauJ2 + LarVP/2;
    trainerYp2[0] = posYVaisseauJ2 ;

    pushStyle();
    noStroke();
    fill( 255-(i*5), 0, 0);

    if (moteursXP1 == true && moteursXP1 == true) {
      ellipse(trainerXp1[i], trainerYp1[i], 15-(i*0.5), 15-(i*0.5) );
    }
    if (moteursXP2 == true && moteursXP2 == true) {
      ellipse(trainerXp2[i], trainerYp2[i], 15-(i*0.5), 15-(i*0.5)  );
    }
    popStyle();
  }







  if (vieJ1 > 0) {

    if (startVersus == false) {               //empeche de bouger pendant compteur


//------------------------------------------------------- déplacement
      if (X1 >= 1 && posXVaisseauJ1>0 ) {   
        posXVaisseauJ1 = posXVaisseauJ1 - vitesseVaisseauP1;
      }
      if (X1 <= -1 && posXVaisseauJ1 <(width - LarVP) ) {   
        posXVaisseauJ1 = posXVaisseauJ1 + vitesseVaisseauP1;
      }
      if (X1 == 0) {   
        posXVaisseauJ1 = posXVaisseauJ1 + 0;
      }

      if (Y1 <= -1  && posYVaisseauJ1 < height -LonVP ) {   
        posYVaisseauJ1 = posYVaisseauJ1 + vitesseVaisseauP1;
      }
      if (Y1 >= 1 && posYVaisseauJ1> (height/2 + larBandeVersus/2) ) {   
        posYVaisseauJ1 = posYVaisseauJ1 - vitesseVaisseauP1;
      }
      if (Y1 == 0) {   
        posYVaisseauJ1 = posYVaisseauJ1 + 0;
      }
//------------------------------------------------------- tir

      if (b1p1 ==1) {
        RJ1=0;
        BoutonlaserJ1= false;
      }
      if (b1p1 == 0) {
        BoutonlaserJ1= true;
      }




      if (BoutonlaserJ1 == true) {
        if (RJ1== 0) {
          nombreLaserJ1++;
          if ( nombreLaserJ1 == nMissile-2) {         // g triché un peu mais sa passe 
            nombreLaserJ1=0;
          }
          nbLaserJ1[nombreLaserJ1]= true;
          BoutonlaserJ1= false;
        }
        RJ1++;
      }

      for (int i =0; i<nMissile-1; i++) {
        if (nbLaserJ1[i] == true) {
          LaserJ1(i);
        }
      }




      if ( nombreLaserJ1 == nMissile-1) {
        nombreLaserJ1=0;
      }



//-------------------------------------------------------------------------------------------------------- colission 
      for (int i=0; i<nMissile-1; i++) {
        if (
          ( posLaserXJ2[i] >= posXVaisseauJ1) && ( posLaserXJ2[i] <= (posXVaisseauJ1 + LarVP))  &&  
          ( posLaserYJ2[i] >= posYVaisseauJ1) && ( posLaserYJ2[i] <= (posYVaisseauJ1 + LonVP)) 
          ) {
          nbLaserJ2[i]= false;
          lbJ2[i]=0;
          posLaserXJ2[i]= -100;  //valeur random juste histoire de pas loop la condition
          posLaserYJ2[i]= -100;

          J1Touche = true;
          vieJ1--;
        }
      }



      X1 = 0;
      Y1 = 0;
    }
    //------------------------------------------------------- affichage vaisseau
    rect(posXVaisseauJ1, posYVaisseauJ1, LarVP, LonVP);
    
  }





  //----------------------------------------------------------------------------------------  J2 (same)


  if (vieJ2 > 0) {

    if (startVersus == false) {               //empeche 

      if (X2 >= 1 && posXVaisseauJ2>0 ) {   
        posXVaisseauJ2 = posXVaisseauJ2 - vitesseVaisseauP2;
      }
      if (X2 <= -1 && posXVaisseauJ2 <(width - LarVP) ) {   
        posXVaisseauJ2 = posXVaisseauJ2 + vitesseVaisseauP2;
      }
      if (X2 == 0) {   
        posXVaisseauJ2 = posXVaisseauJ2 + 0;
      }

      if (Y2 <= -1  && posYVaisseauJ2 <(height/2  - larBandeVersus/2 - LonVP)) {   
        posYVaisseauJ2 = posYVaisseauJ2 + vitesseVaisseauP2;
      }
      if (Y2 >= 1 && posYVaisseauJ2>0 ) {   
        posYVaisseauJ2 = posYVaisseauJ2 - vitesseVaisseauP2;
      }
      if (Y2 == 0) {   
        posYVaisseauJ2 = posYVaisseauJ2 +0;
      }








      if (b1p2 ==1) {
        RJ2=0;
        BoutonlaserJ2= false;
      }
      if (b1p2 == 0) {
        BoutonlaserJ2= true;
      }

      if (BoutonlaserJ2 == true) {
        if (RJ2== 0) {
          nombreLaserJ2++;

          if ( nombreLaserJ2 == nMissile-2) {         // g triché un peu mais sa passe 
            nombreLaserJ2=0;
          }
          nbLaserJ2[nombreLaserJ2]= true;
          BoutonlaserJ2= false;
        }
        RJ2++;
      }

      for (int i =0; i<nMissile-1; i++) {
        if (nbLaserJ2[i] == true) {
          LaserJ2Versus(i);
        }
      }



      //  if ( nombreLaserJ2 == 5) {
      //  nombreLaserJ2=-1;
      //}


      X2 = 0;
      Y2 = 0;
    }

    rect(posXVaisseauJ2, posYVaisseauJ2, LarVP, LonVP);



    for (int i=0; i<nMissile; i++) {
      if (
        ( posLaserXJ1[i] >= posXVaisseauJ2) && ( posLaserXJ1[i] <= (posXVaisseauJ2 + LarVP))  &&  
        ( posLaserYJ1[i] >= posYVaisseauJ2) && ( posLaserYJ1[i] <= (posYVaisseauJ2 + LonVP)) 
        ) {
        nbLaserJ1[i]= false;
        lbJ1[i]=0;
        posLaserXJ1[i]= -100;  //valeur random juste histoire de pas loop la condition
        posLaserYJ1[i]= -100;

        vieJ2--;
      }
    }



    //if ( nombreLaserJ2 == 5) {
    //  nombreLaserJ2=-1;


    //  println(nombreLaserJ2+"PosX: " + posLaserXJ2[5] +"PosY: " + posLaserYJ2[5]         );
  }

  //----------------------------------------------------------------------------------------------

  pushStyle();
  textAlign(CENTER);
  compteurVersusFont =  createFont("ARCADE_N.TTF", tailleFontVersus);
  textFont(compteurVersusFont);
  fill(255, 0, 0);


  if (startVersus == true) {  
    if (compteurVersus >0) {
      text(compteurVersus, width/2, height/2);
    } else {
      tailleFontVersus = 120;
      text("Go!", (width/2)+30, (height/2)+30   );
      if (frameCount%(60*2)==0) {
        startVersus = false;
        frameInvincible = true;
      }
    }
    if (frameCount%60==0) {   // %60     //changer délai
      compteurVersus=compteurVersus-1;
      tailleFontVersus=tailleFontVersus- 30;
    }
  }

  popStyle();




  if (vieJ1 ==0) {
    endingVersus = true;
    t=1;
    posXExplo = posXVaisseauJ1;
    posYExplo =  posYVaisseauJ1;
  }

  if (vieJ2 ==0) {
    endingVersus = true;
    t=2;
    posXExplo = posXVaisseauJ2;
    posYExplo =  posYVaisseauJ2;
  }





  if (endingVersus == true) {  

    if (explosionOn == true) {   // true de base

      if (initExplo == 0) {
        frameCount = 0;              //sert a r 
        initExplo++;
      }


      if (frameCount%iniVitesseExplo==0) {
        iExplo++;
      }



      explosion[i] = loadImage("Explosion_" +iExplo + ".png");

      translate(-(explosion[i].width/2), -(explosion[i].height/2));

      image(explosion[i], posXExplo, posYExplo);
      //println("animtrue");

      if (iExplo==10) { 
        iExplo=1;             // sert a r
        initExplo = 0;   // sert a r
        explosionOn =false;
        winnerScreen = true;
      }
    }

    if (winnerScreen == true) {

      pushStyle();
      background(0);
      textAlign(CENTER);
      textFont(fontVersusEnd);
      fill(255, 0, 0);

      if (frameCount%(50) == 0 ) {           
        if (clignotementVersus == true) {
          clignotementVersus = false;
        } else  if (clignotementVersus == false) {
          clignotementVersus = true;
        }
      }
      if (clignotementVersus == true) {
        text("Joueur "+t+" Vainqueur", width/2, height/2);
      }

      if (frameCount%(60*5) == 0 ) {   
        VersusJeux =false;
        plusDeVie = true; // ?
      }

      popStyle();
    }
  }
}








void LaserJ2Versus(int R) {
  /*
  if(initLaserVersus[R] ==0){//test
   nbLaserJ2[R]= false;  //test
   lbJ2[R]=0; 
   initLaserVersus[R] = 1; // test
   }
   */
  if (lbJ2[R] == 0) {
    posLaserXJ2[R]= posXVaisseauJ2 + LarVP/2;
    posLaserYJ2[R]= posYVaisseauJ2;
  }
  lbJ2[R]++;
  posLaserYJ2[R]=posLaserYJ2[R] + 10;
  if (posLaserYJ2[R] > height) {
    nbLaserJ2[R]= false; 
    lbJ2[R]=0;
  }


  rect(posLaserXJ2[R], posLaserYJ2[R], larLaser, lonLaser);
}
