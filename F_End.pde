
void END() {
  if (menuGameOver == true) {
    if (initMenuGameOver == 0) {


      continuer = true;
      compteur = true;
      decompte =10;
      pieceEnding = false;
      menuBougerYes = false;
      affichageYes = true;
      gameover = false;
      delaiGameover =0;
      initMenuGameOver=1;
      MenuHighScore = false;
    }





    clear();
    pushStyle();
    textAlign(CENTER);
    textFont( fontEnd );
    fill(255, 255, 0);
    text("CONTINUE ?", width/2, height/4);




    text("INSERT COIN", width/2, height/2);

    if (affichageYes == true) {
      text("YES", width/4, (height/2)+height/7);
    }
    text("NO", width/2+width/4, (height/2)+height/7);             // Affichage du texte "CONTINUE ? INSERT COIN YES NO


    if (continuer == true) {                                     // If continuer = true positionnement sur le Yes sinon sur le NO
      text(">", (width/4)-width/10, (height/2)+height/7);
    } else {
      text(">", (width/2)+width/6, (height/2)+height/7);
    }


    if (compteur == true) {         //compteur

      // noLoop();
      //frameCount=0;
      //  loop();

      text(decompte, width/2, height/3);
      if (frameCount%60==0) {   // %60     //changer délai
        // background(0);
        decompte=decompte-1;


        if (decompte == -1) {
          compteur = false;
        }
      }
    }


    if (X1 ==1 || X2 == 1) {                       // bouger sur NO
      continuer = true;
    }
    if (X1 ==-1 || X2 == -1) {              //bouger sur yes
      continuer = false;
    }

    X1 = 0;
    X2 = 0;


    if (continuer == true && valid == true && pieceEnding == false  ) {  //si YES + bouton + piecefausse
      menuBougerYes = true;
    }

    if (menuBougerYes == true) {
      affichageYes = false;

      fill(255, 0, 0);
      text("YES", width/4 + translateYes, ( (height/2)+height/7) )   ;

      if (translateYesB == true) {
        translateYes++;
      }
      if (translateYesB == false) {
        translateYes--;
      }
      if (translateYes == 5) {
        translateYesB =false;
      }
      if (translateYes == -5) {
        translateYesB =true;
        yesCompteur++;
      }
      if (yesCompteur == 5) {
        affichageYes = true;
        menuBougerYes = false;
        yesCompteur = 0;
      }
    }
    popStyle();
    if (continuer == true && valid == true && pieceEnding == true  ) {  //si YES + bouton + pieceOk
      vieJ1 = initLifeArcade;
      vieJ2 = initLifeArcade;
      antiExploP1=0;
      antiExploP2=0;
      explo = false;
      initExplo = 0;
      iExplo =0;
      jeuxArcade = true;
      plusDeVie =false;  
      initMenuGameOver=0;

      timerRetry=true;
    }

    if ((continuer == false && valid == true) || compteur== false  ) { // Si no + bouton OU 10sc écoulé
      //  gameover = true;   useless rajoute menu high score
      MenuHighScore = true;
      menuGameOver=false;
    }
  }



  if (P >= 800 && P<= 850) {      //piece bonne
    pieceEnding = true;
  }



  //---------------------------------------------------------------------------------------------------
  if (MenuHighScore == true) {
    HighScore();
  }



  //---------------------------------------------------------------------------------------------------


  if (gameover == true ) {


    pushStyle();
    background(0);    
    fill(255, 255, 25);
    textAlign(CENTER);
    //  font = createFont("ARCADE_N.TTF", 60);
    textFont( fontEnd );
    text("GAME OVER ", width/2, height/2);   
    popStyle();
    if (frameCount%60==0) {   // %60     //changer délai
      delaiGameover++;
    }


    if (delaiGameover == 5) {  //image reste 5sc
      delaiGameover=0;           //
      background(0);



      reboot();
    }
  }
}














void reboot() {

  piece = false;
  jeux = false;
  home = true;
  choosePlayer = true;
  initChoosePlayer =0;
  jeuxArcade = false;
  twoPlayerMenu = false;
  initTwoPlayerMenu= 0;
  ChooseTwo = false;
  VersusJeux = false;
  initialisationVersus = 0;
  menuGameOver = true;      //----------> imp a vérififé A METTRE TRUE
  
  initMenuGameOver =0;
  initialisationArcade = 0;
  initVagues = 0;
  finDeVague = true;
  plusDeVie =false;
  initHighscore=0;
  
}
