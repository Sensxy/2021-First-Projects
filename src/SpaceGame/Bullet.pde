class Bullet {
  // member variables
  int x, y, speed, rad;
  color c;

  // constructor
  Bullet(int x, int y) {
    this.x=x;
    this.y=y;
    speed = 6;
    rad = 6;
    c = #E81523;
  }

  // member methods
  void fire() {
    y-=speed;
  }

  boolean reachedTop() {
    if (y<-3) {
      return true;
    } else {
      return false;
    }
  }


  void display () {
    fill(c);
    noStroke();
    ellipseMode(CENTER);
    ellipse(x, y, rad, rad);
  }
}
