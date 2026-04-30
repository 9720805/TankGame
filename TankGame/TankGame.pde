//Logan Dillworth | Tank Game
PImage bg;
Tank tank1;
ArrayList<Projectile> projectiles = new ArrayList<Projectile>();
ArrayList<Obstacle> obstacles = new ArrayList<Obstacle>();
ArrayList<PowerUp> powerups = new ArrayList<PowerUp>();
int score;
Timer obsTimer, puTimer;
 
void setup() {
  size(500, 500);
  bg = loadImage("bg1.png");
  tank1 = new Tank();
  score = 0;
  obsTimer = new Timer(1000);
  obsTimer.start();
  puTimer = new Timer(5000);
  puTimer.start();
}

void draw() {
  background(127);
  imageMode(CORNER);
  image(bg, 0, 0);
  // Add timer to distribute obstacles
  if (obsTimer.isFinished()) {
    obstacles.add(new Obstacle(-100, int(random(height))));
    obsTimer.start();
  }
  if (puTimer.isFinished()) {
    powerups.add(new PowerUp());
    puTimer.start();
  }
  for (int i = 0; i < powerups.size(); i++) {
    PowerUp pu = powerups.get(i);
    pu.display();
    pu.move();
  
    if (pu.reachedSide()) {
      powerups.remove(pu);
      if (pu.intersect(tank1)) {
        if (pu.type == 'h') {
          tank1.health = tank1.health = 100;
          powerups.remove(pu);
        } else if (pu.type == 'a') {
          tank1.laserCount = tank1.laserCount = 100;
          powerups.remove(pu);
        }
      } else if (pu.type == 't') {
        tank1.turretCount = tank1.turretCount = 1;
        powerups.remove(pu);
      }
    }
  }
  //obstacle.add(new Obstacle(250, 250));

  //displaying Obstacles
  for (int i = 0; i < obstacles.size(); i++) {
    Obstacle obs = obstacles.get(i);
    obs.display();
    obs.move();
    if (obs.intersect(tank1)) {
      tank1.health = tank1.health - 25;
      obstacles.remove(obs);
    }
    if (obs.reachedSide()) {
      obstacles.remove(i);
    }
  }
    for (int i = 0; i < projectiles.size(); i++) {
    Projectile p = projectiles.get(i);
    p.display();
    p.move(); 
    if (p.intersect(tank1)) {
      tank1.health = tank1.health - 25;
      obstacles.remove(p);
    }
 //   if (p.reachedSide()) {
 //     obstacles.remove(i);
 //   }
  }
  //displaying Projectiles


  tank1.display();


  scorePanel();
  println("Objects in Memory:"+obstacles.size());
  println("Projectiles in Memory:"+projectiles.size());
}


void scorePanel() {
  fill(127, 127);
  rectMode(CENTER);
  rect(width/2, 30, width, 60);
  fill(255);
  textSize(30);
  textAlign(CENTER);
  text("Score:" + score, width/2, 30);
    text("Health:" + tank1.health, width/2-150, 30);
  text("Ammo:" + tank1.laserCount, width/2+150, 30);
}

void keyPressed() {
  if (key == 'w') {
    tank1.move('w');
    tank1.idir = 'w';
  } else if (key == 's') {
    tank1.move('s');
    tank1.idir = 's';
  } else if (key == 'a') {
    tank1.move('a');
    tank1.idir = 'a';
  } else if (key == 'd') {
    tank1.move('d');
    tank1.idir = 'd';
  }
}

void mousePressed() {
  if (tank1.turretCount == 1) {
    projectiles.add(new Projectile(int(tank1.x), int(tank1.y)));
  } else if (tank1.turretCount==2) {
    projectiles.add(new Projectile(int(tank1.x), int(tank1.y)));
    projectiles.add(new Projectile(int(tank1.x), int(tank1.y)));
  }
  //projectiles.add(new Projectile(int(tank1.x), int(tank1.y)));
}
