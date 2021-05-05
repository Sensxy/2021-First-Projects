class Rock {
  // member variables
  int x, y, dia, health, speed, rad, healthStart;
  char displayMode;
  color c;
  PImage rock, rock2, rock3;

  // constructor
  Rock(int x, int y) {
   rad = int(random(25, 60));
   healthStart = rad;
    this.x = x;
    this.y = y;
    dia = 50;
    health = rad;
    speed = int(random(1, 8));
    displayMode = '1';
    c = #B48157;
    rock = loadImage("rock.png");
    rad = 25;
  }
  
  //Laser vs Rock Intersection
  boolean bulletIntersection(Bullet bullet) {
    float distance = dist(x,y,bullet.x,bullet.y);
    if(distance < rad + bullet.rad) {
      return true;
  } else {
      return false;
  }
}

  boolean reachedBottom() {
    if (y>height + rad*4) {
      return true;
    } else {
      return false;
    }
  }

  void move() {
    y+=speed;
  }
  // member methods
  void display () {
    fill(c);
    noStroke();
    //ellipse(x, y, dia, dia);
    image(rock, x, y);
  }
}
