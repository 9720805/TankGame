class Tank {
  float x, y, w, h, speed, health;
  PImage iTankW, iTankA, iTankS, iTankD;
  char idir;
int turretCount, laserCount;

  //constructor
  Tank() {
    x = 100;
    y = 100;
    w = 100;
    h = 100;
    speed = 5;
    health = 100;
    iTankW = loadImage("tankW.png");
    iTankA = loadImage("tankA.png");
    iTankS = loadImage("tankS.png");
    iTankD = loadImage("tankD.png");
    idir = 'w';
    turretCount = 1;
    laserCount = 100;
  }
  void display() {
    imageMode(CENTER);
    if (idir == 'w') {
      image(iTankW, x, y);
      println("w");
    } else if (idir == 'a') {
      image(iTankA, x, y);
      println("a");
    } else if (idir == 's') {
      image(iTankS, x, y);
    } else if (idir == 'd') {
      image(iTankD, x, y);
    }
  }
  void move(char idir) {
    if (idir == 'w') {
      idir = 'w';
      y = y - speed;
    } else if (idir == 's') {
      idir = 's';
      y = y + speed;
    } else if (idir == 'a') {
      idir = 'a';
      x = x - speed;
    } else if (idir == 'd') {
      idir = 'd';
      x = x + speed;
    }
  }  
}
