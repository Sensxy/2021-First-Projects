// SpaceGame | Dec 2020
// by Ozan Hessick
//TODO:Project Setup  
import processing.sound.*;
SoundFile laser;
SpaceShip s1;
ArrayList<Bullet> bullets;
ArrayList<Rock> rocks;
ArrayList<Star> stars;
ArrayList<PowerUp> pUps;
Timer timer, puTimer;

int pass, weaponCount;
boolean play; 

void setup() {
  size(1000, 800);
  laser = new SoundFile(this, "GUN_SHOT.wav");
  s1 = new SpaceShip(#501DED);
  bullets = new ArrayList();
  rocks = new ArrayList();
  stars= new ArrayList();
  timer = new Timer(int(random(500, 900)));
  pUps = new ArrayList();
  puTimer = new Timer(5000);
  weaponCount = 1;
  timer.start();
  puTimer.start();
  pass = 0;
  play = false;
}

void draw() {
  noCursor();
  //Gameplay
  if (!play) {
    startScreen();
  } else {

    background(0);

    stars.add(new Star(int(random(width)), int(random(height))));
    for (int i = 0; i < stars.size(); i++) {
      Star star = stars.get(i);
      star.display();
      star.move();
      if (star.reachedBottom()) {
        stars  .remove(star);
      }
    }
  }


  if (timer.isFinished()) {
    rocks.add(new Rock(int(random(width)), -50));
    timer.start();
  }

  for (int i = 0; i < rocks.size(); i++) {
    Rock rock = rocks.get(i);
    rock.display();
    rock.move();
    // Rock vs Ship Collision
    if (s1.rockIntersection(rock)) {
      s1.health-=rock.health;
      rocks.remove(rock);
    }
    if (rock.reachedBottom()) {
      pass++;
      rocks.remove(rock);
    }
  }

  for (int i = 0; i < bullets.size(); i++) {
    Bullet bullet = bullets.get(i);
    bullet.display();
    bullet.fire();
    //Bullet vs Rock Intersection
   
  }

  if (puTimer.isFinished()) {
    pUps.add(new PowerUp(int(random(width)), -20));
    puTimer.start();
  }
  // PowerUp rendering and collision detection
  for (int i = 0; i<pUps.size(); i++) {
    PowerUp pu = pUps.get(i);
    pu.move();
    pu.display();
    // PowerUp and s1 intersection
    if (s1.puIntersect(pu)) {
    } else if (pu.pu == 1) { 
      s1.health+=50;
    } else if (pu.pu == 2) { 
      weaponCount++;
    }
    pUps.remove(pu);
  }
 


//Display Ship
infoPanel(); 
s1.display(mouseX, mouseY);  


//GameOver Logic
if (s1.health<1 || pass>10) {
  play = false;
  gameOver();
}
}


void mousePressed() {
  laser.play();
  bullets.add(new Bullet(s1.x, s1.y));
}

void startScreen() {
  background(0);
  textAlign(CENTER);
  text("Welcome!", width/2, height/2);
  text("Click to Continue...", width/2, height/2+20);
  text("Made by Ozan Hessick", width/2, height/2+60);

  if (mousePressed) {
    play = true;
  if  (weaponCount == 1) {
        bullets.add(new Bullet(s1.x, s1.y));
        weaponCount++;
        
      } else if (weaponCount == 2) {
        bullets.add(new Bullet(s1.x-20, s1.y));
        bullets.add(new Bullet(s1.x+20, s1.y));
        weaponCount++;
        
      } else if (weaponCount == 3) {
        bullets.add(new Bullet(s1.x, s1.y));
        bullets.add(new Bullet(s1.x-20, s1.y));
        bullets.add(new Bullet(s1.x+20, s1.y));
        weaponCount++;
        
      } else if (weaponCount == 4) {
        bullets.add(new Bullet(s1.x-20, s1.y));
        bullets.add(new Bullet(s1.x+20, s1.y));
        bullets.add(new Bullet(s1.x-40, s1.y));
        bullets.add(new Bullet(s1.x+40, s1.y));
        weaponCount++;
       
      } else if (weaponCount == 5) {
        bullets.add(new Bullet(s1.x, s1.y));
        bullets.add(new Bullet(s1.x-20, s1.y));
        bullets.add(new Bullet(s1.x+20, s1.y));
        bullets.add(new Bullet(s1.x-40, s1.y));
        bullets.add(new Bullet(s1.x+40, s1.y));
        weaponCount++;
       
      } else if (weaponCount == 6) {
        bullets.add(new Bullet(s1.x-20, s1.y));
        bullets.add(new Bullet(s1.x+20, s1.y));
        bullets.add(new Bullet(s1.x-40, s1.y));
        bullets.add(new Bullet(s1.x+40, s1.y));
        bullets.add(new Bullet(s1.x-60, s1.y));
        bullets.add(new Bullet(s1.x+60, s1.y));
        weaponCount++;
       
      } else if (weaponCount >= 7) {
        bullets.add(new Bullet(s1.x, s1.y));
        bullets.add(new Bullet(s1.x-20, s1.y));
        bullets.add(new Bullet(s1.x+20, s1.y));
        bullets.add(new Bullet(s1.x-40, s1.y));
        bullets.add(new Bullet(s1.x+40, s1.y));
        bullets.add(new Bullet(s1.x-60, s1.y));
        bullets.add(new Bullet(s1.x+60, s1.y));
        weaponCount++;
       
      }
    }
  }

  


void infoPanel() {
  fill(128, 128);
  rectMode(CORNER);
  rect(0, height-50, width/2, 50);
  fill(255, 128);
  text("Health:" + s1.health, 20, height-20);
  text("Lives:" + s1.lives, 80, height-20);
  //text("Level:", 130, height-20);
  //text("Score:", 170, height-20);
  text("Pass: " + pass, 420, height-30);
}

void gameOver() {
  background(0);
  textAlign(CENTER);
  fill(222);
  text("Game over :(", width/2, height/2);
  //text("Final Score:" + score, width/2, height/2+20);
  noLoop();
}
