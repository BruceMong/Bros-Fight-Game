void menuChoosePlayer() {





  if (initChoosePlayer== 0) {
    valid = false;
    initChoosePlayer++;
    choose = true;
    choixVP1_1 = 0;
    choixVP1_2 = 0;
    choixVP2 = 0;
    Nplayers=0;
    pieceJ2 = false;


    vaisseau1 = loadImage("vaisseau1.png");  //pour eviter le flou dégeu
    vaisseau2 = loadImage("vaisseau2.png");
    vaisseau3 = loadImage("vaisseau3.png");
    vaisseau4 = loadImage("vaisseau4.png");
  }





  pushStyle();
 // background(0);
   image(  backgroundMenuPlayer, -200, 0);  
  
  
  textAlign(CENTER);
  textFont(font);
  fill(255, 255, 0);

  text("1 PLAYER", width/4, height/4);
  text("2 PLAYER", width/2 + width/4, height/4);

  if (X1 == 1 || X2 == 1) {                       // bouger sur NO
    choose = true;
  }

  if (pieceJ2 == true) {   //empeche de selectioner joueurs 2 si piece = false
    if (X1 == -1 || X2 == -1) {              //bouger sur yes
      choose = false;
    }
  }

  if (choose == true) {            // joueur 1
    //  text("-------", width/4, height/3);
    image(trianglejauneHaut, width/4, height/3 - 65, 50, 30 );
  }
  if (choose == false) {
    // text("-------", width/2 + width/4, height/3);
    image(trianglejauneHaut, width/2 + width/4, height/3 - 65, 50, 30 );
  }
  popStyle();

  X1 = 0;
  X2 = 0;


  if (choose == true && validHautP1 == true) {   // choose  = true => coté gauche  (et inverse) 
    choixVP1_1++;
  }
  if (choose == true && validBasP1== true) {
    choixVP1_1--;
  }
  //----------------------------------
  if (choose == false && validHautP1 == true) {
    choixVP1_2++;
  }
  if (choose == false && validBasP1== true) {
    choixVP1_2--;
  }
  if (choose == false && validHautP2 == true) {
    choixVP2++;
  }
  if (choose == false && validBasP2 == true) {
    choixVP2--;
  }





  // translate(-(12), -5 );


  vaisseau1.resize(150, 150);
  vaisseau2.resize(150, 150);
  vaisseau3.resize(150, 150);


  if ( choixVP1_1 == 0) {
    pushStyle();
    fill(255, 255, 255);
   // ellipse(width/4, height/2, 150, 150);

    pushMatrix();
    translate(-(vaisseau1.width/2), -(vaisseau1.height/2));

    image(vaisseau1, width/4, height/2); 
    popMatrix();
    popStyle();
  }
  if ( choixVP1_2 == 0) {
    pushStyle();
    fill(255, 255, 255);
  //  ellipse(width/2+width/5, height/2, 150, 150);
    pushMatrix();
    translate(-(vaisseau1.width/2), -(vaisseau1.height/2));
    image(vaisseau1, width/2+width/5, height/2); 
    popMatrix();
    popStyle();
  }
  if ( choixVP2 == 0) {
    pushStyle();
    fill(255, 255, 255);
    //ellipse(width/2+width/3, height/2, 150, 150);
    pushMatrix();
    translate(-(vaisseau1.width/2), -(vaisseau1.height/2));
    image(vaisseau1, width/2+width/3, height/2); 
    popMatrix();
    popStyle();
  }

  //-------------------
  if ( choixVP1_1 == 1) {
    pushStyle();
    fill(0, 255, 0);
    //ellipse(width/4, height/2, 150, 150);
    pushMatrix();
    translate(-(vaisseau2.width/2), -(vaisseau2.height/2));
    image(vaisseau2, width/4, height/2); 
    popMatrix();
    popStyle();
  }
  if ( choixVP1_2 == 1) {
    pushStyle();
    fill(0, 255, 0);
    //ellipse(width/2+width/5, height/2, 150, 150);

    pushMatrix();
    translate(-(vaisseau2.width/2), -(vaisseau2.height/2));
    image(vaisseau2, width/2+width/5, height/2); 
    popMatrix();
    popStyle();
  }
  if ( choixVP2 == 1) {
    pushStyle();
    fill(0, 255, 0);
    //ellipse(width/2+width/3, height/2, 150, 150);
    pushMatrix();
    translate(-(vaisseau2.width/2), -(vaisseau2.height/2));
    image(vaisseau2, width/2+width/3, height/2); 
    popMatrix();
    popStyle();
  }
  //--------------------
  if ( choixVP1_1 == 2) {
    pushStyle();
    fill(255, 0, 0);
    //ellipse(width/4, height/2, 150, 150);
    pushMatrix();
    translate(-(vaisseau2.width/2), -(vaisseau2.height/2));
    image(vaisseau3, width/4, height/2); 
    popMatrix();
    popStyle();
  }
  if ( choixVP1_2 == 2) {
    pushStyle();
    fill(255, 0, 0);
    //ellipse(width/2+width/5, height/2, 150, 150);
    pushMatrix();
    translate(-(vaisseau2.width/2), -(vaisseau2.height/2));
    image(vaisseau3, width/2+width/5, height/2); 
    popMatrix();
    popStyle();
  }
  if ( choixVP2 == 2) {
    pushStyle();
    fill(255, 0, 0);
    //ellipse(width/2+width/3, height/2, 150, 150);
    pushMatrix();
    translate(-(vaisseau2.width/2), -(vaisseau2.height/2));
    image(vaisseau3, width/2+width/3, height/2); 
    popMatrix();
    popStyle();
  }




  //--------------------

  if (choixVP1_1 >= 3) choixVP1_1 =0;
  if (choixVP1_2 >= 3) choixVP1_2 =0;
  if (choixVP2 >= 3) choixVP2 =0;

  if (choixVP1_1 < 0) choixVP1_1 =2;
  if (choixVP1_2 < 0) choixVP1_2 =2;
  if (choixVP2 < 0) choixVP2 =2;


  Y1=0;
  Y2=0;






  if (choose == true && valid == true) {                    //si YES + bouton  // Bouton On ne marche pas trouver astuce 
    Nplayers = 1;
    choosePlayer = false;
  }


  if (choose == false &&  valid == true) {                 // Si no + bouton OU 10sc écoulé + mettre autre bouton
    Nplayers = 2;
    choosePlayer = false;
  }

  //------------------------------------------------

  if (choosePlayer == false &&  Nplayers == 1) {
    clear();
    jeuxArcade = true;
  }

  if (choosePlayer == false &&  Nplayers == 2) {
    clear();
    twoPlayerMenu = true;
  }



  //----------------------

  if (piece == true) {
    pieceJ2 = true;
  }

  if (pieceJ2 == false) {
    pushStyle();
    fill(0, 0, 0, 90);
    rect(width/2, 0, width/2, height);  // layout qui fonce le menu j2
    textAlign(CENTER);
    textFont(font);
    fill(255, 255, 0);

    if (frameCount%(50) == 0 ) {           
      if (clignotement == true) {
        clignotement = false;
      } else  if (clignotement == false) {
        clignotement = true;
      }
    }
    if (clignotement == true) {
      text("INSERER PIECE", width/2+ width/4, height/2);
    }

    popStyle();
  }
}

void direction() {
  validHautP1 = false;


  if ( (Y1 == 1) ) {
    validationHautP1 = true;
  } else {
    validationHautP1 =false;
    compteurValidHautP1 = 0;
  }

  if (validationHautP1 == true) {
    if (compteurValidHautP1 == 0) {
      validHautP1 = true;
    }
    compteurValidHautP1++;
  }

  //---------------------------- 

  validHautP2 = false;


  if ( (Y2 == 1) ) {
    validationHautP2 = true;
  } else {
    validationHautP2 =false;
    compteurValidHautP2 = 0;
  }

  if (validationHautP2 == true) {
    if (compteurValidHautP2 == 0) {
      validHautP2 = true;
    }
    compteurValidHautP2++;
  }

  //------------------------------
  validBasP1 = false;


  if ( (Y1 == -1) ) {
    validationBasP1 = true;
  } else {
    validationBasP1 =false;
    compteurValidBasP1 = 0;
  }

  if (validationBasP1 == true) {
    if (compteurValidBasP1 == 0) {
      validBasP1 = true;
    }
    compteurValidBasP1++;
  }
  //-----------------------------
  validBasP2 = false;


  if ( (Y2 == -1) ) {
    validationBasP2 = true;
  } else {
    validationBasP2 =false;
    compteurValidBasP2 = 0;
  }

  if (validationBasP2 == true) {
    if (compteurValidBasP2 == 0) {
      validBasP2 = true;
    }
    compteurValidBasP2++;
  }
}

void directionGD() {  //utiliser dans le menu High Score 
  validDroiteP1 = false;


  if ( (X1 == -1) ) {
    validationDroiteP1 = true;
  } else {
    validationDroiteP1 =false;
    compteurValidDroiteP1 = 0;
  }

  if (validationDroiteP1 == true) {
    if (compteurValidDroiteP1 == 0) {
      validDroiteP1 = true;
    }
    compteurValidDroiteP1++;
  }

  //---------------------------- 

  validDroiteP2 = false;


  if ( (X2 == -1) ) {
    validationDroiteP2 = true;
  } else {
    validationDroiteP2 =false;
    compteurValidDroiteP2 = 0;
  }

  if (validationDroiteP2 == true) {
    if (compteurValidDroiteP2 == 0) {
      validDroiteP2 = true;
    }
    compteurValidDroiteP2++;
  }

  //------------------------------
  validGaucheP1 = false;


  if ( (X1 == 1) ) {
    validationGaucheP1 = true;
  } else {
    validationGaucheP1 =false;
    compteurValidGaucheP1 = 0;
  }

  if (validationGaucheP1 == true) {
    if (compteurValidGaucheP1 == 0) {
      validGaucheP1 = true;
    }
    compteurValidGaucheP1++;
  }
  //-----------------------------
  validGaucheP2 = false;


  if ( (X2 == 1) ) {
    validationGaucheP2 = true;
  } else {
    validationGaucheP2 =false;
    compteurValidGaucheP2 = 0;
  }

  if (validationGaucheP2== true) {
    if (compteurValidGaucheP2 == 0) {
      validGaucheP2 = true;
    }
    compteurValidGaucheP2++;
  }
}

void validation() {


  valid = false;

  //  if ( (ON == 1) || (b1p1 == 0) || (b2p1 == 0) || (b1p2 == 0) || (b2p2 == 0) ) {

  if ( (ON == 0) ) {
    validation = true;
  } else {
    validation =false;
    compteurValid = 0;
  }

  if (validation == true) {
    if (compteurValid == 0) {
      valid = true;
    }
    compteurValid++;
  }
}
