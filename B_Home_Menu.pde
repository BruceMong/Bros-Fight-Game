void homeMenu() {

  pushStyle();

  image(ecranTitre[iEcranTitre], 0, 0);
  if (frameCount%6==0) {
    iEcranTitre++;
  }
  if (iEcranTitre == 25) iEcranTitre = 0;

  textAlign(CENTER);
  textFont(font);
  fill(255, 255, 0);
  font = createFont("ARCADE_N.TTF", 32);


  if (frameCount%(50) == 0 ) {           
    if (clignotement == true) {
      clignotement = false;
    } else  if (clignotement == false) {
      clignotement = true;
    }
  }
  if (clignotement == true) {
    text("inserer piece ", width/2, height/2);
  }
  popStyle();
}


// Clignotement inserer piece OSEF
