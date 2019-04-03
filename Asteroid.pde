class Asteroid {
  PVector location;
  PVector velocity;
  float mass;
  
  Asteroid() {
   location = new PVector(random(0, width),random(0, height));
   velocity = new PVector(random(-2, 2), random(-2, 2));
  }
  
  void update() {
    location.add(velocity);
  }
  
  void render() {
    ellipse(location.x, location.y, 20, 20);
  }
}
