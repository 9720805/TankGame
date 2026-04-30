class Projectile {
  int x, y, w, h, speed;

  //constructor
  Projectile(int x, int y) {
    this.x = x;
    this.y = y;
    w = 10;
    h = 10;
    speed = 2;
  }
  void display() {
    rectMode(CENTER);
    rect(x, y, w, h);
  }

  void move() {
    y = y - speed;
  }
  boolean intersect(Tank t) {
    float distance = dist (x, y, t.x, t.y);
    if (distance < 100) {
      return true;
    } else {
      return false;
    }
  }
  
  
}
