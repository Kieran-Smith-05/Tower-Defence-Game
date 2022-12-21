//Tower Defense Game
//Kieran Smith
//Programming 12

// ================ GLOBAL VARIABLES =================

final int INTRO    = 0;
final int PLAY     = 1;
final int BUILD    = 2;
final int GAMEOVER = 3;
final int MAPSELECT = 4;
int mode;


//Tower Types
final int GUN = 1;
final int AOE = 2;
final int SNIPER = 3;

//Pallette
color white = #ffffff;
color black = #000000;
color floor = #E2DE84;
color dGreen = #3F4739;
color mGreen = #A6A670;
color red = #A4031F;
color blue = #2A4494;


//Mouse & Keyboard interaction variables
boolean mouseReleased;
boolean wasPressed;
boolean building = false;

//Buttons
Button start, gameoverButton, nextWave, build, playMode, buyGunTower, buyAOETower, buySniperTower, map1, map2;

//Collections of objects
Node[] nodes;
Node[] nodes2;
AOE_ring aoe;
ArrayList<Mob> mobs;
ArrayList<Tower> towers;
ArrayList<Bullet> bullets;

//Images and Gifs
Gif backrooms;
//Fonts
PFont blur;

// ===================== SETUP =========================

void setup() {
  rectMode(CENTER);
  imageMode(CENTER);
  textAlign(CENTER, CENTER);
  size(1000, 800);
  initializeModes();
  initializeVariables();
  makeButtons();

  mode = INTRO;
}

void initializeModes() {
  //set up the default mode for things
  rectMode(CENTER);
  imageMode(CENTER);
  textAlign(CENTER, CENTER);
  mode = INTRO;
}

void initializeVariables() {
  //Load Images & Gifs
  backrooms = new Gif("backrooms/frame_", "_delay-0.03s.gif", 27, 2, 500, 400, width, height);
  //Load Fonts
  blur = createFont("Blur.ttf", 200);

  //Create Collections of Objects
  mobs = new ArrayList<Mob>();
  towers = new ArrayList<Tower>();
  bullets = new ArrayList<Bullet>();
  aoe = new AOE_ring(0, 0);
  //test towers
}

void makeButtons() {
  //INTRO - Start
  start = new Button("START", width/2, 3*height/4, 200, 100, white, black);
  map1 = new Button("THE BACKROOM", 300, 400, 140, 100, blue, white);
  map2 = new Button("FLOOR 2", 700, 400, 140, 100, red, white);
  //PLAY - Next Wave, To Build Mode
  nextWave = new Button("WAVE", 900, 100, 140, 100, blue, white);
  build = new Button("BUILD", 900, 200, 140, 100, blue, white);
  playMode = new Button("PLAY", 900, 300, 140, 100, blue, white);
  buyGunTower = new Button("GUN", 900, 400, 140, 100, blue, white);
buySniperTower = new Button("SNIPER", 900, 500, 140, 100, blue, white);
buyAOETower = new Button("AOE", 900, 600, 140, 100, blue, white);
  //BUILD - To play mode, Buy Sniper, Buy Gun, Buy AoE

  //GAMEOVER - Reset
  gameoverButton = new Button("RESTART", 700, 700, 100, 100, blue, white);
}

void makeNodes() {
  //Plot the nodes on the map
  if (map1.clicked) {
    nodes = new Node[10];

    nodes[0] = new Node( 200, 100, 0, +1);
    nodes[1] = new Node(200, 600, +1, 0);
    nodes[2] = new Node(400, 600, 0, -1);
    nodes[3] = new Node(400, 500, -1, 0);
    nodes[4] = new Node(300, 500, 0, +1);
    nodes[5] = new Node(300, 700, +1, 0);
    nodes[6] = new Node(500, 700, 0, -1);
    nodes[7] = new Node(500, 300, +1, 0);
    nodes[8] = new Node(700, 300, 0, +1);
    nodes[9] = new Node(700, 700, +1, 0);
  } else if (map2.clicked) {
    nodes = new Node[5];

    nodes[0] = new Node(0, 100, +1, 0);
    nodes[1] = new Node(300, 100, 0, +1);
    nodes[2] = new Node(300, 500, +1, 0);
    nodes[3] = new Node(500, 500, 0, -1);
    nodes[4] = new Node(500, 200, +1, 0); 
  }
}


// ===================== DRAW ===========================

void draw() {
  click();
  makeNodes();
  if (mode == INTRO) {
    intro();
  } else if (mode == MAPSELECT) {
    mapSelect();
  } else if (mode == PLAY) {
    play();
  } else if (mode == BUILD) {
    build();
  } else if (mode == GAMEOVER) {
    gameOver();
  }
}
