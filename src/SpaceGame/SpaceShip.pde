class SpaceShip {
  //member variable
  int x, y, health, lives, rad;
  char displayMode;
  color c1;
  float easing;


//constructor
SpaceShip(color c1) {
  x = 0;
  y = 0;
  health = 100;
  lives = 1;
  displayMode = '1';
  this.c1 = c1;
  easing = 0.05;
  rad = 25;
  
}

// Rock vs Ship Collision
boolean rockIntersection(Rock rock) {
  float distance = dist(x,y,rock.x,rock.y);
  if(distance < rad + rock.rad) {
    return true;
  } else {
    return false;
  }
}

boolean puIntersect(PowerUp pu) {
    // Calculate distance
    float distance = dist(x, y, pu.x, pu.y); 

    // Compare distance to sum of radii
    if (distance < rad + pu.r) { 
      return true;
    } else {
      return false;
    }
  }

//member methods
void display(int x, int y) {
  this.x = x;
  this.y = y;
  if(displayMode == '1') {
   rectMode(CENTER);
  stroke(150);
  strokeWeight(2);
  fill(c1);
  rect(x+18, y+10, 8, 8);
  rect(x-18, y+10, 8, 8);
  line(x+35, y+10, x+35, y);
  line(x-35, y+10, x-35, y);
  fill(128);
  triangle(x, y-20, x+40, y+10, x-40, y+10);
  fill(200);
  ellipse(x, y+10, 20, 80);
}
}
}
