class PowerUp {
  // member variables
  int x, y, speed, r, pu; 
  String[] puInfo = {"Health", "Lasers"};

  PowerUp(int x, int y) {
    r = 80; 
    this.x = x;
    this.y = y;
    speed = int(random(2, 8));
    pu = int(random(2));
  }

  void move() {
    y += speed;
  }

  boolean reachedBottom() {
    if (y > height + r*4) { 
      return true;
    } else {
      return false;
    }
  }

  void display() {
    noStroke();
    switch(pu) {
    case 1: // Health
      fill(0, 255, 0);
      ellipse(x, y, r, r);
      fill(255);
      textSize(9);
      textAlign(CENTER);
      text(puInfo[1], x, y);
      break;
    case 2: // Lasers
      fill(0, 0, 255);
      ellipse(x, y, r, r);
      fill(255);
      textSize(9);
      textAlign(CENTER);
      text(puInfo[2], x, y);
      break;
    }
  }
}
