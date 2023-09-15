import processing.serial.*;
Serial myPort;

int b1p1;
int b2p1;
int b1p2;
int b2p2;
int X1;
int Y1;
int X2;
int Y2;
int ON ;
int P; 
boolean jeux = false;
boolean piece =false;

//partie compteur
PFont font, fontVie, fontVersusEnd, compteurVersusFont, fontEnd, fontArcadeRetry, fontHigscore, fontGros, dialogue;
boolean continuer = true;
int i;
int decompte= 10;
boolean compteur =true;
boolean gameover = false; //pa touche
boolean plusDeVie = false;  //--------------------------- doit etre false
int delaiGameover;
boolean home = true;

boolean clignotement = false;
boolean menuGameOver= true;

boolean choosePlayer= true; 
boolean choose = true;
int Nplayers = 0;

boolean pieceEnding=false; 
boolean affichageYes= true; 
int translateYes =0;
boolean translateYesB = true;
boolean translateYesN = true;
//reçue en valeur numérique entiere   //  7 +1balance +2joystick
int yesCompteur =0;
boolean menuBougerYes=false;

boolean jeuxArcade =false;


int LarVP = 15;
int LonVP = 30;

int Xp1;
int Yp1;
int Xp2;
int Yp2;



int LarLaser = 3 ;
int LonLaser = 10;
int XLaser;
int YLaser;
boolean BoutonlaserJ1 = false;
boolean BoutonlaserJ2 = false;
boolean laser = false;

int nMissile =10;

boolean nbLaserJ1[]= new boolean [nMissile]; 
int posLaserXJ1[]= new int [nMissile]; 
int posLaserYJ1[]= new int [nMissile];
boolean nbLaserJ2[]= new boolean [nMissile]; 
int posLaserXJ2[]= new int [nMissile]; 
int posLaserYJ2[]= new int [nMissile];

int initLaserJ1[] =new int [nMissile]; 
int initLaserJ2[]=new int [nMissile]; 
int initLaserVersus[]= new int [nMissile]; 



int posXVaisseauJ1 = 400; //width/2
int posYVaisseauJ1 = 250 ; //height/2
int posXVaisseauJ2 = 400; //width/2
int posYVaisseauJ2 = 250 ; //height/2
int vitesseVaisseauP1 = 5;
int vitesseVaisseauP2 = 5;
int NbLaser;


int l=0;
int lx=0;  // a supr
int lbJ1[]= new int [nMissile];
int lbJ2[]= new int [nMissile];

boolean twoPlayerMenu = false;

boolean hautJ2, basJ2, droiteJ2, gaucheJ2;
boolean hautJ1, basJ1, droiteJ1, gaucheJ1;
boolean poids, O, M, toucheSpace, shift, L, N;

boolean ChooseTwo = false;
boolean VersusJeux = false;

boolean Laser1;
int LaserX;
int LaserY;
int nombreLaserJ1=0;
int nombreLaserJ2=0;


boolean timer = false;

int Rotate=0;


int larLaser =3;
int lonLaser =10;

int RJ1;  //compteur bouton B1P1
int RJ2;
int SJ1;  //compteur bouton B2P1
int SJ2;

boolean bouton2J1;
boolean bouton2J2;

int initialisationVersus =0;


int Co;
int test; 

int compteurValid;
boolean valid;
boolean validation;

int initChoosePlayer =0;
int initTwoPlayerMenu =0;

int vieJ1 = 15;
int vieJ2 = 15;

boolean  J1Touche = false;
boolean  J2Touche = false;

PImage[] explosion = new PImage[11];
PImage[] bossAnimNeutre = new PImage[29];

int initExplo =0;
int iniVitesseExplo =5;
int iExplo =0;
boolean endingVersus = false;
boolean explosionOn = true;
boolean winnerScreen = false;
boolean clignotementVersus =false;
int  posYExplo;
int posXExplo;
int t;

boolean startVersus = true;
int compteurVersus =3;
int tailleFontVersus =100;
int tailleFontArcadeRetry =100;



int nbr = 100;

vEnemy[] vEnemy1 = new vEnemy[nbr];



boolean VenEtat=false;

int LarVen, LonVen, posXVen, posYVen, deltaXVen, deltaYVen;

int nEnemyOff;
int nBossOff;

int choixVP1_1 =0;
int choixVP1_2 =0;
int choixVP2 =0;



int compteurValidHautP1;
boolean validHautP1;
boolean validationHautP1;
int compteurValidHautP2;
boolean validHautP2;
boolean validationHautP2;
int compteurValidBasP1;
boolean validBasP1;
boolean validationBasP1;
int compteurValidBasP2;
boolean validBasP2;
boolean validationBasP2;

int nFrameTrainer = 30;


int trainerXp1[]= new int [nFrameTrainer];
int trainerYp1[]= new int [nFrameTrainer];
int trainerXp2[]= new int [nFrameTrainer];
int trainerYp2[]= new int [nFrameTrainer];


int vague =1;
boolean finDeVague = true;

int score = 0;
boolean spawnEnemy = false;



boolean moteursXP1;
boolean moteursYP1;
boolean moteursXP2;
boolean moteursYP2;

boolean coliVenP1;
boolean coliVenP2;

boolean explo;
int antiExploP1 =0;
int antiExploP2 =0;
int larBandeVersus = 100;
int larBandeArcade =20;

int initialisationArcade=0;
int initVagues;



boolean startArcade= false;
boolean cooldownDashP1;
int cooldownDashCompteurP1;
boolean cooldownDashP2;
int cooldownDashCompteurP2;

int LarBarreLaser = 30;
int LonBarreLaser = 10;

int posXBarreLaserP1;
int posYBarreLaserP1;

int BarreChargementLaserP1 =0;
boolean barreChargeLaserP1=false;

int DashCompteurJ1;
int LaserSpeCompteurJ1;
int LarLaserSpe= 80;
boolean LaserSpeJ1;
boolean dashOnJ1 ;
int initB2P1;

int FrameChargeBarreLaser= 5;            // A changer pour la difficulter
int TimecooldownDashCompteur= 180;
int dureeLaserSpe= 30;
int posXLaserSpeJ1;
int posYLaserSpeJ1;



int posXLaserSpeJ2;
int posYLaserSpeJ2;
boolean LaserSpeJ2;
boolean dashOnJ2 ;
int posXBarreLaserP2;
int posYBarreLaserP2;
int BarreChargementLaserP2 =0;
boolean barreChargeLaserP2=false;
int DashCompteurJ2;
int LaserSpeCompteurJ2;
int initB2P2;

int LarBarreVieBoss =10 ;
int LonBarreVieBoss = 20;

int LarLaserBoss =10 ;
int LonLaserBoss = 20;

//boolean LaserBoss;
//boolean LaserBossAnim;
//int LaserBossAnimCompteur;
//int LaserBossCompteur;
boolean attaqueBossReady;

PImage background1; 
PImage background2; 
int Ybackground1=0;
int Ybackground2=-1024;

int nBouclierOff;

int ecranX =1280;
int ecranY = 1024;

int ecartBouclierBordure = 150;
int LonBouclier = 30;
int LarBouclier = 30;
int posXBouclier1 = ecartBouclierBordure;
int posXBouclier2 = ecranX -ecartBouclierBordure - LarBouclier ;
int posYBouclier = 207;
int HP_Bouclier =20;

// 1280 x 1024

int LonBoss = 40;
int LarBoss = 180;
int HP_Boss = 50;
//int posXBoss = (ecranX+LarBoss)/2;
int posXBoss = 640 - 90;
int posYBoss = 115;

Boss Boss1 = new Boss(posXBoss, posYBoss, 5, 0, LarBoss, LonBoss, false, HP_Boss, 2);


Bouclier Bouclier1 = new Bouclier (posXBouclier1, posYBouclier, LarBouclier, LonBouclier, false, HP_Bouclier);
Bouclier Bouclier2 = new Bouclier (posXBouclier2, posYBouclier, LarBouclier, LonBouclier, false, HP_Bouclier);     // a modif X

int LarBarreVieBouclier=3;
int LonBarreVieBouclier=10;
//int tempRestorationBouclier= 60* 10;
int restaurationBouclierCompteur; // doit rester gén
boolean protectionON = true;
//   int tempRestorationBouclierCompteur;     // prob vien de l

int posYBarreDeProtection=165;
int LonBarreDeProtection=10;

int difficulty=1;
boolean BossDestroy;
int upMouvCompteur;

int initLifeVersus = 5;
int initLifeArcade = 5;


int initMenuGameOver =0;
int initBoss;
int initBouclier;
int initEn;


boolean timerRetry = false;
int compteurArcadeRetry =3;

boolean frameInvincible = false;    // a mettre dans le gameover 
boolean MenuHighScore = false;



int posXBarreDashP1;
int posYBarreDashP1;
int posXBarreDashP2;
int posYBarreDashP2;
int LonBarreDash=5;
int LarBarreDash=30;


int BarreChargementDashP1;
int BarreChargementDashP2;
int FrameChargeBarreDash=2;

boolean pieceJ2 = false;



boolean MenuChooseTag = true;
String TagP1;
String TagP2;
boolean TagP1Select;
boolean TagP2Select;

int chooseLetterP1;
int chooseLetterP2;

int selectCara[]= new int [6];
String CaraB[]= new String [6];
String Cara[]= new String [6];
String CaraA[]= new String [6];

String cara2P1;
String cara3P1;

boolean validDroiteP1;
boolean validGaucheP1;
boolean validDroiteP2;
boolean validGaucheP2;

boolean validationDroiteP1;
int compteurValidDroiteP1;
boolean  validationDroiteP2;
int compteurValidDroiteP2;
boolean validationGaucheP1;
int compteurValidGaucheP1;
boolean validationGaucheP2;
int compteurValidGaucheP2;

boolean bouton1P1;
boolean interBouton1P1;
int compteurBouton1P1;
boolean bouton2P1;
boolean interBouton2P1;
int compteurBouton2P1;
boolean bouton1P2;
boolean interBouton1P2;
int compteurBouton1P2;
boolean bouton2P2;
boolean interBouton2P2;
int compteurBouton2P2;

PImage trianglejauneHaut, trianglejauneBas;
int ecartYCaraHighScore =70 ;
int ecartXCaraHighScore =95 ;

boolean MenuScore=false;



String[] lines;


String[] mots1;
String[] mots2;
String[] mots3;
String[] mots4;
String[] mots5;
String[] mots6;
String[] mots7;
String[] mots8;
String[] mots9;
String[] mots0;

String[] mots;

int initMenuScore =0;

String Sscore;

int H1, B1, G1, D1, H2, B2, G2, D2;

String memo;

int valeurLines1;
int valeurLines2;


int posXRank = 300;
int posXScore = 600;

int posXTag = 1200;

int initHighscore =0;


int iAnimNeutreBoss =1;


PImage[] BossAnimNeutre = new PImage[29];
PImage[] BossAnimLaser= new PImage[25];

PImage[]  BossAnimDeath= new PImage[19];
int  iAnimDeath= 1;
boolean endingAnimDeathBoss; 

PImage[]  exploBoss = new PImage[16];
int iexploBoss =1;
boolean repopBoss;

int initDeathBoss = 0;

int iAnimEnemy= 1;
PImage[]  AnimEnemy = new PImage[4];
//PImage  AnimEnemy;


String[] linesTAG;

String memoRank;

int tagActuel;
boolean tagCligno;
int iniTagCligno;


int initExplo1;
int iExplo1;
boolean explo1;
int posXExplo1;
int posYExplo1;

int initExplo2;
int iExplo2;
boolean explo2;
int posXExplo2;
int posYExplo2;

int PosYBandeSeparation=240 ;

PImage LaserSimpleVaisseau;

PImage[]  barriereAnim = new PImage[12];

int iAnimBarriere;

PImage[] LaserBossAnimPNG= new PImage[2];
int iLaserBossAnim; 

PImage backgroundfixe;

PImage vaisseau1;
PImage vaisseau2;
PImage vaisseau3;
PImage vaisseau4;

int coorYTraine = 15;

boolean clignoTagLancement;


PImage backgroundfixe2;
boolean backgroundfixeChange;


int initPhase2;

boolean phase2 =false ;
boolean phase2MouvBoss = false;

int LarCannon = 54;
int LonCannon = 33;

int posXCannonG =0;
int posXCannonD =1280 - LarCannon ;
int posYCannonG1 =300;
int posYCannonD1 =640;
int posYCannonG2 =300;
int posYCannonD2 =640;

int Gcannon = 0;
int Dcannon = 1;
int FocusCannonJ1 = 0;
int FocusCannonJ2 = 1;


int larLaserCannon = 10;
int lonLaserCannon = width;


/* sert plus a r
 Cannon CannonG1 = new Cannon (posXCannonG, posYCannonG1, LarCannon, LonCannon, Gcannon, FocusCannonJ1  );
 Cannon CannonG2 = new Cannon (posXCannonG, posYCannonG2, LarCannon, LonCannon, Gcannon, FocusCannonJ2 );
 Cannon CannonD1 = new Cannon (posXCannonD, posYCannonD1, LarCannon, LonCannon, Dcannon, FocusCannonJ1 );
 Cannon CannonD2 = new Cannon (posXCannonD, posYCannonD2, LarCannon, LonCannon, Dcannon, FocusCannonJ2 );
 
 
 
 
 Cannon CannonG2 = new Bouclier (0, posYCannonG , LarBouclier, LonBouclier, false, HP_Bouclier);
 Cannon CannonD1 = new Bouclier (1024 - , posYCannon , LarBouclier, LonBouclier, false, HP_Bouclier);
 Cannon CannonD2 = new Bouclier (posXBouclier1, posYBouclier, LarBouclier, LonBouclier, false, HP_Bouclier);
 */

PImage[] crystal = new PImage[49];


PImage crystalDeath;

PImage[] crystalExplo = new PImage[8];



PImage crystalShield;

int memoPosXBoss; 
int compteurmemoPosXBoss;


PImage cannonOnD, cannonOffD, cannonNeutreD, cannonOnG, cannonOffG, cannonNeutreG;

int nbrCannon = 8;

Cannon[] CannonG = new Cannon[nbrCannon];
Cannon[] CannonD = new Cannon[nbrCannon];

PImage laserCannon1, laserCannon2;
int compteurDialogue;
boolean dialogueBoss;

int initDialogue;
boolean dialogueEnding;
boolean cannonActif;
//boolean cannonShoot;

int prevuLaserLongeur =  1280 - LarCannon*2 ; // a changer
int prevuLaserLargeur =  80;

int CannonGRentrerGlo, CannonDRentrerGlo;

//int initMouvBaseCannonG;
//int initMouvBaseCannonD;


boolean dialogueRage;
int  dialogueCompteur;
int ValidFinDialogueRage;

PImage[] CannonSmok = new PImage[24];
int iCannonSmok; 

boolean dialoguePanne;
int  dialoguePanneCompteur;
int ValidFinPanneDialogueRage;

PImage[] eclair = new PImage[5];
int ieclair;

int initCompteurCannon;
int initCannon;

int posXLaserCannon= 0;

PImage[] ecranTitre = new PImage[25];
int iEcranTitre;

int latenceAvantTirBossCompteur;

PImage backgroundMenuPlayer;

PImage[] asteroid = new PImage[3];


void setup() {

  size( 1280, 1024);  
  //size( 1280, 800);  
  //  fullScreen();
  //  size(1920, 930); 
  // myPort = new Serial(this, Serial.list()[1], 9600); // <----- REMETTRE A 1
  font = createFont("ARCADE_N.TTF", 32);
  fontEnd = createFont("ARCADE_N.TTF", 32);
  fontVie = createFont("ARCADE_N.TTF", 16);
  fontVersusEnd =  createFont("ARCADE_N.TTF", 42);
  fontHigscore =  createFont("ARCADE_N.TTF", 35);
  fontGros=createFont("ARCADE_N.TTF", 42);
  dialogue=createFont("DTM-Mono.otf", 12);

  background(0);
  background1 = loadImage("background1.jpg");
  background2 = loadImage("background2.jpg");
  trianglejauneHaut = loadImage("trianglejauneHaut.png");
  trianglejauneBas = loadImage("trianglejauneBas.png");
  LaserSimpleVaisseau = loadImage("SpaceInvadersLaser.png");
  backgroundfixe = loadImage("background3.png");
  backgroundfixe2 = loadImage("background4.png");

  vaisseau1 = loadImage("vaisseau1.png");
  vaisseau2 = loadImage("vaisseau2.png");
  vaisseau3 = loadImage("vaisseau3.png");
  vaisseau4 = loadImage("vaisseau4.png");

  for (int i=0; i<2; i++) {
    LaserBossAnimPNG[i] = loadImage("LaserBoss-" +i+ ".png");
  }

  for (int i=0; i<12; i++) {
    barriereAnim[i] = loadImage("barriere-" +i+ ".png");
  }

  for (int i=0; i<12; i++) {
    barriereAnim[i] = loadImage("barriere-" +i+ ".png");
  }

  for (int i=0; i<11; i++) {
    explosion[i] = loadImage("Explosion_" +i+ ".png");
  }


  for (int i=0; i<4; i++) {
    AnimEnemy[i] =   loadImage("mobs-" + i + ".gif");
  }
  for (int i=0; i<16; i++) {
    exploBoss[i] = loadImage("exploBoss-" +i + ".png");
  }
  for (int i=0; i<19; i++) {
    BossAnimDeath[i] = loadImage("BossDeath-" +i + ".png");
  }

  for (int i=0; i<29; i++) {
    BossAnimNeutre[i] = loadImage("Boss-" +i + ".gif");
  }

  for (int i=0; i<25; i++) {
    BossAnimLaser[i] = loadImage("BossAnimLaser-" +i + ".gif");
  }

  for (int i=0; i<49; i++) {
    crystal[i] = loadImage("Cristaux-" +i+ ".png");
  }


  crystalDeath= loadImage("CristauxDeath.png");
  crystalShield= loadImage("energy-shield-png.png");


  for (int i=0; i<8; i++) {
    crystalExplo [i] = loadImage("ExploCrystal-" +i+ ".png");
  }

  for (int i=0; i<24; i++) {
    CannonSmok  [i] = loadImage("smok-" +i+ ".png");
  }
  for (int i=0; i<5; i++) {
    eclair[i] = loadImage("eclair-"+i+".png");
  }
  for (int i=0; i<25; i++) {
    ecranTitre[i] = loadImage("ecran-titre-finale_" +i+ ".png");
  }



  for (int i=0; i<nbr; i++) {
    vEnemy1[i] = new vEnemy(  int(random(width)), height, 0, 3, 20, 20, VenEtat, 3, 2 );
  }

  for (int i=0; i<3; i++) {
    asteroid[i] = loadImage("asteroid_"+i+".png");
  }
  

  /*
Cannon CannonG1 = new Cannon (posXCannonG, posYCannonG1, LarCannon, LonCannon, Gcannon, FocusCannonJ1  );
   Cannon CannonG2 = new Cannon (posXCannonG, posYCannonG2, LarCannon, LonCannon, Gcannon, FocusCannonJ2 );
   Cannon CannonD1 = new Cannon (posXCannonD, posYCannonD1, LarCannon, LonCannon, Dcannon, FocusCannonJ1 );
   Cannon CannonD2 = new Cannon (posXCannonD, posYCannonD2, LarCannon, LonCannon, Dcannon, FocusCannonJ2 );
   */

  for (int i=0; i<nbrCannon; i++) {
    CannonG[i] = new Cannon( -LarCannon, PosYBandeSeparation +50+ ( i*100), LarCannon, LonCannon, Gcannon, FocusCannonJ1 );  // posXchange apres
    CannonD[i] = new Cannon( width, PosYBandeSeparation +50 +( i*100), LarCannon, LonCannon, Dcannon, FocusCannonJ1 );
  }


  cannonOnD= loadImage("LaserOnD.png");
  cannonOffD= loadImage("LaserOffD.png");
  cannonNeutreD= loadImage("LaserNeutreD.png");
  cannonOnG= loadImage("LaserOnG.png");
  cannonOffG= loadImage("LaserOffG.png");
  cannonNeutreG= loadImage("LaserNeutreG.png");

  laserCannon1= loadImage("CannonLaser1.png");
  laserCannon2 = loadImage("CannonLaser2.png");

  backgroundMenuPlayer = loadImage("backgroundMenuPlayer.png");


}






void draw() {

  /*
  
   // test highscore
   clavier();
   boutonsPlayers();
   validation();
   directionGD();
   direction();
   HighScore();
   Nplayers = 2;
   }
   
   
   
   */

  // println("piece: "+ piece);

  clavier();
  directionGD();
  boutonsPlayers();

  //---------------------------------------------------------------------------------
  if (P >= 800 && P<= 850) {      //piece bonne
    piece = true;
  }
  //----------------------------------------------------------------------------------

  if (home == true) {  
    homeMenu();
  }
  //-----------------------------------------------------------------------------------
  if (piece == true) {
    home = false;
  }
  //-----------------------------------------------------------------------------------
  if ( home == false && jeux == false) {
    startMenu();
  }

  validation();
  direction();

  if (piece==true && valid == true) {            // Si Piece ok + bonton On = lancer jeux
    jeux= true;
    piece = false;
  }

  if (jeux==true) {
    if (choosePlayer == true) {  // true de base
      menuChoosePlayer();
    }
    if (twoPlayerMenu == true) {
      TwoPlayersMenu();
    }

    if (jeuxArcade == true) {
      jeuxArcadeMenu();
    }
    if (VersusJeux == true) {
      versusMode();
    }

    if (plusDeVie == true) {          // enclenchement du menu game over
      END();
    }
  }
}
