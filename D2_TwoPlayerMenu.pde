 void TwoPlayersMenu() {
   pushStyle();
   if (initTwoPlayerMenu== 0) {
    valid = false;
    initTwoPlayerMenu++;
  }
  
  pushStyle();
 // background(0);
   image(  backgroundMenuPlayer, -200, 0);  
  textAlign(CENTER);
  textFont(font);
  fill(255, 255, 0);


  text("Versus", width/2, height/3);
  text("Co-op", width/2, height/3 + height/4);






  if (Y1 == 1 ||Y2 == 1 ) {             // bouger sur haut
    ChooseTwo = true;
  }
  if (Y1 == -1 ||Y2 == -1) {              //bouger sur bas
    ChooseTwo = false;
  }
  if (ChooseTwo == true)
    text(">", width/4, height/3);
  if (ChooseTwo == false) {
    text(">", width/4, height/3 + height/4);
  }

  Y1 = 0;
  Y2 = 0;


  //-------------------------------------------------------------


  if (ChooseTwo == true && valid == true) {                    //si YES + bouton  // Bouton On ne marche pas trouver astuce 
    VersusJeux = true; 
    twoPlayerMenu = false;
    clear();
  }

  if (ChooseTwo == false &&  valid == true) {                 // Si no + bouton OU 10sc écoulé + mettre autre bouton
    jeuxArcade = true;
    twoPlayerMenu = false;
    clear();
  }




  popStyle();
  popStyle();
}
