void boutonsPlayers() {

  bouton1P1= false;
  if (b1p1 ==1) {
    compteurBouton1P1=0;
    interBouton1P1= false;
  }
  if (b1p1 == 0) {
    interBouton1P1= true;
  }

  if (interBouton1P1 == true) {           ///////// FLEME DE LE FAIRE LE VOID N"est pas utiliser g mis le code direct dans le E1A
    if (compteurBouton1P1 == 0) {                 
      bouton1P1= true;
    }
    compteurBouton1P1++;
  }
  // ------------------------------------- 
  bouton2P1= false;
  if (b2p1 ==1) {
    compteurBouton2P1=0;
    interBouton2P1= false;
  }
  if (b2p1 == 0) {
    interBouton2P1= true;
  }

  if (interBouton2P1 == true) {           ///////// FLEME DE LE FAIRE LE VOID N"est pas utiliser g mis le code direct dans le E1A
    if (compteurBouton2P1 == 0) {                 
      bouton2P1= true;
    }
    compteurBouton2P1++;
  }
  // ------------------------------------- 
  bouton1P2= false;
  if (b1p2 ==1) {
    compteurBouton1P2=0;
    interBouton1P2= false;
  }
  if (b1p2 == 0) {
    interBouton1P2= true;
  }

  if (interBouton1P2 == true) {           ///////// FLEME DE LE FAIRE LE VOID N"est pas utiliser g mis le code direct dans le E1A
    if (compteurBouton1P2 == 0) {                 
      bouton1P2= true;
    }
    compteurBouton1P2++;
  }
  // ------------------------------------- 
  bouton2P2= false;
  if (b2p2 ==1) {
    compteurBouton2P2=0;
    interBouton2P2= false;
  }
  if (b2p2 == 0) {
    interBouton2P2= true;
  }

  if (interBouton2P2 == true) {           ///////// FLEME DE LE FAIRE LE VOID N"est pas utiliser g mis le code direct dans le E1A
    if (compteurBouton2P2 == 0) {                 
      bouton2P2= true;
    }
    compteurBouton2P2++;
  }
}

void clavier() {
  /*
  if (keyPressed) {
   switch(key) {
   case 'p':
   P=850;
   break;
   case 'o':
   ON=0;
   break;
   case 'm':
   b1p2=0;
   }
   } else {
   P = 1;
   ON = 1;
   b1p2=1;
   }
   
   */
  if (mousePressed) {
    b1p1=0;
  } else { 
    b1p1 =1;
  } 

  /*
  println( "text b1p1: "+ b1p1 );
   println( "text l: "+ Rotate );
   println( "text nombreLaser: "+  nombreLaserJ1 );
   println( "text nbLaser[nombreLaser]: "+  nbLaserJ1[nombreLaserJ1] );
   println( "text lb[nombreLaser] "+ lbJ1[nombreLaserJ1]);
   */

  //ON= 1;
  //P=0;

  if (gaucheJ1)   X1= 1;
  if (droiteJ1)  X1=  -1;                 //SOURCE D'ERREUR PEUT ETRE INVERSER GAUCHE DROITE 
  if (basJ1)     Y1= -1;
  if (hautJ1)    Y1=1;

  if (gaucheJ2 ) X2=1;
  if (droiteJ2)  X2= -1;
  if (basJ2)     Y2= -1;
  if (hautJ2)    Y2=1;

  if (poids) {
    P=850;
  } else {
    P=0;
  }
  if (O) { 
    ON=0;
  } else { 
    ON=1;
  }
  if (M) { 
    b1p1=0;
  } else { 
    b1p1=1;
  }
  if (L) { 
    b2p1=0;
  } else { 
    b2p1=1;
  }

  if (N) { 
    b2p2=0;
  } else { 
    b2p2=1;
  }

  if (toucheSpace) { 
    b1p2=0;
  } else { 
    b1p2=1;
  }
}





//println("ON:" + P); 

//b1p1, b2p1, b1p2, b2p2, P, X1,      Y1 X2 Y2 ON






void keyPressed() {
  setMove(keyCode, true);
  setMove(key, true);
}

void keyReleased() {
  setMove(keyCode, false);
  setMove(key, false);
}

boolean setMove(int k, boolean b) {
  switch (k) {
  case 'z':
    return hautJ2 = b;
  case 's':
    return basJ2 = b;

  case 'q':
    return gaucheJ2 = b;

  case 'd':
    return droiteJ2 = b;


  case UP:
    return hautJ1 = b;

  case DOWN:
    return basJ1 = b;

  case LEFT:
    return gaucheJ1 = b;

  case RIGHT:
    return droiteJ1 = b;

  case 'p':
    return poids = b;

  case 'o':
    return O = b;

  case 'm':
    return M = b;

  case ' ' :
    return toucheSpace = b;

  case 'n' :
    return N = b;

  case 'l' :
    return L = b;

  default:
    return b;
  }
}
