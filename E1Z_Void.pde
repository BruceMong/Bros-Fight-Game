void LaserJ1(int R) { //<>//
  /*
  if (initLaserJ1[R] ==0) {
   nbLaserJ1[R]= false; 
   lbJ1[R]=0    ;
   initLaserJ1[R] = 1;
   }
   */

  if (lbJ1[R] == 0) {
    posLaserXJ1[R]= posXVaisseauJ1 + LarVP/2;
    posLaserYJ1[R]= posYVaisseauJ1;
  }
  lbJ1[R]++;
  posLaserYJ1[R]=posLaserYJ1[R] - 10;
  if (protectionON == false) {
    if (posLaserYJ1[R] < -100) {
      nbLaserJ1[R]= false; 
      lbJ1[R]=0;
    }
  }
  if (protectionON == true) {
    if (posLaserYJ1[R] < LonBarreDeProtection +posYBarreDeProtection ) {
      nbLaserJ1[R]= false; 
      lbJ1[R]=0;
    }
  }


  LaserSimpleVaisseau.resize(0, 20);
  pushMatrix();
  translate(-( LaserSimpleVaisseau.width/2), 0);

  image(LaserSimpleVaisseau, posLaserXJ1[R], posLaserYJ1[R]);
  popMatrix();
  // rect(posLaserXJ1[R], posLaserYJ1[R], larLaser, lonLaser);   //Hitbox
}

void LaserJ2(int R) {
  /*
    if (initLaserJ2[R] ==0) {
   nbLaserJ2[R]= false;  
   lbJ2[R]=0    ;
   initLaserJ2[R] = 1;
   }
   */


  if (lbJ2[R] == 0) {
    posLaserXJ2[R]= posXVaisseauJ2 + LarVP/2;
    posLaserYJ2[R]= posYVaisseauJ2;
  }
  lbJ2[R]++;
  posLaserYJ2[R]=posLaserYJ2[R] - 10;
  if (protectionON == false) {
    if (posLaserYJ2[R] < -100) {
      nbLaserJ2[R]= false; 
      lbJ2[R]=0;
    }
  }
  if (protectionON == true) {
    if (posLaserYJ2[R] < LonBarreDeProtection +posYBarreDeProtection ) {
      nbLaserJ2[R]= false; 
      lbJ2[R]=0;
    }
  }

  LaserSimpleVaisseau.resize(0, 20);
  pushMatrix();
  translate(-( LaserSimpleVaisseau.width/2), 0);

  image(LaserSimpleVaisseau, posLaserXJ2[R], posLaserYJ2[R]);
  popMatrix();
  // rect(posLaserXJ2[R], posLaserYJ2[R], larLaser, lonLaser);
}


class vEnemy {
  int LarVen, LonVen, posXVen, posYVen, deltaXVen, deltaYVen, lifeEn, CompteurEn, initLife, initPosXVen, initPosYVen;
  boolean etat;
  int difficultyMouvEn, difficultyMouvEnCompteur, initDifficultyMouvEn, initDeltaY;
  // vEnemy(int nouvX, int nouvY, int nouvdeltaX, int nouvdeltaY, int nouvLarVen, int nouvLonVen, boolean newEtat, int newLifeEn, int newCompteurEn ) {
  vEnemy(int nouvX, int nouvY, int nouvdeltaX, int nouvdeltaY, int nouvLarVen, int nouvLonVen, boolean newEtat, int newLifeEn, int newDifficultyMouvEn ) {
    posXVen = nouvX;
    posYVen = nouvY;
    initPosXVen = nouvX;
    initPosYVen = nouvY;

    deltaXVen = nouvdeltaX;
    deltaYVen = nouvdeltaY ;
    LarVen= nouvLarVen;
    LonVen= nouvLonVen;
    etat=newEtat;
    lifeEn= newLifeEn;
    initLife=newLifeEn;

    initDeltaY = deltaYVen;

    difficultyMouvEn = newDifficultyMouvEn;
    initDifficultyMouvEn=newDifficultyMouvEn;
  }

  void init() {

    posXVen= initPosXVen;
    posYVen= initPosYVen;
    lifeEn=initLife;
    difficultyMouvEn = initDifficultyMouvEn;
    deltaYVen=  initDeltaY ;
  }


  void onlyAffichage() {
    if (etat==false) {
      for (int i=0; i<2; i++) {
        asteroid[i].resize(20, 20);
      }

      switch(lifeEn) {
      case 1:
        image(asteroid[3], posXVen, posYVen);
        break;
      case 2: 
        image(asteroid[2], posXVen, posYVen);
        break;
      case 3:
        image(asteroid[1], posXVen, posYVen);
        break;
      }
    }
  }

  void Afficher() {

    // println(deltaYVen);

    //coli LaserSpé En -------------------------------------------------------------------------------------------------------------------------------------------------------




    //----------------------------------------------------------------- Coli Laser Ennnemy
    if (vieJ1 >0) {
      for (int i=0; i<nMissile; i++) {
        if (
          ( posLaserXJ1[i] >= posXVen) && ( posLaserXJ1[i] <= (posXVen + LarVen))  &&  
          ( posLaserYJ1[i] >= posYVen) && ( posLaserYJ1[i] <= (posYVen + LonVen)) 
          ) {
          nbLaserJ1[i]= false;
          lbJ1[i]=0;
          posLaserXJ1[i]= -100;  //valeur random juste histoire de pas loop la condition
          posLaserYJ1[i]= -100;

          lifeEn--;
        }
      }
      if (LaserSpeJ1  == true) {                                                                              // Colie laserSPé
        if (
          ( (posXVen>posXLaserSpeJ1) && (posXVen<posXLaserSpeJ1+ LarLaserSpe ) 
          && (posYVen<posYLaserSpeJ1))
          ||
          ( (posXVen+LarVen > posXLaserSpeJ1) && (posXVen+LarVen <posXLaserSpeJ1+ LarLaserSpe ) )
          && (posYVen<posYLaserSpeJ1))
        {

          lifeEn--;
        }
      }
    }

    if (vieJ2 >0) {
      for (int i=0; i<nMissile-1; i++) {
        if (
          ( posLaserXJ2[i] >= posXVen) && ( posLaserXJ2[i] <= (posXVen + LarVen))  &&  
          ( posLaserYJ2[i] >= posYVen) && ( posLaserYJ2[i] <= (posYVen + LonVen)) 
          ) {
          nbLaserJ2[i]= false;
          lbJ2[i]=0;
          posLaserXJ2[i]= -100;  //valeur random juste histoire de pas loop la condition
          posLaserYJ2[i]= -100;

          lifeEn--;
        }
      }
      if (LaserSpeJ2  == true) {                                                                              // Colie laserSPé
        if (
          ( (posXVen>posXLaserSpeJ2) && (posXVen<posXLaserSpeJ2+ LarLaserSpe ) 
          && (posYVen<posYLaserSpeJ2))
          ||
          ( (posXVen+LarVen > posXLaserSpeJ2) && (posXVen+LarVen <posXLaserSpeJ2+ LarLaserSpe ) 
          && (posYVen<posYLaserSpeJ2) )

          ) {

          lifeEn--;
        }
      }
    }


    //-----------------------------------------------------------------------

    if (lifeEn <=0 ) etat = true;     // quand Ennemy a plus de vie

    if (etat==false) {
       pushStyle();
      //  fill(255-((initLife-lifeEn)*(255/initLife)), 0, 0);    
      //rect(posXVen, posYVen, LarVen, LonVen);


      for (int i=0; i<3; i++) {
        asteroid[i].resize(20, 20);
      }

      switch(lifeEn) {
      case 1:
        image(asteroid[2], posXVen, posYVen);
        break;
      case 2: 
        image(asteroid[1], posXVen, posYVen);
        break;
      case 3:
        image(asteroid[0], posXVen, posYVen);
        break;
      }




      if (frameCount%2==0) {
        iAnimEnemy++;
      }
      if (iAnimEnemy == 4) iAnimEnemy = 0;


      pushMatrix();
      // AnimEnemy[iAnimEnemy].resize(0, 90);
      // translate(-(AnimEnemy[iAnimEnemy].width/2) +90, -(AnimEnemy[iAnimEnemy].height/2));
      // translate(-(AnimEnemy[iAnimEnemy].width/2) +90, -(AnimEnemy[iAnimEnemy].height/2));
      // image(AnimEnemy[iAnimEnemy], posXVen, posYVen);
      popMatrix();










      //  popStyle();


      //  AnimEnemy = loadImage("mobs-1.gif");
      //   translate(-(AnimEnemy.width/2) +90, -(AnimEnemy.height/2));
      // image(AnimEnemy, posXVen, posYVen, 100, 100);


      /*
       if (frameCount%2==0)   
       if (iAnimEnemy == 5) iAnimEnemy = 1;
       
       AnimEnemy[i] = loadImage("mobs-" +iAnimEnemy + ".gif");
       AnimEnemy[i].resize(0, 220);
       
       pushMatrix();
       translate(-(AnimEnemy[i].width/2) +90, -(AnimEnemy[i].height/2));
       image(AnimEnemy[i], posXVen, posYVen);
       
       popMatrix();
       
       */
      popStyle();
    }
    /*
    if (etat==true) {
     posXVen=0;
     posYVen=0;
     CompteurEn++;
     if (CompteurEn == 1) {
     nEnemyOff++;
     score+= 150;
     }
     }
     
     
     
     
     if (nEnemyOff == 15) {   //nbr ennemy vague = 15 (a changer sous variable)
     vague++;
     finDeVague = true;
     nEnemyOff++; //pour éviter de reboucler
     }
     */

    if (etat==true) {
      posYVen=height+100;  //pour éviter de perdre des pv inutilement 
      CompteurEn++;
      if (CompteurEn == 1) {
        nEnemyOff++;
        score+= 150;
        etat=false;
        CompteurEn=0;
        lifeEn = initLife;
      }
    }


    /*

     if (nEnemyOff == 15) {   //nbr ennemy vague = 15 (a changer sous variable)
     vague++;
     finDeVague = true;
     nEnemyOff=0; //pour éviter de reboucler
     }
     */



    //------------------- Colision Ennemy Vaisseau

    if (BossDestroy == false) {

      if (vieJ1 >0) {
        if (
          (( (posXVaisseauJ1>= posXVen) && ( posXVaisseauJ1 <= posXVen+LarVen) ) &&
          ((posYVaisseauJ1>= posYVen) && ( posYVaisseauJ1 <= posYVen+LonVen) )) 
          ||
          (( (posXVaisseauJ1+LarVP >= posXVen) && ( posXVaisseauJ1+LarVP <= posXVen+LarVen)) &&
          ((posYVaisseauJ1+LonVP>= posYVen) && ( posYVaisseauJ1+LonVP <= posYVen+LonVen) ))
          ||
          ((  posXVen + LarVen >=  posXVaisseauJ1) && (  posXVen + LarVen <= posXVaisseauJ1+LarVP) )&&
          ((  posYVen + LonVen >=  posYVaisseauJ1) && (  posYVen + LonVen <= posYVaisseauJ1+LonVP))
          )



          /*   if ( (
           ( posXVen >= posXVaisseauJ1) && (posXVen <= (posXVaisseauJ1 + LarVP))  &&  
           ( posYVen >= posYVaisseauJ1) && ( posYVen <= (posYVaisseauJ1 + LonVP)) 
           )
           ||
           ( posXVen+LarVen >= posXVaisseauJ1) && (posXVen+LarVen <= (posXVaisseauJ1 + LarVP))  &&    // Ancienne Coli claqué
           ( posYVen+LonVen >= posYVaisseauJ1) && ( posYVen+ LonVen <= (posYVaisseauJ1 + LonVP)) 
           ) */


        {
          lifeEn=0;
          coliVenP1 = true;
        }
      }
      if (coliVenP1 == true) {    //si colision entre Vaisseau et Ennemy est vrai
        if (frameInvincible == false) {
          vieJ1 --;
        }
        coliVenP1 = false;
      }



      if (vieJ2 >0) {
        if (

          (( (posXVaisseauJ2>= posXVen) && ( posXVaisseauJ2 <= posXVen+LarVen) ) &&
          ((posYVaisseauJ2>= posYVen) && ( posYVaisseauJ2 <= posYVen+LonVen) )) 
          ||
          (( (posXVaisseauJ2+LarVP >= posXVen) && ( posXVaisseauJ2+LarVP <= posXVen+LarVen) ) &&
          ((posYVaisseauJ2+LonVP>= posYVen) && ( posYVaisseauJ2+LonVP <= posYVen+LonVen) ))
          ||
          ((  posXVen + LarVen >=  posXVaisseauJ2) && (  posXVen + LarVen <= posXVaisseauJ2+LarVP) )&&
          ((  posYVen + LonVen >=  posYVaisseauJ2) && (  posYVen + LonVen <= posYVaisseauJ2+LonVP))

          )

        {
          lifeEn=0;
          coliVenP2 = true;
        }
      }
      if (coliVenP2 == true) {
        if (frameInvincible == false) {
          vieJ2 --;
        }
        coliVenP2 = false;
      }
    }
  }





  void Mouv() {


    if (BossDestroy == true) {
      difficultyMouvEnCompteur++;
      if (difficultyMouvEnCompteur ==1) {
        deltaYVen= deltaYVen + difficultyMouvEn;
      }
    }

    if (BossDestroy == false) {
      difficultyMouvEnCompteur =0;
      posXVen += deltaXVen;
      posYVen += deltaYVen ;
      if (( posXVen>width-LarVen) || (posXVen<LarVen)) {
        deltaXVen= -deltaXVen;
      }

      //   if ( posYVen>height+100) {
      if (phase2 == false) {
        if ( posYVen>random(height, height*10 ) ) {  // pour les dispatché un peu
          posYVen = PosYBandeSeparation  + larBandeArcade/2 ;
          posXVen = int(random(width));
          lifeEn = initLife;
        }
      }
    }
  }
  /*    if (( posYVen>height-LonVen) || (posYVen<LonVen)) {
   deltaYVen= -deltaYVen;
   }
   } */
}









class Boss {
  int LarBoss, LonBoss, posXBoss, posYBoss, deltaXBoss, deltaYBoss, lifeBoss, CompteurBossScore, initLifeBoss, posXBossInit, posYBossInit; 
  int LarLaserBoss =10, LonLaserBoss = 20, LaserBossCompteur, posXLaserBoss1, posXLaserBoss2, posYLaserBoss ; 
  int LaserBossAnimCompteur=1;
  int BossAnimDeathCompteur;
  int deplacementRepopBoss;
  boolean LaserBoss, LaserBossAnim, LaserBossAnimEnd; 
  int AnimDeRepopBoss;
  boolean etatBoss;
  boolean BossDir;
  int compteurBossDir;
  int initDifficultyMouvBoss, initDeltaXBoss; 
  int difficultyMouvBoss, initPosXBoss;
  // vEnemy(int nouvX, int nouvY, int nouvdeltaX, int nouvdeltaY, int nouvLarVen, int nouvLonVen, boolean newEtat, int newLifeEn, int newCompteurEn ) {
  Boss(int nouvXBoss, int nouvYBoss, int nouvdeltaXBoss, int nouvdeltaYBoss, int nouvLarBoss, int nouvLonBoss, boolean newEtatBoss, int newLifeBoss, int newDifficultyMouvBoss) {
    posXBoss = nouvXBoss;
    posYBoss = nouvYBoss;
    deltaXBoss = nouvdeltaXBoss ;
    deltaYVen = nouvdeltaYBoss;
    LarBoss= nouvLarBoss;
    LonBoss= nouvLonBoss;
    etatBoss=newEtatBoss;
    lifeBoss= newLifeBoss;
    initLifeBoss = newLifeBoss;
    posXBossInit = posXBoss;
    posYBossInit = posYBoss;
    difficultyMouvBoss= newDifficultyMouvBoss;
    initDifficultyMouvBoss = difficultyMouvBoss;
    initDeltaXBoss =deltaXBoss;
    initPosXBoss = posXBoss;
  }

  void init() {
    lifeBoss = initLifeBoss;
    posXBoss = initPosXBoss; 


    difficultyMouvBoss = initDifficultyMouvBoss;
    deltaXBoss=initDeltaXBoss;

    BossAnimDeathCompteur =0;
    etatBoss=false;
    AnimDeRepopBoss =0;
    BossDestroy=false;
    deplacementRepopBoss =0;


    LaserBoss = false;
    LaserBossAnim= false;
    LaserBossAnimCompteur =0;
    LaserBossCompteur = 0;
    LaserBossCompteur =0;
    attaqueBossReady= false;
    initPhase2 = 0;
  }




  void afficherBoss() {
    if (etatBoss == false) {  // empeche de mettre la vie en négatif
      if (protectionON == false) {  //si protection false alors colision possible
        if (vieJ1 >0) {    
          //coli missile/boss
          for (int i=0; i<nMissile; i++) {                                                                          
            if (
              ( posLaserXJ1[i] >= posXBoss) && ( posLaserXJ1[i] <= (posXBoss + LarBoss))  &&  
              ( posLaserYJ1[i] >= posYBoss) && ( posLaserYJ1[i] <= (posYBoss + LonBoss)) 
              ) {
              nbLaserJ1[i]= false;
              lbJ1[i]=0;
              posLaserXJ1[i]= -100;  //valeur random juste histoire de pas loop la condition
              posLaserYJ1[i]= -100;

              lifeBoss--;
            }
          }

          if (LaserSpeJ1  == true) {                                                                              // Colie laserSPé Boss
            if (
              ((posXBoss>posXLaserSpeJ1) && (posXBoss<posXLaserSpeJ1+ LarLaserSpe ) 
              && (posYBoss<posYLaserSpeJ1) )
              ||
              ( (posXBoss+LarBoss > posXLaserSpeJ1) && (posXBoss+LarBoss <posXLaserSpeJ1+ LarLaserSpe ) )
              //&& (posYVen<posYLaserSpeJ1 - heigh)  //useless + marche pas 
              ||
              (( posXLaserSpeJ1) > posXBoss ) &&( posXLaserSpeJ1 < posXBoss+LarBoss )
              ) {
              lifeBoss--;
            }
          }
        }

        if (vieJ2 >0) {
          for (int i=0; i<nMissile-1; i++) {
            if (
              ( posLaserXJ2[i] >= posXBoss) && ( posLaserXJ2[i] <= (posXBoss + LarBoss))  &&  
              ( posLaserYJ2[i] >= posYBoss) && ( posLaserYJ2[i] <= (posYBoss + LonBoss)) 
              ) {
              nbLaserJ2[i]= false;
              lbJ2[i]=0;
              posLaserXJ2[i]= -100;  //valeur random juste histoire de pas loop la condition
              posLaserYJ2[i]= -100;

              lifeBoss--;
            }
          }

          if (LaserSpeJ2  == true) {                                                                              // Colie laserSPé Boss
            if (
              ((posXBoss>posXLaserSpeJ2) && (posXBoss<posXLaserSpeJ2+ LarLaserSpe ) 
              && (posYBoss<posYLaserSpeJ2) )
              ||
              ( (posXBoss+LarBoss > posXLaserSpeJ2) && (posXBoss+LarBoss <posXLaserSpeJ2+ LarLaserSpe ) )
              ||
              (( posXLaserSpeJ2) > posXBoss ) &&( posXLaserSpeJ2 < posXBoss+LarBoss )
              ) {
              lifeBoss--;
            }
          }
        }
      }
    }

    if (lifeBoss <= 0 ) etatBoss = true;     // quand Boss a plus de vie

    if (etatBoss==false) {
      if (LaserBossAnim== false) {
        pushStyle();
        fill(255, 0, 0 );    
        //  rect(posXBoss, posYBoss, LarBoss, LonBoss); 
        if (frameCount%1==0)   iAnimNeutreBoss++;
        if (iAnimNeutreBoss == 29) iAnimNeutreBoss = 0;

        //  println(iAnimNeutreBoss);

        BossAnimNeutre[iAnimNeutreBoss].resize(0, 220);
        pushMatrix();
        translate(-(BossAnimNeutre[iAnimNeutreBoss].width/2) +90, -(BossAnimNeutre[iAnimNeutreBoss].height/2));
        image(BossAnimNeutre[iAnimNeutreBoss], posXBoss, posYBoss);
        popMatrix();
        popStyle();
      }
    }

    if (etatBoss==true) { 
      BossDestroy = true;

      if (frameCount%2==0) {
        BossAnimDeathCompteur++;
      }


      // if (BossAnimDeathCompteur < 200) {   // temps anim death

      pushStyle();
      fill(0, 255, 0 );    
      //  rect(posXBoss, posYBoss, LarBoss, LonBoss);      // METTRE ANIMATION MORT
      popStyle();

      if (iAnimDeath <9) {
        if (frameCount%2==0)   iAnimDeath++;     // si anim tête explose n'est pas a sa moité alors elle se lance
        // if (iAnimNeutreBoss == 30) iAnimNeutreBoss = 1;
      }

      if (iAnimDeath ==9) {  // si anim tete qui explose  est a sa moitié attendre 50 frame  puis lancer la fin de l'anim 
        if (frameCount%50==0) {
          endingAnimDeathBoss = true;
        }
      }
      if (endingAnimDeathBoss == true) {
        if (iAnimDeath <17) {                 //fin de l'anim tête qui explose
          if (frameCount%2==0)   iAnimDeath++;
        }
        if (iAnimDeath >= 17) {     // quand anim tete qui explose est terminer si début anim explosion 
          if (iexploBoss < 15) {
            iexploBoss++;
            exploBoss[iexploBoss].resize(0, 220);
            pushMatrix();
            translate(-(exploBoss[iexploBoss].width/2) +90, -(exploBoss[iexploBoss].height/2));
            image(exploBoss[iexploBoss], posXBoss, posYBoss);
            popMatrix();
          }
        }
      }



      //  BossAnimDeath[i] = loadImage("BossDeath-" +iAnimDeath + ".png");

      BossAnimDeath[iAnimDeath].resize(0, 220);

      pushMatrix();
      translate(-(BossAnimDeath[iAnimDeath].width/2) +90, -(BossAnimDeath[iAnimDeath].height/2));
      image(BossAnimDeath[iAnimDeath], posXBoss, posYBoss);

      popMatrix();




      //   if (BossAnimDeathCompteur == 200) {
      if (iexploBoss  == 15 && initDeathBoss ==0) {

        posXBoss = posXBossInit;                                                                    //            MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM
        posYBoss = 0 - LonBoss;
        nBossOff++;
        score+= 1000;
        initDeathBoss++;
        // à utiliser plus tard
      }
      if (iexploBoss  >= 15 ) {  // + temps de repop 
        if (frameCount%180==0) {
          repopBoss = true;
        }


        if ( repopBoss == true) {
          pushStyle();
          fill(255, 255, 0 );    // en un peu plus rouge ou autre 
          //        rect(posXBoss, posYBoss, LarBoss, LonBoss);
          fill(255, 0, 0 );    
          //   rect(posXBoss, posYBoss, LarBoss, LonBoss); 
          if (frameCount%1==0)   iAnimNeutreBoss++;
          if (iAnimNeutreBoss == 29) iAnimNeutreBoss = 0;
          BossAnimNeutre[iAnimNeutreBoss].resize(0, 220);
          pushMatrix();
          translate(-(BossAnimNeutre[iAnimNeutreBoss].width/2) +90, -(BossAnimNeutre[iAnimNeutreBoss].height/2));
          image(BossAnimNeutre[iAnimNeutreBoss], posXBoss, posYBoss);
          popMatrix();
          popStyle();

          deplacementRepopBoss++;

          if (posYBoss < posYBossInit) {
            posYBoss =  0 - LonBoss +  deplacementRepopBoss;
          }
          if (posYBoss == posYBossInit) {
            AnimDeRepopBoss++;
            if (AnimDeRepopBoss == 200) {
              lifeBoss = initLifeBoss; // ++qq chose
              etatBoss=false;
              BossAnimDeathCompteur=0;
              deplacementRepopBoss =0;
              AnimDeRepopBoss=0;
              BossDestroy=false;
              difficulty++;
              finDeVague = true;
              initDeathBoss =0;
              iexploBoss =0;
              iAnimDeath =0;
              repopBoss = false;
              endingAnimDeathBoss = false;
              //initPhase2 = 0; empeche de refaire une phase2
            }
          }
        }
      }
    }
    //  println( "BossAnimDeathCompteur="+BossAnimDeathCompteur+"  deplacementRepopBoss="+ deplacementRepopBoss +"      AnimDeRepopBoss"+AnimDeRepopBoss    );
  }

  void phaseMidLife() {
    if (  lifeBoss <= initLifeBoss/2) {
      if ( initPhase2 == 0) {
        phase2 = true;
        initPhase2 = 1;
      }
    }
    /*
    println(phase2);
     println( "phase2MouvBoss:" + phase2MouvBoss );
     println( "posXBoss:" +  posXBoss);
     if (posXBoss == (width/2 -(BossAnimNeutre[iAnimNeutreBoss].width/2)) ) {
     println("BOOM");
     }
     */


    if (phase2 == true &&  posXBoss > (width/2 -(BossAnimNeutre[iAnimNeutreBoss].width/2)) && posXBoss < (width/2 -(BossAnimNeutre[iAnimNeutreBoss].width/2) + 15) ) {
      phase2MouvBoss = true;
      if (initDialogue == 0) {
        dialogueBoss = true;
        initDialogue++;
      }
    }

    if (dialogueBoss == true) {
      pushStyle();
      stroke(255);
      strokeWeight(5);
      fill(0, 0, 0);
      textFont(dialogue);
      rect(posXBoss+200, posYBoss - 50, 300, 100);
      popStyle();
      compteurDialogue++;    // A RESET
      if (compteurDialogue >= 30 && compteurDialogue <= 70 ) {

        pushStyle();
        fill(255, 255, 255);
        textSize(16); 
        text("...", posXBoss+320, posYBoss);
        popStyle();
      }
      if (compteurDialogue >= 71 && compteurDialogue <= 200 ) {

        pushStyle();
        fill(255, 255, 255);
        textAlign(CENTER);
        textSize(16); 
        text("your gonna have", posXBoss+350, posYBoss- 15);
        text("a bad time", posXBoss+350, posYBoss+ 20);
        popStyle();
      }

      if (compteurDialogue == 200 ) {
        dialogueBoss = false;
        dialogueEnding = true;
      }
    }

    if (dialogueRage == true) {
      dialogueCompteur++;
      pushStyle();
      stroke(255);
      strokeWeight(5);
      fill(0, 0, 0);
      textFont(dialogue);
      rect(posXBoss+200, posYBoss - 50, 300, 100);
      popStyle();
      if ( dialogueCompteur < 70) {
        pushStyle();
        fill(255, 255, 255);
        textAlign(CENTER);
        textSize(16); 
        text("Grrrrr !!", posXBoss+350, posYBoss- 15);
        popStyle();
      }

      if ( dialogueCompteur > 70 && dialogueCompteur < 150) {
        pushStyle();
        fill(255, 255, 255);
        textAlign(CENTER);
        textSize(16); 
        text("Je vais en finir!", posXBoss+350, posYBoss- 7);
        popStyle();
      }

      if (dialogueCompteur == 150) {
        dialogueRage = false;
        ValidFinDialogueRage = 1;
      }
    }

    if (dialoguePanne == true) {
      dialoguePanneCompteur++;
      pushStyle();
      stroke(255);
      strokeWeight(5);
      fill(0, 0, 0);
      textFont(dialogue);
      rect(posXBoss+200, posYBoss - 50, 300, 100);
      popStyle();
      if ( dialoguePanneCompteur < 70) {
        pushStyle();
        fill(255, 255, 255);
        textAlign(CENTER);
        textSize(16); 
        text("Noooonn !", posXBoss+350, posYBoss);
        popStyle();
      }

      if ( dialoguePanneCompteur > 70 && dialoguePanneCompteur < 150) {
        pushStyle();
        fill(255, 255, 255);
        textAlign(CENTER);
        textSize(16); 
        text("Les cannons-laser", posXBoss+350, posYBoss- 15);
        text("sont en panne!", posXBoss+350, posYBoss+ 20);
        popStyle();
      }


      if ( dialoguePanneCompteur >150 && dialoguePanneCompteur < 220) {
        pushStyle();
        fill(255, 255, 255);
        textAlign(CENTER);
        textSize(16); 
        text("Petit Chanceux, je", posXBoss+350, posYBoss- 15);
        text("vais te detruire!", posXBoss+350, posYBoss+ 20);
        popStyle();
      }



      if (dialoguePanneCompteur == 220) {
        dialoguePanne = false;
        ValidFinDialogueRage = 1;
      }
    }
  }

  void OnlyAffichage() {

    pushStyle();
    //  fill(255, 0, 0);    
    //    rect(posXBoss, posYBoss, LarBoss, LonBoss);

    if (frameCount%1==0)   iAnimNeutreBoss++;
    if (iAnimNeutreBoss == 29) iAnimNeutreBoss = 0;
    BossAnimNeutre[iAnimNeutreBoss].resize(0, 220);
    pushMatrix();
    translate(-(BossAnimNeutre[iAnimNeutreBoss].width/2) +90, -(BossAnimNeutre[iAnimNeutreBoss].height/2));
    image(BossAnimNeutre[iAnimNeutreBoss], posXBoss, posYBoss);
    popMatrix();
    popStyle();
  }

  void attaqueBoss() {
    // println("LaserBossAnim="+LaserBossAnim+"     LaserBossAnimCompteur="+ LaserBossAnimCompteur);
    // println("LaserBoss="+LaserBoss+"     LaserBossCompteur="+ LaserBossCompteur);
    if (etatBoss==false) {
      if ( attaqueBossReady== true ) {
        LaserBossAnim = true;
        attaqueBossReady = false;
      }


      if (LaserBossAnim== true) {  
        //mettre animation avant tire

        if (LaserBossAnimCompteur < 20) {     //anim se lance jusqu'a la l'image 22 (moment du tir voir image)   

          if (frameCount%2==0)  LaserBossAnimCompteur++;
        }
        pushMatrix();
        BossAnimLaser[LaserBossAnimCompteur].resize(0, 220);
        translate(-(BossAnimLaser[LaserBossAnimCompteur].width/2) +90, -(BossAnimLaser[LaserBossAnimCompteur].height/2));
        image(BossAnimLaser[LaserBossAnimCompteur], posXBoss, posYBoss);
        popMatrix();

        if (LaserBossAnimCompteur == 20) { // si image == 20 
          latenceAvantTirBossCompteur++;
        }
        if (latenceAvantTirBossCompteur == 50) {
          LaserBoss = true;
          // LaserBossAnim= false;
          //     LaserBossAnimCompteur =1 ;
        }
      }

      if (LaserBoss == true) {
        posXLaserBoss1 =posXBoss + LarBoss/2 - LarLaserBoss/2 - 80 ;
        posXLaserBoss2 =posXBoss + LarBoss/2 - LarLaserBoss/2  +70 ;
        posYLaserBoss =  posYBoss+LonBoss;




        if (frameCount%2==0) {
          iLaserBossAnim++;
        }
        if (iLaserBossAnim == 2) iLaserBossAnim = 0;
        pushMatrix();
        //LaserBossAnimPNG[iLaserBossAnim].resize(0, 90);
        translate(-30, 0);
        image(LaserBossAnimPNG[ iLaserBossAnim], posXLaserBoss1, posYLaserBoss);
        image(LaserBossAnimPNG[ iLaserBossAnim], posXLaserBoss2, posYLaserBoss);
        popMatrix();



        //   rect(posXLaserBoss1, posYLaserBoss, LarLaserBoss, height);
        // rect(posXLaserBoss2, posYLaserBoss, LarLaserBoss, height);

        //coli   J1 Boss
        if (vieJ1 > 0) {
          if (
            (((posXLaserBoss1>posXVaisseauJ1) && (posXLaserBoss1<posXVaisseauJ1 + LarVP ) 
            && (posYLaserBoss<posXVaisseauJ1) ) // <-- Useless
            ||
            ( (posXLaserBoss1+LarLaserBoss >posXVaisseauJ1) && (posXLaserBoss1+LarLaserBoss <posXVaisseauJ1 + LarVP )
            &&  (posYLaserBoss + height <posXVaisseauJ1)  ) ) 
            ||

            (((posXLaserBoss2>posXVaisseauJ1) && (posXLaserBoss2<posXVaisseauJ1 + LarVP ) 
            && (posYLaserBoss<posXVaisseauJ1) ) // <-- Useless
            ||
            ( (posXLaserBoss2+LarLaserBoss >posXVaisseauJ1) && (posXLaserBoss2+LarLaserBoss <posXVaisseauJ1 + LarVP )
            &&  (posYLaserBoss + height <posXVaisseauJ1)  ) ) 
            )
          {
            if (frameInvincible == false) {
              vieJ1--;
            }
          }
        }

        if (vieJ2 > 0) {
          if (
            ( ((posXLaserBoss1>posXVaisseauJ2) && (posXLaserBoss1<posXVaisseauJ2 + LarVP ) 
            && (posYLaserBoss<posXVaisseauJ2) ) // <-- Useless
            ||
            ( (posXLaserBoss1+LarLaserBoss >posXVaisseauJ2) && (posXLaserBoss1+LarLaserBoss <posXVaisseauJ2 + LarVP )
            &&  (posYLaserBoss + height <posXVaisseauJ2)  )  )
            ||
            (((posXLaserBoss2>posXVaisseauJ2) && (posXLaserBoss2<posXVaisseauJ2 + LarVP ) 
            && (posYLaserBoss<posXVaisseauJ2) ) // <-- Useless
            ||
            ( (posXLaserBoss2+LarLaserBoss >posXVaisseauJ2) && (posXLaserBoss2+LarLaserBoss <posXVaisseauJ2 + LarVP )
            &&  (posYLaserBoss + height <posXVaisseauJ2)  ) ) 
            )

          {
            if (frameInvincible == false) { // Vaisseau ne prend que des dégats si frameInvicible == false
              vieJ2--;
            }
          }
        }

        LaserBossCompteur++;


        if (LaserBossCompteur == 40 ) {
          LaserBoss = false;
          latenceAvantTirBossCompteur =0;
          LaserBossCompteur =0;
          attaqueBossReady= false;
          LaserBossAnimEnd = true;
          LaserBossAnim = false;
        }
      }
    }

    if (LaserBossAnimEnd == true ) {
      if (frameCount%2==0)  LaserBossAnimCompteur++;

      pushStyle();
      fill(255, 255, 0);    
      //   rect(posXBoss, posYBoss, LarBoss, LonBoss);
      popStyle();
      //mettre animation avant tire

      pushMatrix();
      BossAnimLaser[LaserBossAnimCompteur].resize(0, 220);
      translate(-(BossAnimLaser[LaserBossAnimCompteur].width/2) +90, -(BossAnimLaser[LaserBossAnimCompteur].height/2));
      image(BossAnimLaser[LaserBossAnimCompteur], posXBoss, posYBoss);
      popMatrix();


      if (LaserBossAnimCompteur == 24) {
        //   LaserBossAnim= false;
        LaserBossAnimCompteur =0 ;
        LaserBossAnimEnd = false;
      }
    }
  }



  /*
        if (LaserBossCompteur == 40 ) {
   LaserBoss = false;
   LaserBossCompteur =0;
   attaqueBossReady= false;
   LaserBossAnimEnd = true;
   }
   }
   }
   
   if (LaserBossAnimEnd == true ) {
   if (frameCount%2==0)  LaserBossAnimCompteur++;
   
   if (LaserBossAnimCompteur == 25) {
   LaserBossAnim= false;
   LaserBossAnimCompteur =0 ;
   LaserBossAnimEnd = false;
   }
   }
   }
   */



  void BarreDeVie() {
    pushStyle();
    fill(142, 162, 198);
    //println("lifeBoss="+lifeBoss +"      initLifeBoss"+initLifeBoss  );
    // LonBarreVieBoss = lifeBoss*4;
    rect(width/2 - (LarBarreVieBoss*initLifeBoss)/2, 5, LarBarreVieBoss*initLifeBoss, LonBarreVieBoss);
    popStyle();

    pushStyle();
    fill(255, 0, 0);
    rect(width/2 - (LarBarreVieBoss*initLifeBoss)/2, 5, LarBarreVieBoss*(initLifeBoss -(initLifeBoss - lifeBoss)), LonBarreVieBoss  );


    popStyle();
  }

  void MouvBoss() {


    if (BossDestroy == true ) {
      upMouvCompteur++;
      if (upMouvCompteur == 1) {
        if ( BossDir == false ) {    // boss dir sert a ce que plein de chose
          deltaXBoss = deltaXBoss + difficultyMouvBoss;
        }
        if ( BossDir == true ) {
          deltaXBoss = deltaXBoss - difficultyMouvBoss;
        }
      }
    }

    if (BossDestroy == false) {
      upMouvCompteur =0;
    }

    if (etatBoss==false) {
      /*
      posXBoss  += deltaXBoss ;
       posYBoss += deltaYBoss ;
       if (( posXBoss >width-LarBoss) || (posXBoss <LarBoss)) {
       deltaXBoss= -deltaXBoss;
       */


      /*
      if ( phase2 == true) { // En gros pour faire tourner le boss pour qu'il aille le plus rapidement au millieu pendant la phase 2
       if (compteurmemoPosXBoss == 0) { // a reset  !!! !!! !! !! !! ! !! !! ! !! !! ! 
       memoPosXBoss = posXBoss;
       }
       compteurmemoPosXBoss++;
       if (compteurmemoPosXBoss == 5) {
       
       if (posXBoss > 0 && posXBoss < width/2 ) {
       if (compteurmemoPosXBoss < posXBoss) {
       deltaXBoss=  -deltaXBoss ;
       if ( BossDir == false ) { 
       BossDir = true;
       } else { 
       BossDir = false;
       }
       }
       }
       if (posXBoss > width/2 && posXBoss < width ) {
       if (compteurmemoPosXBoss < posXBoss) {
       deltaXBoss=  -deltaXBoss ;
       if ( BossDir == false ) { 
       BossDir = true;
       } else { 
       BossDir = false;
       }
       }
       }
       }
       }
       */


      if (phase2MouvBoss == false) { // empeche de bouger quand il est au millieu 


        posXBoss  += deltaXBoss ;
        posYBoss += deltaYBoss ;
        if (( posXBoss >width-LarBoss) || (posXBoss <0)) {
          deltaXBoss=  -deltaXBoss ;
          if ( BossDir == false && compteurBossDir == 0) {
            BossDir = true ;
            compteurBossDir++;
          }
          if ( BossDir == true && compteurBossDir ==0) { 
            BossDir = false ;
            compteurBossDir++;
          }
          compteurBossDir=0;
        }
        //   println(deltaXBoss+ "   "+difficultyMouvBoss+"   " + BossDir);
      }
    }
  }
}


class Bouclier {
  int LarBouclier, LonBouclier, posXBouclier, posYBouclier, lifeBouclier, CompteurBouclierScore, BouclierAnimDeathCompteur, initLifeBouclier; 
  int BossAnimDeathCompteur;
  int tempRestorationBouclierCompteur;   
  int iCrystal, iCrystalExplo;
  // int tempRestorationBouclierCompteur;
  // int tempRestorationBouclier= 60* 10;
  boolean etatBouclier, animBouclierOff;
  // vEnemy(int nouvX, int nouvY, int nouvdeltaX, int nouvdeltaY, int nouvLarVen, int nouvLonVen, boolean newEtat, int newLifeEn, int newCompteurEn ) {
  Bouclier(int nouvXBouclier, int nouvYBouclier, int nouvLarBouclier, int nouvLonBouclier, boolean newEtatBouclier, int newLifeBouclier ) {
    posXBouclier = nouvXBouclier;
    posYBouclier = nouvYBouclier;
    LarBouclier= nouvLarBouclier;
    LonBouclier= nouvLonBouclier;
    etatBouclier=newEtatBouclier;
    lifeBouclier= newLifeBouclier;
    initLifeBouclier= newLifeBouclier;
  }

  void init() {
    lifeBouclier = initLifeBouclier;
    etatBouclier=false;
    BouclierAnimDeathCompteur =0;
    nBouclierOff = 0;
    tempRestorationBouclierCompteur=0;
  }

  void afficherBouclier() {

    if (phase2 == false) { //empeche bouclier de prendre dégat pendant la phase 2;
      if (BossDestroy == false) {
        if (etatBouclier == false) {       // empeche de mettre la vie en négatif
          if (vieJ1 >0) {                                                                       //coli missile/boss
            for (int i=0; i<nMissile; i++) {                                                                          
              if (
                ( posLaserXJ1[i] >= posXBouclier) && ( posLaserXJ1[i] <= (posXBouclier + LarBouclier))  &&  
                ( posLaserYJ1[i] >= posYBouclier) && ( posLaserYJ1[i] <= (posYBouclier + LonBouclier)) 
                ) {
                nbLaserJ1[i]= false;
                lbJ1[i]=0;
                posLaserXJ1[i]= -100;  //valeur random juste histoire de pas loop la condition
                posLaserYJ1[i]= -100;

                lifeBouclier--;
              }
            }
            if (LaserSpeJ1  == true) {                                                                              // Colie laserSPé Boss
              if (
                ((posXBouclier>posXLaserSpeJ1) && (posXBouclier<posXLaserSpeJ1+ LarLaserSpe ) 
                && (posYBouclier<posYLaserSpeJ1) )
                ||
                ( (posXBouclier+LarBouclier > posXLaserSpeJ1) && (posXBouclier+LarBouclier <posXLaserSpeJ1+ LarLaserSpe ) )
                //&& (posYVen<posYLaserSpeJ1 - heigh)  //useless + marche pas 
                ) {
                lifeBouclier--;
              }
            }
          }
          if (vieJ2 >0) {

            for (int i=0; i<nMissile-1; i++) {
              if (
                ( posLaserXJ2[i] >= posXBouclier) && ( posLaserXJ2[i] <= (posXBouclier + LarBouclier))  &&  
                ( posLaserYJ2[i] >= posYBouclier) && ( posLaserYJ2[i] <= (posYBouclier + LonBouclier)) 
                ) {
                nbLaserJ2[i]= false;
                lbJ2[i]=0;
                posLaserXJ2[i]= -100;  //valeur random juste histoire de pas loop la condition
                posLaserYJ2[i]= -100;

                lifeBouclier--;
              }
            }
            if (LaserSpeJ2  == true) {                                                                              // Colie laserSPé Bouclier
              if (
                ((posXBouclier>posXLaserSpeJ2) && (posXBouclier<posXLaserSpeJ2+ LarLaserSpe ) 
                && (posYBouclier<posYLaserSpeJ2) )
                ||
                ( (posXBouclier+LarBouclier > posXLaserSpeJ2) && (posXBouclier+LarBouclier <posXLaserSpeJ2+ LarLaserSpe ) )
                ) {
                lifeBouclier--;
              }
            }
          }
        }
      }
    }


    if (lifeBouclier <= 0 ) etatBouclier = true;     // quand Bouclier a plus de vie

    if (etatBouclier==false) {
      // fill(255, 0, 0 );    
      //     rect(posXBouclier, posYBouclier, LarBouclier, LonBouclier);

      iCrystal++;
      if (iCrystal == 49) iCrystal = 0;

      pushMatrix();
      crystal[iCrystal].resize(150, 100);
      translate(-(crystal[iCrystal].width/2)+15, -(crystal[iCrystal].height/2) + 20);
      image(crystal[iCrystal], posXBouclier, posYBouclier);
      popMatrix();
    }


    if (etatBouclier == true) { 
      BouclierAnimDeathCompteur++;
      if (BouclierAnimDeathCompteur < 8) {  // 100 = temps anim a changer
        /* pushStyle();
         fill(0, 255, 0 );    
         rect(posXBouclier, posYBouclier, LarBouclier, LonBouclier);      // METTRE ANIMATION MORT
         popStyle();
         */

        //   println(iCrystalExplo);

        if (iCrystalExplo < 7) iCrystalExplo++;

        pushMatrix();
        crystalExplo[iCrystalExplo].resize(150, 100);
        translate(-(crystalExplo[iCrystalExplo].width/2)+15, -(crystalExplo[iCrystalExplo].height/2) + 20);
        image(crystalExplo[iCrystalExplo], posXBouclier, posYBouclier);
        popMatrix();
      }
      if (BouclierAnimDeathCompteur ==8) {
        nBouclierOff++;
        score+= 300;
      }
      if (BouclierAnimDeathCompteur >5) {
        pushMatrix();
        crystalDeath.resize(150, 100);
        translate((-crystalDeath.width/2)+15, -(crystalDeath.height/2) + 20);
        image(crystalDeath, posXBouclier, posYBouclier);
        popMatrix();
      }
    }


    if (nBouclierOff == 2) {  
      protectionON = false; //pour éviter de reboucler
    }


    if (protectionON == false) {
      tempRestorationBouclierCompteur++;
      if (tempRestorationBouclierCompteur == 600 || phase2 == true ) { // ZBEUL
        lifeBouclier = initLifeBouclier; // +qq chose ou pas nn clairement pas
        etatBouclier = false;
        BouclierAnimDeathCompteur =0;
        nBouclierOff =0;
        tempRestorationBouclierCompteur=0;
        iCrystalExplo =0;

        restaurationBouclierCompteur++;
      }
    }

    if (restaurationBouclierCompteur == 2) {   
      protectionON = true;
      restaurationBouclierCompteur = 0;
    }

    //  println("protectionON="+protectionON+"     animDeathBouclier="+ animDeathBouclier + "  restaurationBouclierCompteur="+restaurationBouclierCompteur+"    tempRestorationBouclierCompteur"+  tempRestorationBouclierCompteur);
    //println("nBouclierOff="+nBouclierOff+"     lifeBouclier="+ lifeBouclier+"   restaurationBouclierCompteur="+restaurationBouclierCompteur);
    if (BossDestroy == true) {
      lifeBouclier = initLifeBouclier;
    }


    if (phase2 == true) {

      pushMatrix();
      crystalShield.resize(100, 100);
      translate(-(crystalShield.width/2)+15, -(crystalShield.height/2) + 20);
      image(crystalShield, posXBouclier, posYBouclier);
      popMatrix();
    }
  }


  void OnlyAffichage() {

    pushMatrix();
    crystal[iCrystal].resize(150, 100);
    translate(-(crystal[iCrystal].width/2)+15, -(crystal[iCrystal].height/2) + 20);
    image(crystal[iCrystal], posXBouclier, posYBouclier);
    popMatrix();
  }



  void BarreDeVie() {
    if ( BouclierAnimDeathCompteur <100) {
      pushStyle();
      fill(142, 162, 198);
      rect(posXBouclier - (LarBarreVieBouclier*initLifeBouclier)/2+ LarBouclier/2, posYBouclier -20, LarBarreVieBouclier*initLifeBouclier, LonBarreVieBouclier);
      popStyle();

      pushStyle();
      fill(255, 0, 0);
      rect(posXBouclier - (LarBarreVieBouclier*initLifeBouclier)/2 + LarBouclier/2, posYBouclier -20, LarBarreVieBouclier*(initLifeBouclier -(initLifeBouclier - lifeBouclier)), LonBarreVieBouclier  );


      popStyle();
    }
  }
}





class Cannon {
  int LarCannon, LonCannon, posXCannon, posYCannon, deltaYCannon=8, CompteurCannon, lifeCannon, CannonAnimCompteur, timerChangeDirH, timerChangeDirB; 
  boolean dirCannonHaut, dirCannonBas, animCannonOff, CannonAnim, CannonOn, initH, initB, cannonShoot  ;
  int direction, joueursFocus, initMouvBaseCannonG, initMouvBaseCannonD;
  boolean actionCannon = true, CannonGRentrer, CannonDRentrer;
  Cannon(int nouvXCannon, int nouvYCannon, int nouvLarCannon, int nouvLonCannon, int nouvDirection, int nouvJoueurs ) {
    posXCannon = nouvXCannon;
    posYCannon = nouvYCannon;
    LarCannon= nouvLarCannon;
    LonCannon= nouvLonCannon;
    direction = nouvDirection;
    joueursFocus  =  nouvJoueurs;
  }


  void Affichage() {

    if (posXCannon <= posXCannonG +1 ) {
      pushMatrix();
      //   cannonNeutre.resize(150, 100);
      //   translate(-(cannonNeutreG.width/2), - (cannonNeutreG.height/2));
      image(cannonOffG, posXCannon, posYCannon);
      popMatrix();

      if (cannonActif == true) {
        pushMatrix();
        //   cannonNeutre.resize(150, 100);
        //   translate(-(cannonNeutreG.width/2), - (cannonNeutreG.height/2));
        image(cannonNeutreG, posXCannon, posYCannon);
        popMatrix();
      }
      if (cannonShoot == true) {
        pushMatrix();
        //   cannonNeutre.resize(150, 100);
        //   translate(-(cannonNeutreG.width/2), - (cannonNeutreG.height/2));
        image(cannonOnG, posXCannon, posYCannon);
        popMatrix();
      }
    }

    if (posXCannon >= posXCannonD ) {
      pushMatrix();
      //   cannonNeutre.resize(150, 100);
      //  translate(-(cannonNeutreD.width/2), - (cannonNeutreD.height/2));
      image(cannonOffD, posXCannon, posYCannon);
      popMatrix();

      if (cannonActif == true) {
        pushMatrix();
        //   cannonNeutre.resize(150, 100);
        //   translate(-(cannonNeutreG.width/2), - (cannonNeutreG.height/2));
        image(cannonNeutreD, posXCannon, posYCannon);
        popMatrix();
      }

      if (cannonShoot == true) {
        pushMatrix();
        //   cannonNeutre.resize(150, 100);
        //   translate(-(cannonNeutreG.width/2), - (cannonNeutreG.height/2));
        image(cannonOnD, posXCannon, posYCannon);
        popMatrix();
      }
    }


    //-------------------------------- DEBUG-----------

    /*
    //  println("cmpteurDia" + compteurDialogue+"   dialogueBoss=" +  dialogueBoss + " initMouvBaseCannonG"+ initMouvBaseCannonG );
     if (posXCannon <= posXCannonG ) {
     println("cmpteurDia" + compteurDialogue+"   dialogueBoss=" +  dialogueBoss + " initMouvBaseCannonG"+ initMouvBaseCannonG + " posXCannon" + posXCannon);
     }
     
     
     if (posXCannon <= posXCannonD ) {
     println("cmpteurDia" + compteurDialogue+"   dialogueBoss=" +  dialogueBoss + " initMouvBaseCannonD"+ initMouvBaseCannonD + " posXCannon" + posXCannon);
     }
     */

    println("cmpteurDia" + compteurDialogue+"   dialogueBoss=" +  dialogueBoss + " dialogueEnding" + dialogueEnding + " CompteurCannon" + CompteurCannon + " dialogueEnding" + dialogueEnding+ " initCompteurCannon" + initCompteurCannon);


    //-------------------------------------------------
    if (initCannon < 30) {
      initMouvBaseCannonD = 0;
      initMouvBaseCannonG = 0;
      CannonDRentrerGlo = 0;
      CannonGRentrerGlo = 0;

      initCannon++;
    }



    if (compteurDialogue >= 80) {


      if (initMouvBaseCannonG == 0 ) {
        if (posXCannon <= posXCannonG ) {
          if ( posXCannon != 0) {
            posXCannon++;
          } else {
            initMouvBaseCannonG = 1;
          }
        }                //sert juste a faire sortir les cannons
      }
      if (initMouvBaseCannonD == 0 ) {
        if (posXCannon >= posXCannonD) {
          if ( posXCannon != posXCannonD) {
            posXCannon--;
          } else {
            initMouvBaseCannonD = 1;
          }
        }
      }
    }


    //if(warp1 == true 2 premier et 2 dernier


    if (dialogueEnding == true) {   // quand il termmine son dialogue

      if (CompteurCannon < 255) {
        CompteurCannon++;
      }


      // println(CannonAnimCompteur +" "+CompteurCannon+" "+CannonAnim );



      if (actionCannon == true) { // true de base

        if (CompteurCannon != 70) {
          if (CompteurCannon >40) {
            cannonActif = true;// pour changer le sprite
          }
        } else {       // commencement du warp a partir de 70
          CannonAnim = true;
        }

        if (CannonAnim == true) {
          CannonAnimCompteur++;



          //----------------------------------------------------------------------------------------------------- warp 1

          if (posYCannon <=  PosYBandeSeparation +50 +( 4*100) ) {  //  5 premier cannon


            if (CannonAnimCompteur > 0 && CannonAnimCompteur < 90 ) {
              CannonOn = false; 
              cannonShoot = false;
              if (posXCannon == posXCannonG ) { // pour evité prévu sur ceux de gauche inutile
                pushStyle();
                fill(255, 0, 0, 80);
                rect(posXCannon + LarCannon, posYCannon + LonCannon/2 - prevuLaserLargeur/2, prevuLaserLongeur, prevuLaserLargeur);
                popStyle();
              }
            }
            if (CannonAnimCompteur > 90 && CannonAnimCompteur < 130 ) {
              CannonOn = true; 
              cannonShoot = true; //sprite

              if (posXCannon <= posXCannonG+1 ) {
                pushMatrix();
                translate(10, 0);
                image( laserCannon1, posXCannon + LarCannon -25, posYCannon -45);
                popMatrix();
              }
            }
            if (CannonAnimCompteur == 130 ) {
              CannonOn = false; 
              cannonShoot = false;
            }
          }
          //----------------------------------------------------------------------------------------------------- warp 2

          if (posYCannon >=  PosYBandeSeparation +50 +( 4*100) ) {  // 5 dernier cannon

            if (CannonAnimCompteur > 130 && CannonAnimCompteur < 220 ) {
              CannonOn = false; 
              cannonShoot = false;
              if (posXCannon == posXCannonG ) { // pour evité prévu sur ceux de gauche inutile
                pushStyle();
                fill(255, 0, 0, 80);
                rect(posXCannon + LarCannon, posYCannon + LonCannon/2 - prevuLaserLargeur/2, prevuLaserLongeur, prevuLaserLargeur);
                popStyle();
              }
            }
            if (CannonAnimCompteur > 220 && CannonAnimCompteur < 260 ) {
              CannonOn = true; 
              cannonShoot = true;

              if (posXCannon <= posXCannonG+1 ) {
                pushMatrix();
                translate(10, 0);
                image( laserCannon1, posXCannon + LarCannon -25, posYCannon -45);
                popMatrix();
              }
            }
            if (CannonAnimCompteur == 260 ) {
              CannonOn = false; 
              cannonShoot = false;
            }
          }
          //----------------------------------------------------------------------------------------------------- warp 3

          if (posYCannon >=  PosYBandeSeparation +50 +( 2*100) && posYCannon <=  PosYBandeSeparation +50 +( 5*100 ) ) { // 5 dernier cannon

            if (CannonAnimCompteur > 260 && CannonAnimCompteur < 330 ) {
              CannonOn = false; 
              cannonShoot = false;
              if (posXCannon == posXCannonG ) { // pour evité prévu sur ceux de gauche inutile
                pushStyle();
                fill(255, 0, 0, 80);
                rect(posXCannon + LarCannon, posYCannon + LonCannon/2 - prevuLaserLargeur/2, prevuLaserLongeur, prevuLaserLargeur);
                popStyle();
              }
            }
            if (CannonAnimCompteur > 330 && CannonAnimCompteur < 370 ) {
              CannonOn = true; 
              cannonShoot = true;

              if (posXCannon <= posXCannonG+1 ) {
                pushMatrix();
                translate(10, 0);
                image( laserCannon1, posXCannon + LarCannon -25, posYCannon -45);
                popMatrix();
              }
            }
            if (CannonAnimCompteur == 370 ) {
              CannonOn = false; 
              cannonShoot = false;
            }
          }
          //----------------------------------------------------------------------------------------------------- warp 4

          if (posYCannon ==  PosYBandeSeparation +50 +( 1*100) || posYCannon ==  PosYBandeSeparation +50 +( 3*100) || 
            posYCannon ==  PosYBandeSeparation +50 +( 5*100) ||  posYCannon ==  PosYBandeSeparation +50 +( 7*100)  ) {  // 4 dernier cannon

            if (CannonAnimCompteur > 370 && CannonAnimCompteur < 440 ) {
              CannonOn = false; 
              cannonShoot = false;
              if (posXCannon == posXCannonG ) { // pour evité prévu sur ceux de gauche inutile
                pushStyle();
                fill(255, 0, 0, 80);
                rect(posXCannon + LarCannon, posYCannon + LonCannon/2 - prevuLaserLargeur/2, prevuLaserLongeur, prevuLaserLargeur);
                popStyle();
              }
            }
            if (CannonAnimCompteur > 440 && CannonAnimCompteur < 480 ) {
              CannonOn = true; 
              cannonShoot = true;

              if (posXCannon <= posXCannonG+1 ) {
                pushMatrix();
                translate(10, 0);
                image( laserCannon1, posXCannon + LarCannon -25, posYCannon -45);
                popMatrix();
              }
            }
            if (CannonAnimCompteur == 480 ) {
              CannonOn = false; 
              cannonShoot = false;
            }
          }
          //----------------------------------------------------------------------------------------------------- warp 4

          if (posYCannon ==  PosYBandeSeparation +50 +( 0*100) || posYCannon ==  PosYBandeSeparation +50 +( 2*100) || 
            posYCannon ==  PosYBandeSeparation +50 +( 4*100) ||  posYCannon ==  PosYBandeSeparation +50 +( 6*100)  ) {  // 4 dernier cannon

            if (CannonAnimCompteur > 480 && CannonAnimCompteur < 550 ) {
              CannonOn = false; 
              cannonShoot = false;
              if (posXCannon == posXCannonG ) { // pour evité prévu sur ceux de gauche inutile
                pushStyle();
                fill(255, 0, 0, 80);
                rect(posXCannon + LarCannon, posYCannon + LonCannon/2 - prevuLaserLargeur/2, prevuLaserLongeur, prevuLaserLargeur);
                popStyle();
              }
            }
            if (CannonAnimCompteur > 550 && CannonAnimCompteur < 590 ) {
              CannonOn = true; 
              cannonShoot = true;

              if (posXCannon <= posXCannonG+1 ) {
                pushMatrix();
                translate(10, 0);
                image( laserCannon1, posXCannon + LarCannon -25, posYCannon -45);
                popMatrix();
              }
            }

            if (CannonAnimCompteur == 590 ) {
              CannonOn = false; 
              cannonShoot = false;
            }
          }




          // --------------------------------------- Colision


          if (CannonOn == true) {
            if (vieJ1 > 0) {
              if (
                (((posYCannon<posYVaisseauJ1) && (posYCannon+ LarCannon>posYVaisseauJ1 + LonVP ) 
                ))
                ||
                ( ((posYCannon+LarCannon >posYVaisseauJ1) && ((posYCannon+LarCannon <posYVaisseauJ1 + LonVP )
                )) )
                ||

                ( ((posYCannon>posYVaisseauJ1) && (posYCannon<posYVaisseauJ1 + LonVP ) )
                )
                )
              {
                if (frameInvincible == false) {
                  vieJ1--;
                }
              }
            }

            if (vieJ2 > 0) {
              if (
                (((posYCannon<posYVaisseauJ2) && (posYCannon+ LarCannon>posYVaisseauJ2 + LonVP ) 
                ))
                ||
                ( ((posYCannon+LarCannon>posYVaisseauJ2) && ((posYCannon+LarCannon <posYVaisseauJ2 + LonVP )
                )) )
                ||
                ( ((posYCannon>posYVaisseauJ2) && (posYCannon<posYVaisseauJ2 + LonVP ) )
                )
                )
              {
                if (frameInvincible == false) { // Vaisseau ne prend que des dégats si frameInvicible == false
                  vieJ2--;
                }
              }
            }
          }





          //-------------------------------------------------------------------------------------------------------------------------------------------------------------- Ending

          if (CannonAnimCompteur == 620) {
            dialogueRage = true;
            //  println("pop");
          }


          if (CannonAnimCompteur > 620 && CannonAnimCompteur < 830 ) {
            CannonOn = false; 
            if (posXCannon == posXCannonG ) { // pour evité prévu sur ceux de gauche inutile
              pushStyle();
              fill(255, 0, 0, 80);
              rect(posXCannon + LarCannon, posYCannon + LonCannon/2 - prevuLaserLargeur/2, prevuLaserLongeur, prevuLaserLargeur);
              popStyle();
            }
          }




          if (CannonAnimCompteur > 830  && CannonAnimCompteur < 837 ) {
            cannonActif = false;
          }

          if (CannonAnimCompteur > 837 && CannonAnimCompteur < 850 ) {
            CannonOn = false; 
            if (posXCannon == posXCannonG ) { // pour evité prévu sur ceux de gauche inutile
              pushStyle();
              fill(255, 0, 0, 80);
              rect(posXCannon + LarCannon, posYCannon + LonCannon/2 - prevuLaserLargeur/2, prevuLaserLongeur, prevuLaserLargeur);
              popStyle();
            }
          }

          if (CannonAnimCompteur > 850 && CannonAnimCompteur < 863 ) {
            cannonActif = false;
          }

          if (CannonAnimCompteur > 863 && CannonAnimCompteur < 870) {
            CannonOn = false; 
            if (posXCannon == posXCannonG ) { // pour evité prévu sur ceux de gauche inutile
              pushStyle();
              fill(255, 0, 0, 80);
              rect(posXCannon + LarCannon, posYCannon + LonCannon/2 - prevuLaserLargeur/2, prevuLaserLongeur, prevuLaserLargeur);
              popStyle();
            }
          }

          if (CannonAnimCompteur > 870 ) {
            cannonActif = false;

            iCannonSmok++;

            if (iCannonSmok == 23) iCannonSmok = 0;

            pushMatrix();
            CannonSmok[iCannonSmok].resize(150, 150);


            if (posXCannon == posXCannonG ) { // pour evité prévu sur ceux de gauche inutile
              translate(-(CannonSmok[iCannonSmok].width/2)+15, -(CannonSmok[iCannonSmok].height/2) -15);
            }
            if (posXCannon == posXCannonD ) { // pour evité prévu sur ceux de gauche inutile
              translate(-(CannonSmok[iCannonSmok].width/2)+25, -(CannonSmok[iCannonSmok].height/2) -15);
            }
            image(CannonSmok[iCannonSmok], posXCannon, posYCannon);
            popMatrix();
          }

          if (CannonAnimCompteur > 870  && CannonAnimCompteur < 900  ) {
            ieclair++;
            if ( ieclair == 5)  ieclair = 0;
            pushMatrix();
            eclair[ieclair].resize(150, 100);
            translate(-(eclair[ieclair].width/2)+15, -(eclair[ieclair].height/2) );
            image(eclair[ieclair], posXCannon, posYCannon);
            popMatrix();
          }




          if (CannonAnimCompteur == 850 ) {
            dialoguePanne = true;
          }



          if (CannonAnimCompteur == 1000 ) {
            CannonOn = false;

            CannonAnim = false;
            CannonAnimCompteur =0;
            actionCannon = false;
          }




          //posXVaisseauJ1  + LarVP/2   - LarBarreLaser/2
        }
      }

      //------------------------------------------------------------------------

      if (actionCannon == false) {
        if (posXCannon <= posXCannonG +10) {
          if ( posXCannon != - LarCannon) {
            posXCannon--;
          } else { 
            CannonGRentrer = true;
          }
        }                                        //sert juste a faire sortir les cannons



        if (posXCannon >= posXCannonD -10 ) {
          if ( posXCannon != width + LarCannon) {
            posXCannon++;
          } else { 
            CannonDRentrer = true;
          }
        }
      }
      if ( CannonDRentrer == true) {
        CannonDRentrerGlo =1;
      }
      if ( CannonGRentrer == true) {
        CannonGRentrerGlo =1;
      }

      // println("phase2"+phase2);
      //    println( "G: "+CannonGRentrer);
      //  println( "D: "+CannonDRentrer);

      // println("Ac"+actionCannon);
      if (actionCannon == false && CannonDRentrerGlo == 1 && CannonGRentrerGlo == 1) {

        println("pop");

        phase2 = false;

        initDialogue = 0;
        dialogueBoss = false;
        compteurDialogue = 0;
        dialogueEnding = false;
        phase2MouvBoss = false;
        CannonAnim = false;

        dialogueRage = false;
        dialogueCompteur= 0;
        dialoguePanne = false;
        dialoguePanneCompteur = 0;

        actionCannon =true;
        CompteurCannon =0;

        initMouvBaseCannonG = 0;
        initMouvBaseCannonD = 0;

        CannonDRentrerGlo =0;
        CannonGRentrerGlo =0;
        CannonAnimCompteur =0;

        initCompteurCannon = 0;

        initCannon =0;


        if (posXCannon <= posXCannonG +10) {
          posXCannon =  -LarCannon;
        }
        if (posXCannon >= posXCannonD -10 ) {
          posXCannonD = width;
        }

        println("end");
      }
    }
  }
}
