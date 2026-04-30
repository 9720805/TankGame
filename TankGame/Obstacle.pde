class Obstacle {
  float x, y, w, h, speed, health;
  PImage obst1;
  char idir;

  //constructor
  Obstacle(float w, float h) {
    this.w = w;
    this.h = h;
    speed = 5;
    health = 100;
    if (int(random(4))==2) {
      idir = 'w';
      x = random(width);
      y = height +100;
    } else if (int(random(3))==1) {
      idir = 'd';
      x=-100;
      y = random(height);
    } else if (int(random(2))==1) {
      idir = 'a';
      x=width+100;
      y = random(height);
    } else {
      idir = 's';
      x= random(width);
      y = -100;
    }
    obst1= loadImage("Obstacle1.png");
  }

  void display() {
    imageMode(CENTER);
    image(obst1, x, y);
  }

  void move() {
    switch(idir) {
    case 'w':
      y= y-speed;
      break;
    case 'a':
      x= x-speed;
      break;
    case 's':
      y= y+speed;
      break;
    case 'd':
      x= x+speed;
      break;
    }
  }
  boolean intersect(Tank t) {
    float distance = dist (x, y, t.x, t.y);
    if (distance < 100) {
      return true;
    } else {
      return false;
    }
  }
  boolean reachedSide() {
    return x>= width+150 || x <= -150 || y > height + 150 || y < -150;
  }
}
