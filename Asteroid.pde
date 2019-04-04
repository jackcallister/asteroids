class Asteroid {
  PVector location;
  PVector velocity;
  float mass;
  
  int points = 0;
  float distortion = 4;

  float[] x;
  float[] y;
  
  float[] xd;
  float[] yd;
  
  float angle = 0.0;
  float angleIncrement; 

  Asteroid() {
   points = int(random(20, 36));
   angleIncrement = 360 / points;
   mass = random(4, 10);

   location = new PVector(random(0, width),random(0, height));
   velocity = new PVector(random(-2, 2), random(-2, 2));
   
   x = new float[points];
   y = new float[points];
   
   xd = new float[points];
   yd = new float[points];
   
   for(int i=0; i < points; i++){
     xd[i] = random(-distortion, distortion);
     yd[i] = random(-distortion, distortion);
   }
  }
  
  void update() {
    location.add(velocity);
  }
  
  void render() {
    pushMatrix();
    fill(0);
    translate(location.x, location.y);
    
    beginShape();
    for(int i = 0; i < points; i++){
      x[i] = (sin(radians(angle)) * radius()) + xd[i];
      y[i] = (cos(radians(angle)) * radius()) + yd[i];
      
      curveVertex(x[i], y[i]);
      
      angle += angleIncrement;
    }
    
    angle = 0.0;
    
    // Close the shape
    curveVertex(x[0], y[0]);
    curveVertex(x[1], y[1]);
    curveVertex(x[2], y[2]);
      
    endShape(CLOSE);
    popMatrix();
  }
  
  void contain() {
    if (location.x > width) {
      location.x = 0;
      location.y = random(height);
    }
    
    if (location.x < 0) {
      location.x = width;
      location.y = random(height);
    }
    
    if (location.y > height) {
      location.y = 0;
      location.x = random(width);
    }
    
    if (location.y < 0) {
      location.y = height;
      location.x = random(width);
    }
  }
  
  float radius() {
    return mass * 4;
  }
}
