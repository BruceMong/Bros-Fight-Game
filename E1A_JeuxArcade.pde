void jeuxArcadeMenu() { //<>//

  if (initialisationArcade == 0) {
    posXVaisseauJ1 = width/2-LarVP/2 - 100; 
    posYVaisseauJ1 = height/2 + height/4  ; 
    posXVaisseauJ2 = width/2-LarVP/2 + 100 ; 
    posYVaisseauJ2 =  height/2 + height/4 ; 
    vieJ1 = initLifeArcade;
    vieJ2 = initLifeArcade;

    posXBouclier1=100;              //useless
    posXBouclier2= width -100;     //useless

    score=0;
    vague=1;  //? 
    protectionON = true;

    dashOnJ1 = false;
    DashCompteurJ1=0;
    cooldownDashP1 = false;
    cooldownDashCompteurP1=0;
    barreChargeLaserP1 = false;
    LaserSpeJ1 = false;
    LaserSpeCompteurJ1=0;
    BarreChargementLaserP1=0;
    dashOnJ2 = false;
    DashCompteurJ2=0;
    cooldownDashP2 = false;
    cooldownDashCompteurP2=0;
    barreChargeLaserP2 = false;
    LaserSpeJ2 = false;
    LaserSpeCompteurJ2=0;
    BarreChargementLaserP2=0;

    startArcade = false;           //cheum  
    finDeVague = true;
    initVagues = 0;
    spawnEnemy =false;

    antiExploP1=0;
    antiExploP2=0;
    explo = false;
    initExplo = 0;
    iExplo =0;
    timerRetry=false; 


    initialisationArcade = 1;
    difficulty=1;


    BarreChargementDashP2 =0;
    cooldownDashP2 = false;
    DashCompteurJ2=0;
    dashOnJ2=false;  
    vitesseVaisseauP2 = 5;  //peut etre causer probleme plus tard
    BarreChargementDashP1 =0;
    cooldownDashP1 = false;
    DashCompteurJ1=0;
    dashOnJ1=false;  
    vitesseVaisseauP1 = 5;  //peut etre causer probleme plus tard

    //plusDeVie =false;  




    BoutonlaserJ2 = false;
    RJ2 =0;

    for (int i=0; i<nombreLaserJ2; i++) {  //réinitLaser
      nbLaserJ1[nombreLaserJ2] =false;
      lbJ1[i] = 0;
      nbLaserJ2[nombreLaserJ2] =false;
      lbJ2[i] = 0;
    }




    for (int i=0; i<nbr; i++) {
      vEnemy1[i].init();
    }
    Boss1.init();
    Bouclier1.init();
    Bouclier2.init();
  }


  /*
  println( "text b2p1: "+ b2p1 );
   println( "text Boutonlaser: "+ BoutonlaserJ1 );
   println( "text nombreLaser: "+  nombreLaserJ1 );
   println( "text nbLaser[nombreLaser]: "+  nbLaserJ1[nombreLaserJ1] );
   println( "text lb[nombreLaser] "+ lbJ1[nombreLaserJ1]);
   */


  if (Nplayers == 0) {
    text("Error", width/2, height/2);
  }


  if (Nplayers == 1) {
    if (BossDestroy == false) {
      if (timerRetry == false) {  
        image(background2, 0, Ybackground2);
        image(background1, 0, Ybackground1);
        Ybackground1= Ybackground1 + difficulty;
        Ybackground2= Ybackground2 + difficulty;
        if (Ybackground1 >= 1024) Ybackground1= -1024;
        if (Ybackground2 >= 1024) Ybackground2= -1024;
      }
    }

    if (BossDestroy == true || timerRetry == true) {
      image(background2, 0, Ybackground2);
      image(background1, 0, Ybackground1);
    }

    image(backgroundfixe2, 0, 0);
    if (frameCount%60 == 0 ) {
      if (backgroundfixeChange == true) {
        backgroundfixeChange = false;
      } else { 
        backgroundfixeChange = true;
      }
    }
    if (backgroundfixeChange == true) {
      image(backgroundfixe, 0, 0);
    }


    pushStyle();
    fill(255, 255, 255, 80);
    rect(0, PosYBandeSeparation, width, larBandeArcade);      // bare bande de sépa
    popStyle();

    pushStyle();

    textAlign(LEFT);
    textFont(font);
    fill(255, 255, 255);
    font = createFont("ARCADE_N.TTF", 15);
    text("Score:"+ score, width-200, 50);
    text("Vie J1 :"+vieJ1, 0, 50);

    for (int i=0; i<vieJ1; i++) {
      fill(255, 255, 255);
      rect(200+vieJ1*40, 50, 20, 40);
    }


    textAlign(CENTER);

    if (finDeVague == true && initVagues == 0) {

      text("Difficulty : "+ difficulty + "!", width/2, height/2 );        //Au début du jeux: finDeVague=true de base et initVague =0   ===> empeche ennemy de tirer + anim de boss qui viens à rajouter


      //METTRE ANIMATION Boss

      if (frameCount%(60) == 0 ) {    
        finDeVague = false; 
        spawnEnemy = true;
        initVagues++;
        startArcade = true;    // autorisation de tirer on   (c tb a retravailler
      }
    }
    if (finDeVague == true && initVagues != 0 ) {
      text("Difficulty : "+ difficulty + "!", width/2, height/2 );   
      if (frameCount%(180) == 0 ) {    
        finDeVague = false;
      }
    }


    popStyle();

    if (protectionON == true) {           //barre de protection
      pushStyle();



      if (frameCount%2==0) {
        iAnimBarriere++;
      }
      if (iAnimBarriere == 12) iAnimBarriere = 0;

      //fill(0, 0, 255);
      // rect(0, posYBarreDeProtection, width, LonBarreDeProtection);


      pushMatrix();
      barriereAnim[iAnimBarriere].resize(1280, 30);
      image(barriereAnim[iAnimBarriere], 0, posYBarreDeProtection);
      popMatrix();


      popStyle();
    }

    // if (nBouclierOff == 2) {   //nbr ennemy vague = 15 (a changer sous variable)
    //   protectionON = false; //pour éviter de reboucler
    //}




    //------------------------------------J1


    if (vieJ1 >0) {
      if  (timerRetry == false) {  



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




        for (int i = nFrameTrainer-1; i> 0; i--) {
          trainerXp1[i] = trainerXp1[i-1];
          trainerYp1[i] = trainerYp1[i-1];
          trainerXp1[0] = posXVaisseauJ1 + LarVP/2;
          trainerYp1[0] = posYVaisseauJ1 +LonVP+ coorYTraine;
          pushStyle();
          noStroke();
          fill( 255-(i*5), 0, 0);

          if (moteursXP1 == true && moteursXP1 == true) {
            ellipse(trainerXp1[i], trainerYp1[i], 15-(i*0.5), 15-(i*0.5) );
          }
          popStyle();
        }






        if (X1 >= 1 && posXVaisseauJ1>0 ) {   

          posXVaisseauJ1 = posXVaisseauJ1 - vitesseVaisseauP1;
        }
        if (X1 <= -1 && posXVaisseauJ1 <(width - LarVP) ) {   
          posXVaisseauJ1 = posXVaisseauJ1 + vitesseVaisseauP1;
        }
        if (X1 == 0) {   
          posXVaisseauJ1 = posXVaisseauJ1 + 0;
        }

        if (Y1 <= -1  && posYVaisseauJ1 <(height - LonVP)) {   
          posYVaisseauJ1 = posYVaisseauJ1 + vitesseVaisseauP1;
        }
        if (Y1 >= 1 && posYVaisseauJ1 > PosYBandeSeparation  + larBandeArcade/2  + LonVP/2  ) {   
          posYVaisseauJ1 = posYVaisseauJ1 - vitesseVaisseauP1;
        }
        if (Y1 == 0) {   
          posYVaisseauJ1 = posYVaisseauJ1 +0;
        }



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
            nbLaserJ1[nombreLaserJ1]= true;
            BoutonlaserJ1= false;
          }
          RJ1++;
        }
        //---------------------------------------
        // println("SJ1="+SJ1+"              dashOn="+dashOnJ1);
        //println("b2p1="+b2p1+"            bouton2J1="+bouton2J1);
        //println("cooldownDash="+cooldownDash      +"              cooldownDash="+      cooldownDash +"                cooldownDashCompteur="+cooldownDashCompteur);
        //println("barreChargeP1="+barreChargeP1+"  LaserSpeJ1="+LaserSpeJ1  + "    LaserSpeCompteurJ1=" +LaserSpeCompteurJ1          );
        // if(LaserSpeJ1 == true) println("LaserSpeJ1="+LaserSpeJ1);

        if (b2p1 ==1) {         //réinit
          bouton2J1= false;
          initB2P1=0;
        }
        if (b2p1 == 0) {
          if (initB2P1 == 0) {
            bouton2J1= true;
            initB2P1++;
          }
        }

        //************************
        if (barreChargeLaserP1 == false) {
          if (bouton2J1 == true && cooldownDashP1 == true && dashOnJ1== false) {                     // rajoutez sorte de compteur
            dashOnJ1 = true;
            b2p1 = 1;
            bouton2J1 = false;
          }
        }

        if (dashOnJ1 == true) {                
          vitesseVaisseauP1 = 30;
          if (DashCompteurJ1 >= 5) {
            vitesseVaisseauP1 = 5;
            cooldownDashP1 = false;
            dashOnJ1=false;       
            DashCompteurJ1=0;     //remet le compteur de frame de dash a zero
            BarreChargementDashP1=0; //remet la barre a zero
          }
          DashCompteurJ1++;
        }



        if (BarreChargementDashP1 < LarBarreDash) {     //chargement barre
          if (frameCount%FrameChargeBarreDash==0) {
            BarreChargementDashP1++;
          }
        }
        if ( BarreChargementDashP1 == LarBarreDash) {      //barre pleine                  MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM
          cooldownDashP1 = true;
        }


        pushStyle();
        fill(187, 210, 225); // a changer de couleur 

        noStroke();
        posXBarreDashP1 = posXVaisseauJ1  + LarVP/2   - LarBarreDash/2 ;      
        posYBarreDashP1 = posYVaisseauJ1 + LonVP +15 + LonBarreLaser ;
        rect(posXBarreDashP1, posYBarreDashP1, LarBarreDash, LonBarreDash);
        popStyle();

        pushStyle();
        fill(255, 255, 0 ); // a changer de couleur 
        noStroke();
        rect(posXBarreDashP1, posYBarreDashP1, BarreChargementDashP1, LonBarreDash);
        popStyle();


        //*****************************

        if (barreChargeLaserP1 == true) {  // si Laser Chargé
          if (bouton2J1 == true && LaserSpeJ1 == false) {    // Et si Bouton appuyé
            LaserSpeJ1 = true;
            bouton2J1 = false;
          }
        }
        if (LaserSpeJ1 == true) {
          posXLaserSpeJ1 = posXVaisseauJ1  + LarVP/2   -LarLaserSpe/2;
          posYLaserSpeJ1 =  posYVaisseauJ1;
          if (protectionON == false) {
            rect(posXLaserSpeJ1, posYLaserSpeJ1, LarLaserSpe, -height);
          }
          if (protectionON == true) {
            rect(posXLaserSpeJ1, posYLaserSpeJ1, LarLaserSpe, -height + LonBarreDeProtection +posYBarreDeProtection + height - posYVaisseauJ1 );
          }
          LaserSpeCompteurJ1++;
          if ( LaserSpeCompteurJ1 == dureeLaserSpe) {  
            LaserSpeJ1 =false;
            barreChargeLaserP1 =false;
            BarreChargementLaserP1=0;
            LaserSpeCompteurJ1 =0;
          }
        }

        if (BarreChargementLaserP1 < LarBarreLaser) {     //chargement barre
          if (frameCount%FrameChargeBarreLaser==0) {
            BarreChargementLaserP1++;
          }
        }
        if ( BarreChargementLaserP1 == LarBarreLaser) {      //barre pleine 
          barreChargeLaserP1 = true;
        }
      } // AA



      pushStyle();
      fill(187, 210, 225); // a changer de couleur 

      noStroke();
      posXBarreLaserP1 = posXVaisseauJ1  + LarVP/2   - LarBarreLaser/2;
      posYBarreLaserP1 = posYVaisseauJ1 + LonVP +10 ;
      rect(posXBarreLaserP1, posYBarreLaserP1, LarBarreLaser, LonBarreLaser);
      popStyle();

      pushStyle();
      fill(0, 0, 255); // a changer de couleur 
      noStroke();
      //stroke(255, 0, 0 ); // a changer de couleur
      posXBarreLaserP1 = posXVaisseauJ1  + LarVP/2   - LarBarreLaser/2;
      posYBarreLaserP1 = posYVaisseauJ1 + LonVP +10 ;
      rect(posXBarreLaserP1, posYBarreLaserP1, BarreChargementLaserP1, LonBarreLaser);
      popStyle();







      if (startArcade == true) {                   //empeche de tirer pendant anim d'eu début
        for (int i =0; i<nMissile-1; i++) {
          if (nbLaserJ1[i] == true) {
            LaserJ1(i);
          }
        }

        if ( nombreLaserJ1 == nMissile-1) {
          nombreLaserJ1=0;
        }
      }



      X1 = 0;
      Y1 = 0;







      if (choixVP1_2 ==0) {
        pushStyle();
        fill(255, 255, 255);
        //rect(posXVaisseauJ1, posYVaisseauJ1, LarVP, LonVP);
        vaisseau1.resize(40, 40);
        pushMatrix();
        translate(-(12), 0 );
        image(vaisseau1, posXVaisseauJ1, posYVaisseauJ1); 
        popMatrix();
        popStyle();
      }
      if (choixVP1_2 ==1) {
        pushStyle();
        fill(0, 255, 0);
        //rect(posXVaisseauJ1, posYVaisseauJ1, LarVP, LonVP);
        vaisseau2.resize(40, 40);
        pushMatrix();
        translate(-(12), -5 );
        image(vaisseau2, posXVaisseauJ1, posYVaisseauJ1); 
        popMatrix();
        popStyle();
      }
      if (choixVP1_2 ==2) {
        pushStyle();
        fill(255, 0, 0);
        //rect(posXVaisseauJ1, posYVaisseauJ1, LarVP, LonVP);
        vaisseau3.resize(40, 40);
        pushMatrix();
        translate(-(12), -5 );
        image(vaisseau3, posXVaisseauJ1, posYVaisseauJ1); 
        popMatrix();
      }
    }



    if (spawnEnemy == true &&   timerRetry == false) {

      for (int i=0; i<nbr; i++) {
        vEnemy1[i].Afficher();
        vEnemy1[i].Mouv();
      }

      Bouclier1.afficherBouclier();
      Bouclier2.afficherBouclier();

      if (BossDestroy == false) { //n'affiche pas barre de vie pendant anim mort boss
        Bouclier1.BarreDeVie();
        Bouclier2.BarreDeVie();
      }
      Boss1.MouvBoss();
      Boss1.afficherBoss();
      Boss1.BarreDeVie();
      Boss1.attaqueBoss();
      Boss1.phaseMidLife();


      if (phase2 == true) {
        for (int i=0; i<nbrCannon; i++) {
          CannonG[i].Affichage();
          CannonD[i].Affichage();
        }
      }



      if (phase2 == false) {
        if (frameCount%(400) ==0) {        
          attaqueBossReady= true;
        }
      }
    } else {
      Boss1.OnlyAffichage();
      Bouclier1.OnlyAffichage();
      Bouclier2.OnlyAffichage();

      for (int i=0; i<nbr; i++) {
        vEnemy1[i].onlyAffichage();
      }
    }



    pushStyle();
    textAlign(CENTER);
    fontArcadeRetry= createFont("ARCADE_N.TTF", tailleFontArcadeRetry);
    textFont(fontArcadeRetry);
    fill(0, 255, 0);


    if (timerRetry == true) {        // désactive tout sauf l'affichage 

      if (compteurArcadeRetry >0) {
        text(compteurArcadeRetry, width/2, height/2);
      } else {
        tailleFontArcadeRetry = 120;
        text("Go!", (width/2)+30, (height/2)+30   );
        if (frameCount%(60*2)==0) {
          timerRetry = false;
          tailleFontArcadeRetry= 100; // auto réinit
          compteurArcadeRetry = 3;
          frameInvincible = true;
        }
      }
      if (frameCount%(60)==0) {   
        compteurArcadeRetry = compteurArcadeRetry - 1;
        tailleFontArcadeRetry=tailleFontArcadeRetry - 30;
      }
    }

    popStyle();

    pushStyle();
    if (frameInvincible == true) {
      fill(255, 255, 0);
      rect(posXVaisseauJ1, posYVaisseauJ1, LarVP, LonVP);
      rect(posXVaisseauJ2, posYVaisseauJ2, LarVP, LonVP);
      if (frameCount%(5*60)==0  ) {

        frameInvincible = false;
      }
    }


    popStyle();

    //-----------------------------------

    if (vieJ1 ==0 && antiExploP1==0) {
      antiExploP1++; 
      posXExplo = posXVaisseauJ1;
      posYExplo =  posYVaisseauJ1;
      explo = true;
    }

    if (vieJ1 == 0) {          //2 vaisseau détruit 
      if (frameCount%200==0) {   //ptit cooldown histoire de pas faire trop abrupte
        jeuxArcade = false;
        plusDeVie =true;       // enclenchement du menu game over
      }
    }


    //-------------------- Explo
    if ( explo  == true) {  
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
      if (iExplo==10) { 
        iExplo=0;             // sert a r
        initExplo = 0;   // sert a r
        explo = false;
      }
    }
  }

  //------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

  if (Nplayers == 2) {
    //  clear();
    //background(0);

    if (BossDestroy == false) {
      if (timerRetry == false) {  
        image(background2, 0, Ybackground2);
        image(background1, 0, Ybackground1);
        Ybackground1= Ybackground1 + difficulty;
        Ybackground2= Ybackground2 + difficulty;
        if (Ybackground1 >= 1024) Ybackground1= -1024;
        if (Ybackground2 >= 1024) Ybackground2= -1024;
      }
    }

    if (BossDestroy == true || timerRetry == true) {
      image(background2, 0, Ybackground2);
      image(background1, 0, Ybackground1);
    }

    image(backgroundfixe2, 0, 0);
    if (frameCount%60 == 0 ) {
      if (backgroundfixeChange == true) {
        backgroundfixeChange = false;
      } else { 
        backgroundfixeChange = true;
      }
    }
    if (backgroundfixeChange == true) {
      image(backgroundfixe, 0, 0);
    }


    pushStyle();
    fill(255, 255, 255, 80);
    rect(0, PosYBandeSeparation, width, larBandeArcade);      // bare bande de sépa
    popStyle();



    pushStyle();
    textAlign(LEFT);
    textFont(font);
    fill(255, 255, 255);
    font = createFont("ARCADE_N.TTF", 15);
    text("Score:"+ score, width-200, 50);
    text("Vie J1 :", 0, 50);
    text("Vie J2 :", 0, 90);


    fill(0, 255, 0);
    for (int i=0; i<vieJ1; i++) {
      rect(115+i*15, 35, 10, 20);
    }
    for (int i=0; i<vieJ2; i++) {
      rect(115+i*15, 45 + 30, 10, 20);
    }

    textAlign(CENTER);
    fill(255, 255, 255);
    if (finDeVague == true && initVagues == 0) {

      text("Difficulty : "+ difficulty + "!", width/2, height/2 );        //Au début du jeux: finDeVague=true de base et initVague =0   ===> empeche ennemy de tirer + anim de boss qui viens à rajouter


      //METTRE ANIMATION Boss

      if (frameCount%(180) == 0 ) {    
        finDeVague = false; 
        spawnEnemy = true;
        initVagues++;
        startArcade = true;    // autorisation de tirer on   (c tb a retravailler
      }
    }
    if (finDeVague == true && initVagues != 0 ) {
      text("Difficulty : "+ difficulty + "!", width/2, height/2 );   
      if (frameCount%(180) == 0 ) {    
        finDeVague = false;
      }
    }
    popStyle();

    if (protectionON == true) {           //barre de protection
      pushStyle();
      if (frameCount%2==0) {
        iAnimBarriere++;
      }
      if (iAnimBarriere == 12) iAnimBarriere = 0;


      pushMatrix();
      barriereAnim[iAnimBarriere].resize(1280, 30);
      image(barriereAnim[iAnimBarriere], 0, posYBarreDeProtection);
      popMatrix();
      popStyle();
    }

    // if (nBouclierOff == 2) {   //nbr ennemy vague = 15 (a changer sous variable)
    //   protectionON = false; //pour éviter de reboucler
    //}




    //------------------------------------J1


    if (vieJ1 >0) {
      if  (timerRetry == false) {  



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




        for (int i = nFrameTrainer-1; i> 0; i--) {
          trainerXp1[i] = trainerXp1[i-1];
          trainerYp1[i] = trainerYp1[i-1];
          trainerXp1[0] = posXVaisseauJ1 + LarVP/2;
          trainerYp1[0] = posYVaisseauJ1 +LonVP+ coorYTraine ;
          pushStyle();
          noStroke();
          fill( 255-(i*5), 0, 0);

          if (moteursXP1 == true && moteursXP1 == true) {
            ellipse(trainerXp1[i], trainerYp1[i], 15-(i*0.5), 15-(i*0.5) );
          }
          popStyle();
        }






        if (X1 >= 1 && posXVaisseauJ1>0 ) {   

          posXVaisseauJ1 = posXVaisseauJ1 - vitesseVaisseauP1;
        }
        if (X1 <= -1 && posXVaisseauJ1 <(width - LarVP) ) {   
          posXVaisseauJ1 = posXVaisseauJ1 + vitesseVaisseauP1;
        }
        if (X1 == 0) {   
          posXVaisseauJ1 = posXVaisseauJ1 + 0;
        }

        if (Y1 <= -1  && posYVaisseauJ1 <(height - LonVP)) {   
          posYVaisseauJ1 = posYVaisseauJ1 + vitesseVaisseauP1;
        }
        if (Y1 >= 1 && posYVaisseauJ1 > PosYBandeSeparation + larBandeArcade/2  + LonVP/2  ) {   
          posYVaisseauJ1 = posYVaisseauJ1 - vitesseVaisseauP1;
        }
        if (Y1 == 0) {   
          posYVaisseauJ1 = posYVaisseauJ1 +0;
        }



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
            nbLaserJ1[nombreLaserJ1]= true;
            BoutonlaserJ1= false;
          }
          RJ1++;
        }
        //---------------------------------------
        // println("SJ1="+SJ1+"              dashOn="+dashOnJ1);
        //println("b2p1="+b2p1+"            bouton2J1="+bouton2J1);
        //println("cooldownDash="+cooldownDash      +"              cooldownDash="+      cooldownDash +"                cooldownDashCompteur="+cooldownDashCompteur);
        //println("barreChargeP1="+barreChargeP1+"  LaserSpeJ1="+LaserSpeJ1  + "    LaserSpeCompteurJ1=" +LaserSpeCompteurJ1          );
        // if(LaserSpeJ1 == true) println("LaserSpeJ1="+LaserSpeJ1);

        if (b2p1 ==1) {         //réinit
          bouton2J1= false;
          initB2P1=0;
        }
        if (b2p1 == 0) {
          if (initB2P1 == 0) {
            bouton2J1= true;
            initB2P1++;
          }
        }

        //************************
        if (barreChargeLaserP1 == false) {
          if (bouton2J1 == true && cooldownDashP1 == true && dashOnJ1== false) {                     // rajoutez sorte de compteur
            dashOnJ1 = true;
            b2p1 = 1;
            bouton2J1 = false;
          }
        }

        if (dashOnJ1 == true) {                
          vitesseVaisseauP1 = 30;
          if (DashCompteurJ1 >= 5) {
            vitesseVaisseauP1 = 5;
            cooldownDashP1 = false;
            dashOnJ1=false;       
            DashCompteurJ1=0;     //remet le compteur de frame de dash a zero
            BarreChargementDashP1=0; //remet la barre a zero
          }
          DashCompteurJ1++;
        }



        if (BarreChargementDashP1 < LarBarreDash) {     //chargement barre
          if (frameCount%FrameChargeBarreDash==0) {
            BarreChargementDashP1++;
          }
        }
        if ( BarreChargementDashP1 == LarBarreDash) {      //barre pleine                  MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM
          cooldownDashP1 = true;
        }


        pushStyle();
        fill(187, 210, 225); // a changer de couleur 

        noStroke();
        posXBarreDashP1 = posXVaisseauJ1  + LarVP/2   - LarBarreDash/2;      
        posYBarreDashP1 = posYVaisseauJ1 + LonVP +15 + LonBarreLaser ;
        rect(posXBarreDashP1, posYBarreDashP1, LarBarreDash, LonBarreDash);
        popStyle();

        pushStyle();
        fill(255, 255, 0 ); // a changer de couleur 
        noStroke();
        rect(posXBarreDashP1, posYBarreDashP1, BarreChargementDashP1, LonBarreDash);
        popStyle();


        //*****************************

        if (barreChargeLaserP1 == true) {  // si Laser Chargé
          if (bouton2J1 == true && LaserSpeJ1 == false) {    // Et si Bouton appuyé
            LaserSpeJ1 = true;
            bouton2J1 = false;
          }
        }
        if (LaserSpeJ1 == true) {
          posXLaserSpeJ1 = posXVaisseauJ1  + LarVP/2   -LarLaserSpe/2;
          posYLaserSpeJ1 =  posYVaisseauJ1;
          if (protectionON == false) {
            rect(posXLaserSpeJ1, posYLaserSpeJ1, LarLaserSpe, -height);
          }
          if (protectionON == true) {
            rect(posXLaserSpeJ1, posYLaserSpeJ1, LarLaserSpe, -height + LonBarreDeProtection +posYBarreDeProtection + height - posYVaisseauJ1 );
          }
          LaserSpeCompteurJ1++;
          if ( LaserSpeCompteurJ1 == dureeLaserSpe) {  
            LaserSpeJ1 =false;
            barreChargeLaserP1 =false;
            BarreChargementLaserP1=0;
            LaserSpeCompteurJ1 =0;
          }
        }

        if (BarreChargementLaserP1 < LarBarreLaser) {     //chargement barre
          if (frameCount%FrameChargeBarreLaser==0) {
            BarreChargementLaserP1++;
          }
        }
        if ( BarreChargementLaserP1 == LarBarreLaser) {      //barre pleine 
          barreChargeLaserP1 = true;
        }
      } // AA



      pushStyle();
      fill(187, 210, 225); // a changer de couleur 

      noStroke();
      posXBarreLaserP1 = posXVaisseauJ1  + LarVP/2   - LarBarreLaser/2;
      posYBarreLaserP1 = posYVaisseauJ1 + LonVP +10 ;
      rect(posXBarreLaserP1, posYBarreLaserP1, LarBarreLaser, LonBarreLaser);
      popStyle();

      pushStyle();
      fill(0, 0, 255); // a changer de couleur 
      noStroke();
      //stroke(255, 0, 0 ); // a changer de couleur
      posXBarreLaserP1 = posXVaisseauJ1  + LarVP/2   - LarBarreLaser/2;
      posYBarreLaserP1 = posYVaisseauJ1 + LonVP +10 ;
      rect(posXBarreLaserP1, posYBarreLaserP1, BarreChargementLaserP1, LonBarreLaser);
      popStyle();







      if (startArcade == true) {                   //empeche de tirer pendant anim d'eu début
        for (int i =0; i<nMissile-1; i++) {
          if (nbLaserJ1[i] == true) {
            LaserJ1(i);
          }
        }

        if ( nombreLaserJ1 == nMissile-1) {
          nombreLaserJ1=0;
        }
      }



      X1 = 0;
      Y1 = 0;





      if (choixVP1_2 ==0) {
        pushStyle();
        fill(255, 255, 255);
        //rect(posXVaisseauJ1, posYVaisseauJ1, LarVP, LonVP);
        vaisseau1.resize(40, 40);
        pushMatrix();
        translate(-(12), 0 );
        image(vaisseau1, posXVaisseauJ1, posYVaisseauJ1); 
        popMatrix();
        popStyle();
      }
      if (choixVP1_2 ==1) {
        pushStyle();
        fill(0, 255, 0);
        //rect(posXVaisseauJ1, posYVaisseauJ1, LarVP, LonVP);
        vaisseau2.resize(40, 40);
        pushMatrix();
        translate(-(12), -5 );
        image(vaisseau2, posXVaisseauJ1, posYVaisseauJ1); 
        popMatrix();
        popStyle();
      }


      if (choixVP1_2 ==2) {
        pushStyle();
        fill(255, 0, 0);
        //rect(posXVaisseauJ1, posYVaisseauJ1, LarVP, LonVP);
        vaisseau3.resize(40, 40);
        pushMatrix();
        translate(-(12), -5 );
        image(vaisseau3, posXVaisseauJ1, posYVaisseauJ1); 
        popMatrix();


        popStyle();
      }
    }
    //-------------------------------------------------------------- J2

    if (vieJ2 >0) {

      if  (timerRetry == false) {  

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
          trainerXp2[i] = trainerXp2[i-1];
          trainerYp2[i] = trainerYp2[i-1];
          trainerXp2[0] = posXVaisseauJ2 + LarVP/2;
          trainerYp2[0] = posYVaisseauJ2 +LonVP+ coorYTraine;

          pushStyle();
          noStroke();
          fill( 255-(i*5), 0, 0);
          if (moteursXP2 == true && moteursXP2 == true) {
            ellipse(trainerXp2[i], trainerYp2[i], 15-(i*0.5), 15-(i*0.5)  );
          }
          popStyle();
        }



        if (X2 >= 1 && posXVaisseauJ2>0 ) {   
          posXVaisseauJ2 = posXVaisseauJ2 - vitesseVaisseauP2;
        }
        if (X2 <= -1 && posXVaisseauJ2 <(width - LarVP) ) {   
          posXVaisseauJ2 = posXVaisseauJ2 + vitesseVaisseauP2;
        }
        if (X2 == 0) {   
          posXVaisseauJ2 = posXVaisseauJ2 + 0;
        }

        if (Y2 <= -1  && posYVaisseauJ2 <(height - LonVP)) {   
          posYVaisseauJ2 = posYVaisseauJ2 + vitesseVaisseauP2;
        }
        if (Y2 >= 1 && posYVaisseauJ2>  PosYBandeSeparation  + larBandeArcade/2  + LonVP/2   ) {   
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
            nbLaserJ2[nombreLaserJ2]= true;
            BoutonlaserJ2= false;
          }
          RJ2++;
        }


        if (b2p2 ==1) {         //réinit
          bouton2J2= false;
          initB2P2=0;
        }
        if (b2p2 == 0) {
          if (initB2P2 == 0) {
            bouton2J2= true;
            initB2P2++;
          }
        }

        //************************
        if (barreChargeLaserP2 == false) {
          if (bouton2J2 == true && cooldownDashP2 == true && dashOnJ2 == false) {                     // rajoutez sorte de compteur
            dashOnJ2 = true;
            b2p2 = 1;
            bouton2J2 = false;
          }
        }

        if (dashOnJ2 == true) {                
          vitesseVaisseauP2 = 30;
          if (DashCompteurJ2 >= 5) {
            vitesseVaisseauP2 = 5;
            cooldownDashP2 = false;
            dashOnJ2=false;       
            DashCompteurJ2=0;     //remet le compteur de frame de dash a zero
            BarreChargementDashP2=0; //remet la barre a zero
          }
          DashCompteurJ2++;
        }



        if (BarreChargementDashP2 < LarBarreDash) {     //chargement barre
          if (frameCount%FrameChargeBarreDash==0) {
            BarreChargementDashP2++;
          }
        }
        if ( BarreChargementDashP2 == LarBarreDash) {      //barre pleine         
          cooldownDashP2 = true;
        }


        pushStyle();
        fill(187, 210, 225); // a changer de couleur 

        noStroke();
        posXBarreDashP2 = posXVaisseauJ2  + LarVP/2   - LarBarreDash/2;      
        posYBarreDashP2 = posYVaisseauJ2 + LonVP +15 + LonBarreLaser ;
        rect(posXBarreDashP2, posYBarreDashP2, LarBarreDash, LonBarreDash);
        popStyle();

        pushStyle();
        fill(255, 255, 0); // a changer de couleur 
        noStroke();
        rect(posXBarreDashP2, posYBarreDashP2, BarreChargementDashP2, LonBarreDash);
        popStyle();







        //*****************************                                            /

        if (barreChargeLaserP2 == true) {  // si Laser Chargé
          if (bouton2J2 == true && LaserSpeJ2 == false) {    // Et si Bouton appuyé
            LaserSpeJ2 = true;
            bouton2J2 = false;
          }
        }
        if (LaserSpeJ2 == true) {
          posXLaserSpeJ2 = posXVaisseauJ2  + LarVP/2   -LarLaserSpe/2;
          posYLaserSpeJ2 =  posYVaisseauJ2;   
          if (protectionON == false) {
            rect(posXLaserSpeJ2, posYLaserSpeJ2, LarLaserSpe, -height);
          }
          if (protectionON == true) {
            rect(posXLaserSpeJ2, posYLaserSpeJ2, LarLaserSpe, -height + LonBarreDeProtection +posYBarreDeProtection + height - posYVaisseauJ2 );
          }

          LaserSpeCompteurJ2++;
          if ( LaserSpeCompteurJ2 == dureeLaserSpe) {  
            LaserSpeJ2 =false;
            barreChargeLaserP2 =false;
            BarreChargementLaserP2=0;
            LaserSpeCompteurJ2 =0;
          }
        }

        if (BarreChargementLaserP2 < LarBarreLaser) {     //chargement barre
          if (frameCount%FrameChargeBarreLaser==0) {
            BarreChargementLaserP2++;
          }
        }
        if ( BarreChargementLaserP2 == LarBarreLaser) {      //barre pleine 
          barreChargeLaserP2 = true;
        }
      }


      pushStyle();
      fill(187, 210, 225); // a changer de couleur 

      noStroke();
      posXBarreLaserP2 = posXVaisseauJ2  + LarVP/2   - LarBarreLaser/2;
      posYBarreLaserP2 = posYVaisseauJ2 + LonVP +10 ;
      rect(posXBarreLaserP2, posYBarreLaserP2, LarBarreLaser, LonBarreLaser);
      popStyle();

      pushStyle();
      fill(0, 0, 255); // a changer de couleur 
      noStroke();
      //stroke(255, 0, 0 ); // a changer de couleur
      rect(posXBarreLaserP2, posYBarreLaserP2, BarreChargementLaserP2, LonBarreLaser);
      popStyle();



      if (startArcade == true) {                   //empeche de tirer pendant anim d'eu début
        for (int i =0; i<nMissile-1; i++) {
          if (nbLaserJ2[i] == true) {
            LaserJ2(i);
          }
        }

        if ( nombreLaserJ2 == nMissile-1) {
          nombreLaserJ2=0;
        }
      }






      X2 = 0;
      Y2 = 0;

      if (choixVP2 ==0) {
        pushStyle();
        fill(255, 255, 255);
        //rect(posXVaisseauJ2, posYVaisseauJ2, LarVP, LonVP);

        vaisseau1.resize(40, 40);
        pushMatrix();
        //   translate(-(vaisseau1.width/2, -(vaisseau1.height/2));
        translate(-(12), 0 );
        image(vaisseau1, posXVaisseauJ2, posYVaisseauJ2); 
        popMatrix();
        popStyle();
      }


      if (choixVP2 ==1) {
        pushStyle();
        fill(0, 255, 0);
        //rect(posXVaisseauJ2, posYVaisseauJ2, LarVP, LonVP);
        pushMatrix();
        vaisseau2.resize(40, 40);
        translate(-(12), -5 );
        image(vaisseau2, posXVaisseauJ2, posYVaisseauJ2); 
        popMatrix();


        popStyle();
      }


      if (choixVP2 ==2) {
        pushStyle();
        fill(255, 0, 0);
        //rect(posXVaisseauJ2, posYVaisseauJ2, LarVP, LonVP);

        vaisseau3.resize(40, 40);
        pushMatrix();
        translate(-(12), -5 );
        image(vaisseau3, posXVaisseauJ2, posYVaisseauJ2); 
        popMatrix();


        popStyle();
      }
    }

    // --------------------------------- Vaisseau Ennemy   

    /*
    if (spawnEnemy == true) {
     for (int i=0; i<nbr; i++) {
     vEnemy1[i].Afficher();
     vEnemy1[i].Mouv();
     }
     }
     */




    if (spawnEnemy == true &&   timerRetry == false) {

      for (int i=0; i<nbr; i++) {
        vEnemy1[i].Afficher();
        vEnemy1[i].Mouv();
      }

      Bouclier1.afficherBouclier();
      Bouclier2.afficherBouclier();

      if (BossDestroy == false) { //n'affiche pas barre de vie pendant anim mort boss
        Bouclier1.BarreDeVie();
        Bouclier2.BarreDeVie();
      }
      Boss1.MouvBoss();
      Boss1.afficherBoss();
      Boss1.BarreDeVie();
      Boss1.attaqueBoss();
      Boss1.phaseMidLife();


      if (phase2 == true) {
        for (int i=0; i<nbrCannon; i++) {
          CannonG[i].Affichage();
          CannonD[i].Affichage();
        }
      }



      if (phase2 == false) {
        if (frameCount%(400) ==0) {        
          attaqueBossReady= true;
        }
      }
    } else {
      Boss1.OnlyAffichage();
      Bouclier1.OnlyAffichage();
      Bouclier2.OnlyAffichage();

      for (int i=0; i<nbr; i++) {
        vEnemy1[i].onlyAffichage();
      }
    }

    pushStyle();
    textAlign(CENTER);
    fontArcadeRetry= createFont("ARCADE_N.TTF", tailleFontArcadeRetry);
    textFont(fontArcadeRetry);
    fill(0, 255, 0);


    if (timerRetry == true) {        // désactive tout sauf l'affichage 

      if (compteurArcadeRetry >0) {
        text(compteurArcadeRetry, width/2, height/2);
      } else {
        tailleFontArcadeRetry = 120;
        text("Go!", (width/2)+30, (height/2)+30   );
        if (frameCount%(60*2)==0) {
          timerRetry = false;
          tailleFontArcadeRetry= 100; // auto réinit
          compteurArcadeRetry = 3;
          frameInvincible = true;
        }
      }
      if (frameCount%(60)==0) {   
        compteurArcadeRetry = compteurArcadeRetry - 1;
        tailleFontArcadeRetry=tailleFontArcadeRetry - 30;
      }
    }

    popStyle();

    pushStyle();
    if (frameInvincible == true) {
      fill(255, 255, 0);
      rect(posXVaisseauJ1, posYVaisseauJ1, LarVP, LonVP);
      rect(posXVaisseauJ2, posYVaisseauJ2, LarVP, LonVP);
      if (frameCount%(5*60)==0  ) {

        frameInvincible = false;
      }
    }


    popStyle();

    //-----------------------------------

    if (vieJ1 ==0 && antiExploP1==0) {
      antiExploP1++; 
      posXExplo1 = posXVaisseauJ1;
      posYExplo1 =  posYVaisseauJ1;
      explo1 = true;
    }

    if (vieJ2 ==0  && antiExploP2==0) {
      antiExploP2++;
      posXExplo2 = posXVaisseauJ2;
      posYExplo2 =  posYVaisseauJ2;
      explo2 = true;
    }

    if (vieJ1 == 0 && vieJ2 == 0) {          //2 vaisseau détruit 
      if (frameCount%200==0) {   //ptit cooldown histoire de pas faire trop abrupte
        jeuxArcade = false;
        plusDeVie =true;       // enclenchement du menu game over
      }
    }


    //-------------------- Explo
    if ( explo1  == true) {  
      if (initExplo1 == 0) {
        frameCount = 0;              //sert a r 
        initExplo1++;
      }
      if (frameCount%iniVitesseExplo==0) {
        iExplo1++;
      }
      pushMatrix();
      translate(-(explosion[iExplo1].width/2), -(explosion[iExplo1].height/2));
      image(explosion[iExplo1], posXExplo1, posYExplo1);
      popMatrix();
      if (iExplo1==10) { 
        iExplo1=0;             // sert a r
        initExplo1 = 0;   // sert a r
        explo1 = false;
      }
    }
    //------------------------------------------------------------------------------------
    if ( explo2  == true) {  
      if (initExplo2 == 0) {
        frameCount = 0;              //sert a r 
        initExplo2++;
      }
      if (frameCount%iniVitesseExplo==0) {
        iExplo2++;
      }
      //  explosion[i] = loadImage("Explosion_" +iExplo2 + ".png");
      pushMatrix();
      translate(-(explosion[iExplo2].width/2), -(explosion[iExplo2].height/2));
      image(explosion[iExplo2], posXExplo2, posYExplo2);
      popMatrix();
      if (iExplo2==10) { 
        iExplo2=0;             // sert a r
        initExplo2 = 0;   // sert a r
        explo2 = false;
      }
    }
  }
}
//--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
