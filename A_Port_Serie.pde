//------------- Fonction de gestion des évènements série ----------------//


void serialEvent (Serial myPort) {  // fonction appelée lors de la survenue d'un évènement série

  // ******** Gestion de la valeur reçue sur le port série : **********

  String inString = myPort.readStringUntil('\n'); // chaine stockant la chaîne reçue sur le port Série
  // saut de ligne en marque de fin


  if (inString != null) { // si la chaine recue n'est pas vid


    inString = trim(inString); // enlève espace blancs de la chaine recue

    //println("Chaine reçue="+inString); // debug
    String[] inSubstring = split(inString, ':'); // extrait

    // println(inSubstring.length); // debug

    if (inSubstring.length == 10) {


      b1p1 = int(inSubstring[0]);
      b2p1= int(inSubstring[1]);
      b1p2= int(inSubstring[2]);
      b2p2= int(inSubstring[3]);
      P =int(inSubstring[4]);
      ON=int(inSubstring[5]);
      
      H1= int(inSubstring[6]);
      B1=int(inSubstring[7]);
      G1= int(inSubstring[8]);
      D1=int(inSubstring[9]);
     // H2= int(inSubstring[10]);
     // B2=int(inSubstring[11]);
     // G2= int(inSubstring[12]);
     // D2=int(inSubstring[13]);

      //X2=int(inSubstring[6]);
      // Y2=int(inSubstring[7]);
      
    }
  }
}
