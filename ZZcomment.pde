/*

Penser a changer valeur analogique en TOR des capteurs joystick
Penser a rajouter dans Port série 2eme joystick donc faire les modifs en conséquence
Rajouter des boutons ou pas pour le void validation



REGLER BUG 5 laser !! 

Peut etre faire payer pour j 2 

RAJOUTER TRAINER MOUVEMENT 
Creation 2 eme bouton
idée : barre bleu en dessous vaisseau attaque spécial instant laser  FAIT

barre de vie boss En cours

Si nEnemyOff == 15 genre vagues= 2
et si vagues = 2 genre plus de mob(bloc) et +rapide
sinon dash ? 

Quand boss battue : Jeux plus rappide
En + rapide, mouv boss plus rapide + défilement background + rapide
mob qui suive joueur
hight score menu si gameover
quand boss mid life go faire un truc genre rocket qui suivent ou quoi


bug quand  projectile sont dans
versus et l'autre truc faut rajouter un void laserJ1Versus
bug ending 2eme fois cheum

bug laser tenter de mettre R=0  FAIT



barre de dash

Afficher barre de vie  bouclier que si boss est vivant  FAIT
background qui s'arrete quand boss meurt  FAIT
menu 2 joueurs dispo uniquement quand piece mise FAIT

PEUT ETRE AVOIR A INVERSER GAUCHE DROITE DANS LE CLAVIER CE QUI IMPLIQUE ARCADEGAME ET VOID DIRECTIONGD

BUG anim mort partager entre les deux joeurs

mettre couche rouge quand boss touché 


Bug lors de la 2eme partie menu F_end 


rajouter un init(); pour les cannons

phase 2, boss arrette de bouger a la moitié de l'écran 
mobs arette de repop 
bouclier générateur + barriere qui repop 
truc sur le coté qui suive et laser  vaisseau

rajouter bouclier invulnérabilité 



    if (X1 == -1 && posXVaisseau>0 ) {   
      posXVaisseau = posXVaisseau - vitesseVaisseau;
    }
    if (X1 == 1 && posXVaisseau <(width - LarVP) ) {   
      posXVaisseau = posXVaisseau + vitesseVaisseau;
    }
    if (X1 == 0) {   
      posXVaisseau = posXVaisseau + 0;
    }

    if (Y1 == 1  && posYVaisseau <(height - LonVP)) {   
      posYVaisseau = posYVaisseau + vitesseVaisseau;
    }
    if (Y1 == -1 && posYVaisseau>0 ) {   
      posYVaisseau = posYVaisseau - vitesseVaisseau;
    }
    if (Y1 == 0) {   
      posYVaisseau = posYVaisseau +0;
    }




--------------------------
    }
/*

      if (nbLaserJ1[0] == true) {
        LaserJ1(0);
      }
      if (nbLaserJ1[1] == true) {
        LaserJ1(1);
      }
      if (nbLaserJ1[2] == true) {
        LaserJ1(2);
      }
      if (nbLaserJ1[3] == true) {
        LaserJ1(3);
      }
      if (nbLaserJ1[4] == true) {
        LaserJ1(4);
      }
      if (nbLaserJ1[5] == true) {
        LaserJ1(5);
      }
*/
/*
-----------------------------

if (Laser1== true) {
    if (l == 0) {
      LaserX= posXVaisseau + LarVP/2;
      LaserY= posYVaisseau;
    }
    l++;
    LaserY=LaserY - 10;
    if (LaserY < -100) {
      Laser1= false; 
      l=0;
    }

    rect(LaserX, LaserY, 3, 10);
  }

  if ( nombreLaser == 20) {
    nombreLaser=0;
  }
*/



    // if (nombreLaser == 20) {
    // nombreLaser =0;


    /*

     if (nbLaser[6]== true) {
     if (l == 0) {
     LaserX= posXVaisseau + LarVP/2;
     LaserY= posYVaisseau;
     }
     l++;
     LaserY=LaserY - 10;
     if (LaserY < -100) {
     Laser1= false; 
     l=0;
     }
     
     rect(LaserX, LaserY, 3, 10);
     }
     
     if ( nombreLaser == 5) {
     nombreLaser=0;
     }
     
     */

    /*
    if (b1p1 == 0) {
     Boutonlaser= true;
     }
     
     
     if (Boutonlaser == true) {
     nombreLaser++;
     nbLaser[nombreLaser]= true;
     Boutonlaser= false;
     }
     
     Rotate++;
     if (nbLaser[ Rotate]== true) {
     if (lb[ Rotate] == 0) {
     posLaserX[ Rotate]= posXVaisseau + LarVP/2;
     posLaserY[ Rotate]= posYVaisseau;
     }
     lb[ Rotate]++;
     posLaserY[ Rotate]= posLaserY[ Rotate] - 10;
     if ( posLaserY[ Rotate] < -100) {
     nbLaser[ Rotate]= false; 
     lb[ Rotate]=0;
     }
     rect(posLaserX[ Rotate], posLaserY[ Rotate], 3, 10);
     }
     
     
     if ( Rotate == 15) {
     Rotate=0;
     }
     */
    /*
//---------------------------------------------------------------
     if (Boutonlaser == true) {
     nombreLaser++;
     nbLaser[nombreLaser]= true;
     Boutonlaser= false;
     }
     
     for ( nombreLaser=0; nombreLaser<20; nombreLaser++) {
     if (nbLaser[nombreLaser]== true) {
     if (lb[nombreLaser] == 0) {
     posLaserX[nombreLaser]= posXVaisseau + LarVP/2;
     posLaserY[nombreLaser]= posYVaisseau;
     }
     lb[nombreLaser]++;
     posLaserY[nombreLaser]= posLaserY[nombreLaser] - 10;
     if ( posLaserY[nombreLaser] < -100) {
     nbLaser[nombreLaser]= false; 
     lb[nombreLaser]=0;
     }
     rect(posLaserX[nombreLaser], posLaserY[nombreLaser], 3, 10);
     }
     }
     
     // if (nombreLaser == 20) {
     // nombreLaser =0;
     //}
     
     
     //---------------------------------------------------------------
     */


    /*    if (Boutonlaser == true) {
     ly++;
     lx++;
     TableLaserY[ly]= 1;
     TableLaserY[lx]= posXVaisseau;
     Boutonlaser = false;
     b1p1 = 0;
     }
     for(int i=0; i<20; i++){
     if(TableLaserY[i] <0 ){
     TableLaserY[i] =  TableLaserY[i] +5;
     i=0;
     }
     }
     */


    //NbLaser++;




    /*
   for(int i=0; i=20; i++){
     if(TableLaserY[i]>0){
     }
     */

    //  TableLaserY[NbLaser]=sdsdsd;
    
    
    
    
    
    
/*

 void LaserJ1() {
 
 if (nbLaser[0]== true) {
 if (lb[R] == 0) {
 posLaserX[R]= posXVaisseauJ1 + LarVP/2;
 posLaserY[R]= posYVaisseauJ1;
 }
 lb[R]++;
 posLaserY[R]=posLaserY[R] - 10;
 if (posLaserY[R] < -100) {
 nbLaser[R]= false; 
 lb[R]=0;
 }
 
 rect(posLaserX[R], posLaserY[R], larLaser, lonLaser);
 }
 
 
 
 
 
 if (nbLaser[1]== true) {
 if (lb[1] == 0) {
 posLaserX[1]= posXVaisseauJ1 + LarVP/2;
 posLaserY[1]= posYVaisseauJ1;
 }
 lb[1]++;
 posLaserY[1]=posLaserY[1] - 10;
 if (posLaserY[1] < -100) {
 nbLaser[1]= false; 
 lb[1]=0;
 }
 
 rect(posLaserX[1], posLaserY[1], 3, 10);
 }
 
/*
 if (nbLaser[]== true) {
 if (lb[] == 0) {
 posLaserX[]= posXVaisseauJ1 + LarVP/2;
 posLaserY[]= posYVaisseauJ1;
 }
 lb[]++;
 posLaserY[]=posLaserY[] - 10;
 if (posLaserY[] < -100) {
 nbLaser[]= false; 
 lb[]=0;
 }
 
 rect(posLaserX[], posLaserY[], 3, 10);
 }
 /
 }
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
     /*
     if (tempRestorationBouclierCompteur >= 600) { 
     
     
     
     
     
    /*
     
     if (etatBouclier==true) {
     if ( animDeathBouclier == true) {  //true de base en gros si vaisseau détruit faire animation puis afficher 
     BouclierAnimDeathCompteur++;
     pushStyle();
     fill(0, 255, 0 );    
     rect(posXBouclier, posYBouclier, LarBouclier, LonBouclier);      // METTRE ANIMATION MORT
     popStyle();
     if (BouclierAnimDeathCompteur ==100) {
     nBouclierOff++;
     score+= 300;
     animDeathBouclier = false;   // arete l'animation
     }
     }
     if ( animDeathBouclier == false) {
     pushStyle();
     fill(0, 0, 255 );    
     rect(posXBouclier, posYBouclier, LarBouclier, LonBouclier);      // METTRE ANIMATION MORT
     popStyle();
     }
     }
     println("protectionON="+protectionON+"     animDeathBouclier="+ animDeathBouclier + "  restaurationBouclierCompteur="+restaurationBouclierCompteur+"    tempRestorationBouclierCompteur"+  tempRestorationBouclierCompteur);
     println("nBouclierOff="+nBouclierOff+"     lifeBouclier="+ lifeBouclier+"   restaurationBouclierCompteur="+restaurationBouclierCompteur);
     
     
     
     
     
     if (nBouclierOff == 2) {  
     protectionON = false; //pour éviter de reboucler
     } else {
     //  protectionON = true;        // apparament c ça qui fait buger
     }
     
     if (protectionON == false) {
     tempRestorationBouclierCompteur++;
    /*
     if (tempRestorationBouclierCompteur >= 600) {   // prob vien surement de la 
     nBouclierOff = 0;
     animDeathBouclier = true;
     BouclierAnimDeathCompteur =0;
     lifeBouclier = 20;
     etatBouclier=false;
     BouclierAnimDeathCompteur =0;
     tempRestorationBouclierCompteur=0;
     restaurationBouclierCompteur++;  // <-- Quand =2 (2bouclier) restaure protectionON = true
     //  protectionON = false;  // -- ça bug a cause de ça un seul bouclier peut s'enlever
     }
     
     
     }
     
     
     
     
     if (restaurationBouclierCompteur >= 200) {
     restaurationBouclierCompteur =0;
     protectionON =true;
     }
     
     
     -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
     
     
     
     
     
     
     
     
     
     
     
     
     
     
     
     
           // saveStrings("highScore.txt", lines);
      // lines[2] = TagP2;
      //  text("there are " + lines.length + " lines", 20, 500);

      //Sscore = score;

    //  if (initMenuScore == 0) {
        /*
      for (int i = 0; i < lines.length; i++)
         {
         //String[] mots = split(lines[i], " ");
         mots = split(lines[i], " ");
         initMenuScore++;
         }
         
         
         
 for (int i = 0; i {< lines.length; i++)
    mots = append(line[i],



        mots0 = split(lines[0], " ");
        mots1 = split(lines[1], " ");
        mots2 = split(lines[2], " ");
        mots3 = split(lines[3], " ");
        mots4 = split(lines[4], " ");
        mots5 = split(lines[5], " ");
        mots6 = split(lines[6], " ");
        mots7 = split(lines[7], " ");
        mots8 = split(lines[8], " ");
        mots9 = split(lines[9], " ");
        initMenuScore++;
      }




//if(parseInt(scoreList[0])>score)


      println(mots0[0]);
      println(mots0[1]);
      println(mots1[1]);

     /*
for (int i=0; i<lines.length; i++) {
       if (lines>=lines[i]) {
       for (int j=lines.length-1; j>=max(i,1); j--) {
       lines[j] = lines[j-1];
       }
       lines[i] = score;
       break;
       }
       }
       */

      //    lines = sort(lines);


      //   lines[lines.length +1 ] = TagP2;



     
     
     
     
     
     
     
 
 
