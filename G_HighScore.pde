void HighScore() {
  /*
  https://forum.processing.org/two/discussion/19719/saving-a-highscore
   https://discourse.processing.org/categories
   
   https://processing.org/reference/String_length_.html
   https://processing.org/reference/String_indexOf_.html
   https://processing.org/reference/String_toLowerCase_.html
   
   https://processing.org/reference/sort_.html
   
   https://processing.org/reference/saveStrings_.html
   https://processing.org/reference/join_.html
   https://processing.org/reference/split_.html
   
   https://processing.org/reference/splitTokens_.html
   
   http://isn.lec.ac-grenoble.fr/processing/co/algorithme_tri_4.html
   
   http://pratiques-algorithmiques.net/mes-tutoriels/processing-2-strings/
   
   */




  if (initHighscore == 0 ) {
    MenuChooseTag=true;
    TagP1Select = false;
    TagP2Select = false;
    chooseLetterP1 =0;
    chooseLetterP2 =0;

    if ( Nplayers == 1) {
      lines = loadStrings("highScoreP1.txt");
      linesTAG = loadStrings("tagP1.txt");
    }
    if ( Nplayers == 2) {
      lines = loadStrings("highScoreP2.txt");
      linesTAG = loadStrings("tagP2.txt");
    }


    for (int i=0; i<6; i++) {
      selectCara[i] =0;
    }


    clignoTagLancement = false;
    initMenuScore = 0;

    clignoTagLancement = false;
    initHighscore = 1;
  }

  background(0);







  if ( Nplayers == 1) {
    if (MenuChooseTag==true) {  //true de base


      pushStyle();
      textAlign(CENTER);
      textFont( fontVersusEnd );
      fill(255, 255, 0);

      text("Entrer votre nom", width/2+40, height/8);
      fill(255, 0, 0);

      textSize( 32);
      text("Joueurs 1", width/2, height/3 - 30);
      popStyle();
      //println(chooseLetterP1, validHautP1, validDroiteP1, chooseLetterP2);

      pushStyle();
      imageMode(CENTER);


      if ( TagP1Select == false) {
        for (int i=0; i<3; i++) {
          if ( chooseLetterP1 == i ) {
            image(trianglejauneBas, width/2+(i*ecartXCaraHighScore)  -100, height/2 + 130, 30, 25 );
            image(trianglejauneHaut, width/2+(i*ecartXCaraHighScore) -100, height/2 -150, 30, 25 );
          }
        }
      }


      popStyle();
      if ( TagP1Select == false) {

        if (chooseLetterP1 <2) {
          if ( bouton1P1 == true ||  bouton2P1 == true ) {
            chooseLetterP1++;
          }
        }

        if (validDroiteP1 == true) {
          chooseLetterP1++;
        }


        if (validGaucheP1 == true) {
          chooseLetterP1--;
        }
      }

      if (chooseLetterP1 < 0) {
        chooseLetterP1=2;
      }
      if (chooseLetterP1 > 2) {
        chooseLetterP1=0;
      }


      if ( TagP1Select == false) {
        for (int i=0; i<3; i++) { 
          if (chooseLetterP1 == i) {
            if (validHautP1 == true) {
              selectCara[i]--;
            }
            if (validBasP1 == true) {
              selectCara[i]++;
            }
          }
        }
      }

      Y1=0; //tres imp pour fontctionnement validHaut/bas
      X1=0;


      for (int i=0; i<6; i++) { 
        if (selectCara[i] <0 ) {
          selectCara[i] =35;
        }
        if (selectCara[i] >35 ) {
          selectCara[i] =0;
        }
      }



      for (int i=0; i<6; i++) { 
        switch(selectCara[i]) {
        case 0:
          CaraB[i] = "9";
          Cara[i] = "A";
          CaraA[i] = "B";
          break;
        case 1:
          CaraB[i] = "A";
          Cara[i] = "B";
          CaraA[i] = "C";
          break;
        case 2: 
          CaraB[i] = "B";
          Cara[i] = "C";
          CaraA[i] = "D";
          break;
        case 3:
          CaraB[i] = "C";
          Cara[i] = "D";
          CaraA[i] = "E";
          break;
        case 4: 
          CaraB[i] = "D";
          Cara[i] = "E";
          CaraA[i] = "F";
          break;
        case 5:
          CaraB[i] = "E";
          Cara[i] = "F";
          CaraA[i] = "G";
          break;
        case 6: 
          CaraB[i] = "F";
          Cara[i] = "G";
          CaraA[i] = "H";
          break;
        case 7:
          CaraB[i] = "G";
          Cara[i] = "H";
          CaraA[i] = "I";
          break;
        case 8: 
          CaraB[i] = "H";
          Cara[i] = "I";
          CaraA[i] = "J";
          break;
        case 9:
          CaraB[i] = "I";
          Cara[i] = "J";
          CaraA[i] = "K";
          break;
        case 11: 
          CaraB[i] = "J";
          Cara[i] = "K";
          CaraA[i] = "L";
          break;
        case 12:
          CaraB[i] = "K";
          Cara[i] = "L";
          CaraA[i] = "M";
          break;
        case 13:
          CaraB[i] = "L";
          Cara[i] = "M";
          CaraA[i] = "N";
          break;
        case 14:
          CaraB[i] = "M";
          Cara[i] = "N";
          CaraA[i] = "O";
          break;
        case 15:
          CaraB[i] = "N";
          Cara[i] = "O";
          CaraA[i] = "P";
          break;
        case 16:
          CaraB[i] = "O";
          Cara[i] = "P";
          CaraA[i] = "Q";
          break;
        case 17:
          CaraB[i] = "P";
          Cara[i] = "Q";
          CaraA[i] = "R";
          break;
        case 18:
          CaraB[i] = "Q";
          Cara[i] = "R";
          CaraA[i] = "S";
          break;
        case 19:
          CaraB[i] = "R";
          Cara[i] = "S";
          CaraA[i] = "T";
          break;
        case 20:
          CaraB[i] = "S";
          Cara[i] = "T";
          CaraA[i] = "U";
          break;
        case 21:
          CaraB[i] = "T";
          Cara[i] = "U";
          CaraA[i] = "V";
          break;
        case 22:
          CaraB[i] = "U";
          Cara[i] = "V";
          CaraA[i] = "W";
          break;
        case 23:
          CaraB[i] = "V";
          Cara[i] = "W";
          CaraA[i] = "X";
          break;
        case 24:
          CaraB[i] = "W";
          Cara[i] = "X";
          CaraA[i] = "Y";
          break;
        case 25:
          CaraB[i] = "X";
          Cara[i] = "Y";
          CaraA[i] = "Z";
          break;
        case 26:
          CaraB[i] = "Y";
          Cara[i] = "Z";
          CaraA[i] = "1";
          break;
        case 27:
          CaraB[i] = "Z";
          Cara[i] = "1";
          CaraA[i] = "2";
          break;
        case 28:
          CaraB[i] = "1";
          Cara[i] = "2";
          CaraA[i] = "3";
          break;
        case 29:
          CaraB[i] = "2";
          Cara[i] = "3";
          CaraA[i] = "4";
          break;
        case 30:
          CaraB[i] = "3";
          Cara[i] = "4";
          CaraA[i] = "5";
          break;
        case 31:
          CaraB[i] = "4";
          Cara[i] = "5";
          CaraA[i] = "6";
          break;
        case 32:
          CaraB[i] = "5";
          Cara[i] = "6";
          CaraA[i] = "7";
          break;
        case 33:
          CaraB[i] = "6";
          Cara[i] = "7";
          CaraA[i] = "8";
          break;
        case 34:
          CaraB[i] = "7";
          Cara[i] = "8";
          CaraA[i] = "9";
          break;
        case 35:
          CaraB[i] = "8";
          Cara[i] = "9";
          CaraA[i] = "A";
          break;
        }
      }

      pushStyle();
      textAlign(CENTER);
      textFont( fontHigscore );
      fill(255, 255, 0);

      for (int i=0; i<3; i++) { 
        text(CaraB[i], width/2+(i*ecartXCaraHighScore) -100, height/2-ecartYCaraHighScore);
        text(Cara[i], width/2+(i*ecartXCaraHighScore) -100, height/2);
        text(CaraA[i], width/2+(i*ecartXCaraHighScore) -100, height/2+ecartYCaraHighScore);
      }


      //floutage A et B 
      fill(0, 0, 0, 90);
      rect(  0, height/2 -ecartYCaraHighScore, width, - ecartYCaraHighScore);
      rect(  0, height/2, width, ecartYCaraHighScore);

      popStyle();


      // println(bouton1P2, bouton2P2, chooseLetterP2); 




      if (( bouton1P1 == true )  &&  chooseLetterP1 == 2 ) {
        TagP1Select = true;
        TagP1 = Cara[0] + Cara[1] + Cara[2];
      }

      if (   TagP1Select == true ) {
        MenuChooseTag = false; //true de base
        MenuScore = true;
      }

      pushStyle();
      textFont( fontGros );

      if ( TagP1Select == true) {
        fill(0, 0, 0, 80);
        rect(0, height/2 -ecartYCaraHighScore, width/2, ecartYCaraHighScore*2);
        fill(255, 0, 0);
        text("Select", width/5 -30, height/2 );
      }




      popStyle();
    }


    if (MenuScore == true ) {

      pushStyle();
      textAlign(CENTER);
      textFont( fontVersusEnd );
      fill(255, 255, 0);

      text("Top 10 meilleurs Joueurs", width/2, height/8);
      text("Score: "+score, width/2, height/8+50);
      popStyle();
      //save et load a diff endroit



      for (int j=0; j<lines.length-1; j++ ) { //permet de trier

        valeurLines1 =  parseInt(lines[j] );
        valeurLines2 =  parseInt(lines[j+1] );


        if (valeurLines1 < valeurLines2) {            
          memo = lines[j];
          lines[j] = lines[j+1];
          lines[j+1] = memo;

          memoRank = linesTAG[j];
          linesTAG[j] =linesTAG[j+1];
          linesTAG[j+1] = memoRank;
        }
      }


      if (initMenuScore == 0) {  //a rajouter initMenuScore++;


        //----------------------------------------------------------SCORE----------------------------------------------



        if (lines.length<10) { // si il reste de la place dans le score juste rajouter ligne en bas (puis trier par le truc du haut)
          //lines=append(lines, str(score)+" "+TagP1 +" "+ TagP2);

          lines=append(lines, str(score));
          linesTAG=append(linesTAG, TagP1 +" "+TagP2 );

          initMenuScore++;
        } else {
          //disocier nom score semble le plus simple

          for (int j=0; j<lines.length; j++ ) {
            if ( score >  parseInt(lines[j]) && initMenuScore == 0 ) {            
              lines[lines.length -1 ] = str(score);
              linesTAG[linesTAG.length -1 ] = TagP1;


              initMenuScore = 1;
            }
          }
        }
      }
      //----------------------------------------------------------TAG----------------------------------------------


      // ----------------------------------------------AFFICHAGE-------------------------------------------------------
      for (int i = 0; i < lines.length; i++)
      {
        pushStyle();
        textAlign(CENTER);
        textFont(fontEnd);
        text( i+1, posXRank, 400 + 35*i);

        textAlign(RIGHT);
        textFont(fontEnd);
        text( lines[i], posXScore, 400 + 35*i);

        popStyle();
      }


      for (int i = 0; i < lines.length; i++)
      {
        pushStyle();       
        textAlign(RIGHT);
        textFont(fontEnd);
        text( linesTAG[i], posXTag, 400 + 35*i);
        if (iniTagCligno == 0) {

          if (linesTAG[i].equals(TagP1)) {
            tagActuel = i;
            clignoTagLancement = true;

            //  iniTagCligno++;
          }
        }






        popStyle();
      }


      //---- Partie Cligno
      if (clignoTagLancement == true) { //vrai seulement si ds le top10
        if (frameCount%(40) == 0 ) {
          if (tagCligno == true) {
            tagCligno = false;
          } else  if (tagCligno == false) {
            tagCligno = true;
          }
        }
        if (tagCligno == true) {
          pushStyle();
          fill(255, 0, 0);
          textAlign(RIGHT);
          text(linesTAG[tagActuel], posXTag, 400 + 35*tagActuel);
          text( score, posXScore, 400 + 35*tagActuel);
          text( tagActuel+1, posXRank + 15, 400 + 35*tagActuel);

          //text( i+1, posXRank, 400 + 35*i);

          popStyle();

          // text( "TAG", posXTag, 300);
        }
      }
      //---- Fin cligno






      pushStyle();
      textAlign(RIGHT);
      textFont(fontGros);
      fill(223, 109, 20);
      text( "RANK", posXRank, 300);
      text( "SCORE", posXScore, 300);
      text( "TAG", posXTag, 300);


      popStyle();

      if (frameCount%(600*30)==0 || valid == true ) { // a modif
        MenuScore = false; 
        gameover = true;
        saveStrings("D:\\Projet_Final_Mars\\Projet_Final_Mars_pde\\data\\highScoreP1.txt", lines);
        saveStrings("D:\\Projet_Final_Mars\\Projet_Final_Mars_pde\\data\\tagP1.txt", linesTAG);

      }
    }
  }












  if ( Nplayers == 2) {
    if (MenuChooseTag==true) {  //true de base

      pushStyle();
      textAlign(CENTER);
      textFont( fontVersusEnd );
      fill(255, 255, 0);

      text("Entrer vos nom", width/2+40, height/8);
      fill(255, 0, 0);

      textSize( 32);
      text("Joueurs 1", width/4, height/3 - 30);
      text("Joueurs 2", width/2 + width/4, height/3 - 30);
      popStyle();
      //println(chooseLetterP1, validHautP1, validDroiteP1, chooseLetterP2);

      pushStyle();
      imageMode(CENTER);


      if ( TagP1Select == false) {
        for (int i=0; i<3; i++) {
          if ( chooseLetterP1 == i ) {
            image(trianglejauneBas, width/5+(i*ecartXCaraHighScore), height/2 + 130, 30, 25 );
            image(trianglejauneHaut, width/5+(i*ecartXCaraHighScore), height/2 -150, 30, 25 );
          }
        }
      }

      if ( TagP2Select == false) {
        for (int i=0; i<3; i++) {
          if ( chooseLetterP2 == i ) {  
            image(trianglejauneBas, width/2 + width/5+(i*ecartXCaraHighScore), height/2 + 130, 30, 25 );
            image(trianglejauneHaut, width/2+width/5+(i*ecartXCaraHighScore), height/2 -150, 30, 25 );
          }
        }
      }

      popStyle();
      if ( TagP1Select == false) {

        if (chooseLetterP1 <2) {
          if ( bouton1P1 == true ||  bouton2P1 == true ) {
            chooseLetterP1++;
          }
        }

        if (validDroiteP1 == true) {
          chooseLetterP1++;
        }


        if (validGaucheP1 == true) {
          chooseLetterP1--;
        }
      }
      if ( TagP2Select == false) {
        if (chooseLetterP2 <2) {
          if ( bouton1P2 == true ||  bouton2P2 == true ) {
            chooseLetterP2++;
          }
        }

        if (validDroiteP2 == true) {
          chooseLetterP2++;
        }
        if (validGaucheP2 == true) {
          chooseLetterP2--;
        }
      }

      if (chooseLetterP1 < 0) {
        chooseLetterP1=2;
      }
      if (chooseLetterP1 > 2) {
        chooseLetterP1=0;
      }

      if (chooseLetterP2 < 0) {
        chooseLetterP2=2;
      }
      if (chooseLetterP2 > 2) {
        chooseLetterP2=0;
      }

      if ( TagP1Select == false) {
        for (int i=0; i<3; i++) { 
          if (chooseLetterP1 == i) {
            if (validHautP1 == true) {
              selectCara[i]--;
            }
            if (validBasP1 == true) {
              selectCara[i]++;
            }
          }
        }
      }
      if ( TagP2Select == false) {
        for (int i=3; i<6; i++) { 
          if (chooseLetterP2 == (i-3)) {
            if (validHautP2 == true) {
              selectCara[i]--;
            }
            if (validBasP2 == true) {
              selectCara[i]++;
            }
          }
        }
      }

      Y1=0; //tres imp pour fontctionnement validHaut/bas
      Y2=0;
      X1=0;
      X2=0;

      for (int i=0; i<6; i++) { 
        if (selectCara[i] <0 ) {
          selectCara[i] =35;
        }
        if (selectCara[i] >35 ) {
          selectCara[i] =0;
        }
      }



      for (int i=0; i<6; i++) { 
        switch(selectCara[i]) {
        case 0:
          CaraB[i] = "9";
          Cara[i] = "A";
          CaraA[i] = "B";
          break;
        case 1:
          CaraB[i] = "A";
          Cara[i] = "B";
          CaraA[i] = "C";
          break;
        case 2: 
          CaraB[i] = "B";
          Cara[i] = "C";
          CaraA[i] = "D";
          break;
        case 3:
          CaraB[i] = "C";
          Cara[i] = "D";
          CaraA[i] = "E";
          break;
        case 4: 
          CaraB[i] = "D";
          Cara[i] = "E";
          CaraA[i] = "F";
          break;
        case 5:
          CaraB[i] = "E";
          Cara[i] = "F";
          CaraA[i] = "G";
          break;
        case 6: 
          CaraB[i] = "F";
          Cara[i] = "G";
          CaraA[i] = "H";
          break;
        case 7:
          CaraB[i] = "G";
          Cara[i] = "H";
          CaraA[i] = "I";
          break;
        case 8: 
          CaraB[i] = "H";
          Cara[i] = "I";
          CaraA[i] = "J";
          break;
        case 9:
          CaraB[i] = "I";
          Cara[i] = "J";
          CaraA[i] = "K";
          break;
        case 11: 
          CaraB[i] = "J";
          Cara[i] = "K";
          CaraA[i] = "L";
          break;
        case 12:
          CaraB[i] = "K";
          Cara[i] = "L";
          CaraA[i] = "M";
          break;
        case 13:
          CaraB[i] = "L";
          Cara[i] = "M";
          CaraA[i] = "N";
          break;
        case 14:
          CaraB[i] = "M";
          Cara[i] = "N";
          CaraA[i] = "O";
          break;
        case 15:
          CaraB[i] = "N";
          Cara[i] = "O";
          CaraA[i] = "P";
          break;
        case 16:
          CaraB[i] = "O";
          Cara[i] = "P";
          CaraA[i] = "Q";
          break;
        case 17:
          CaraB[i] = "P";
          Cara[i] = "Q";
          CaraA[i] = "R";
          break;
        case 18:
          CaraB[i] = "Q";
          Cara[i] = "R";
          CaraA[i] = "S";
          break;
        case 19:
          CaraB[i] = "R";
          Cara[i] = "S";
          CaraA[i] = "T";
          break;
        case 20:
          CaraB[i] = "S";
          Cara[i] = "T";
          CaraA[i] = "U";
          break;
        case 21:
          CaraB[i] = "T";
          Cara[i] = "U";
          CaraA[i] = "V";
          break;
        case 22:
          CaraB[i] = "U";
          Cara[i] = "V";
          CaraA[i] = "W";
          break;
        case 23:
          CaraB[i] = "V";
          Cara[i] = "W";
          CaraA[i] = "X";
          break;
        case 24:
          CaraB[i] = "W";
          Cara[i] = "X";
          CaraA[i] = "Y";
          break;
        case 25:
          CaraB[i] = "X";
          Cara[i] = "Y";
          CaraA[i] = "Z";
          break;
        case 26:
          CaraB[i] = "Y";
          Cara[i] = "Z";
          CaraA[i] = "1";
          break;
        case 27:
          CaraB[i] = "Z";
          Cara[i] = "1";
          CaraA[i] = "2";
          break;
        case 28:
          CaraB[i] = "1";
          Cara[i] = "2";
          CaraA[i] = "3";
          break;
        case 29:
          CaraB[i] = "2";
          Cara[i] = "3";
          CaraA[i] = "4";
          break;
        case 30:
          CaraB[i] = "3";
          Cara[i] = "4";
          CaraA[i] = "5";
          break;
        case 31:
          CaraB[i] = "4";
          Cara[i] = "5";
          CaraA[i] = "6";
          break;
        case 32:
          CaraB[i] = "5";
          Cara[i] = "6";
          CaraA[i] = "7";
          break;
        case 33:
          CaraB[i] = "6";
          Cara[i] = "7";
          CaraA[i] = "8";
          break;
        case 34:
          CaraB[i] = "7";
          Cara[i] = "8";
          CaraA[i] = "9";
          break;
        case 35:
          CaraB[i] = "8";
          Cara[i] = "9";
          CaraA[i] = "A";
          break;
        }
      }

      pushStyle();
      textAlign(CENTER);
      textFont( fontHigscore );
      fill(255, 255, 0);

      for (int i=0; i<3; i++) { 
        text(CaraB[i], width/5+(i*ecartXCaraHighScore), height/2-ecartYCaraHighScore);
        text(Cara[i], width/5+(i*ecartXCaraHighScore), height/2);
        text(CaraA[i], width/5+(i*ecartXCaraHighScore), height/2+ecartYCaraHighScore);
      }

      for (int i=0; i<3; i++) { 
        text(CaraB[i+3], width/2+  width/5+(i*ecartXCaraHighScore), height/2-ecartYCaraHighScore);
        text(Cara[i+3], width/2+ width/5+(i*ecartXCaraHighScore), height/2);
        text(CaraA[i+3], width/2+ width/5+(i*ecartXCaraHighScore), height/2+ecartYCaraHighScore);
      }

      //floutage A et B 
      fill(0, 0, 0, 90);
      rect(  0, height/2 -ecartYCaraHighScore, width, - ecartYCaraHighScore);
      rect(  0, height/2, width, ecartYCaraHighScore);

      popStyle();


      // println(bouton1P2, bouton2P2, chooseLetterP2); 




      if (( bouton1P1 == true ||  bouton2P1 == true )  &&  chooseLetterP1 == 2 ) {
        TagP1Select = true;
        TagP1 = Cara[0] + Cara[1] + Cara[2];
      }

      if ( (  bouton1P2 == true || bouton2P2 == true )  &&  chooseLetterP2 == 2 ) {
        TagP2Select = true;
        TagP2 =  Cara[3] + Cara[4] + Cara[5];
      }


      if (   TagP1Select == true && TagP2Select == true) {
        MenuChooseTag = false; //true de base
        MenuScore = true;
      }

      pushStyle();
      textFont( fontGros );

      if ( TagP1Select == true) {
        fill(0, 0, 0, 80);
        rect(0, height/2 -ecartYCaraHighScore, width/2, ecartYCaraHighScore*2);
        fill(255, 0, 0);
        text("Select", width/5 -30, height/2 );
      }

      if ( TagP2Select == true) {
        fill(0, 0, 0, 80);
        rect(width/2, height/2 -ecartYCaraHighScore, width/2, ecartYCaraHighScore*2);
        fill(255, 0, 0);
        text("Select", width - width/5 -150, height/2 );
      }


      popStyle();
    }


    if (MenuScore == true ) {

      pushStyle();
      textAlign(CENTER);
      textFont( fontVersusEnd );
      fill(255, 255, 0);

      text("Top 10 meilleurs Joueurs", width/2, height/8);
      text("Score: "+score, width/2, height/8+50);
      popStyle();
      //save et load a diff endroit



      for (int j=0; j<lines.length-1; j++ ) { //permet de trier

        valeurLines1 =  parseInt(lines[j] );
        valeurLines2 =  parseInt(lines[j+1] );

        /*
      println("lines[j] ="+ lines[j]);
         println("lines[j+1] ="+ lines[j+1]);
         println("v1 ="+ valeurLines1);
         println("v2 ="+ valeurLines2);
         */

        if (valeurLines1 < valeurLines2) {            
          memo = lines[j];
          lines[j] = lines[j+1];
          lines[j+1] = memo;

          memoRank = linesTAG[j];
          linesTAG[j] =linesTAG[j+1];
          linesTAG[j+1] = memoRank;
        }
      }


      if (initMenuScore == 0) {  //a rajouter initMenuScore++;

        // for (int i = 0; i < linesTAG.length; i++)


        //}



        //----------------------------------------------------------SCORE----------------------------------------------



        if (lines.length<10) { // si il reste de la place dans le score juste rajouter ligne en bas (puis trier par le truc du haut)
          //lines=append(lines, str(score)+" "+TagP1 +" "+ TagP2);

          lines=append(lines, str(score));
          linesTAG=append(linesTAG, TagP1 +" "+TagP2 );

          initMenuScore++;
        } else {
          //disocier nom score semble le plus simple

          for (int j=0; j<lines.length; j++ ) {
            if ( score >  parseInt(lines[j]) && initMenuScore == 0 ) {            
              lines[lines.length -1 ] = str(score);
              linesTAG[linesTAG.length -1 ] = TagP1 +" "+TagP2;


              initMenuScore = 1;
            }
          }
        }
      }
      //----------------------------------------------------------TAG----------------------------------------------


      // ----------------------------------------------AFFICHAGE-------------------------------------------------------
      for (int i = 0; i < lines.length; i++)
      {
        pushStyle();
        textAlign(CENTER);
        textFont(fontEnd);
        text( i+1, posXRank, 400 + 35*i);

        textAlign(RIGHT);
        textFont(fontEnd);
        text( lines[i], posXScore, 400 + 35*i);

        popStyle();
      }


      for (int i = 0; i < lines.length; i++)
      {
        pushStyle();       
        textAlign(RIGHT);
        textFont(fontEnd);
        text( linesTAG[i], posXTag, 400 + 35*i);
        if (iniTagCligno == 0) {
          //if (linesTAG[i] == TagP1+" "+TagP2) {   //  <-------------- Prob Ici
          if (linesTAG[i].equals(TagP1+" "+TagP2)) {
            tagActuel = i;
            clignoTagLancement = true;

            //  iniTagCligno++;
          }
        }






        popStyle();
      }


      //---- Partie Cligno
      if (clignoTagLancement == true) { //vrai seulement si ds le top10
        if (frameCount%(40) == 0 ) {
          if (tagCligno == true) {
            tagCligno = false;
          } else  if (tagCligno == false) {
            tagCligno = true;
          }
        }
        if (tagCligno == true) {
          pushStyle();
          fill(255, 0, 0);
          textAlign(RIGHT);
          text(linesTAG[tagActuel], posXTag, 400 + 35*tagActuel);
          text( score, posXScore, 400 + 35*tagActuel);
          text( tagActuel+1, posXRank + 15, 400 + 35*tagActuel);

          //text( i+1, posXRank, 400 + 35*i);

          popStyle();

          // text( "TAG", posXTag, 300);
        }
      }
      //---- Fin cligno






      pushStyle();
      textAlign(RIGHT);
      textFont(fontGros);
      fill(223, 109, 20);
      text( "RANK", posXRank, 300);
      text( "SCORE", posXScore, 300);
      text( "TAG", posXTag, 300);


      popStyle();

      if (frameCount%(600*30)==0 || valid == true ) { // a modif
        MenuScore = false; 
        gameover = true;
        saveStrings("E:\\Projet_Final_Mars\\Projet_Final_Mars_pde\\data\\highScoreP2.txt", lines);
        saveStrings("E:\\Projet_Final_Mars\\Projet_Final_Mars_pde\\data\\tagP2.txt", linesTAG);
        
        //E:\Projet_Final_Mars\Projet_Final_Mars_pde\data
        
       // println("pop");
      }
    }
  }
}


/*

 
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
 nbLaserJ2[nombreLaserJ2]= true;      //imp
 BoutonlaserJ2= false;
 }
 RJ2++;
 }
 for (int i =0; i<nMissile-1; i++) {
 if (nbLaserJ2[i] == true) {         
 
 if (lbJ2[i] == 0) {
 posLaserXJ2[i]= posXVaisseauJ2 + LarVP/2;
 posLaserYJ2[i]= posYVaisseauJ2;
 }
 lbJ2[i]++;
 posLaserYJ2[i]=posLaserYJ2[i] - 10;
 if (protectionON == false) {
 if (posLaserYJ2[i] < -100) {
 nbLaserJ2[i]= false; 
 lbJ2[i]=0;
 }
 }
 if (protectionON == true) {
 if (posLaserYJ2[i] < LonBarreDeProtection +posYBarreDeProtection ) {
 nbLaserJ2[i]= false; 
 lbJ2[i]=0;
 }
 }
 rect(posLaserXJ1[i], posLaserYJ1[i], larLaser, lonLaser);
 }
 }
 
 if ( nombreLaserJ2 == nMissile-1) {
 nombreLaserJ2=0;
 }
 }
 */
