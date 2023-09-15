void startMenu() {
  pushStyle();
  //background(0);

 image(ecranTitre[iEcranTitre], 0, 0);
  if (frameCount%8==0) {
    iEcranTitre++;
  }
  if (iEcranTitre == 25) iEcranTitre = 0;

  textAlign(CENTER);
  textFont(font);
  fill(255, 255, 0);

  if (frameCount%(90) == 0 ) {           
    if (clignotement == true) {
      clignotement = false;
    } else  if (clignotement == false) {
      clignotement = true;
    }
  }
  if (clignotement == true) {
    text("PRESS START", width/2, height/2);
  }
  popStyle();
}

// Press Start clignotement OSEF
