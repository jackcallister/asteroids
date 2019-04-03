class Rocket {
  PVector velocity;
  PVector acceleration;
  PVector location;
  
  float trajectory;
  float rotation;
  
  Rocket() {
    location = new PVector(width/2, height/2);
    velocity = new PVector(0.0, 0.0);
    acceleration = new PVector(0.0, 0.0);
    
    trajectory = 0.0;
    rotation = 0.0;
  }
  
  void render() {
    pushMatrix();
    fill(0);
    stroke(255);
    
    translate(location.x, location.y);
    rotate(trajectory + PI / 2);
    
    triangle(-25, 10, 0, -45, 25, 10);
    popMatrix();
  }
  
  void move() {
    velocity.add(acceleration);
    location.add(velocity);
    
    acceleration = acceleration.mult(0.1);
  }
  
  void contain() {
    if (location.x > width) {
      location.x = 0;
    }
    
    if (location.x < 0) {
      location.x = width;
    }
    
    if (location.y > height) {
      location.y = 0;
    }
    
    if (location.y < 0) {
      location.y = height;
    }
  }
  
  void thrust() {
    acceleration.add(PVector.fromAngle(trajectory).mult(0.8));
  }
  
  void turn() {
    trajectory += rotation;
  }
  
  void setRotation(float angle) {
    rotation = angle;
  }
}
