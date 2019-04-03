class Missle {
  PVector location;
  PVector velocity;
  float angle;
  
  Missle(Rocket rocket) { 
    location = rocket.location.copy();
    angle = rocket.trajectory;
  }
  
  void update() {
    velocity = PVector.fromAngle(angle);
    velocity.mult(10);
    location.add(velocity);
  }

  void render() {
    pushMatrix();
    fill(255);
    ellipse(location.x, location.y, 4, 4);
    popMatrix();
  }
}
