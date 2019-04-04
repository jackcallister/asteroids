Rocket rocket;
ArrayList<Missle> missles = new ArrayList<Missle>();
ArrayList<Asteroid> asteroids = new ArrayList<Asteroid>();

float NUM_ASTEROIDS = 10;

void setup() {
  size(700, 700);
  rocket = new Rocket();

  for (int i = 0; i < NUM_ASTEROIDS; i++) {
    asteroids.add(new Asteroid());
  }
}

void draw() {
  background(0);
  
  for (int i = 0; i < asteroids.size(); i++) {
    Asteroid asteroid = asteroids.get(i);
    asteroid.update();
    asteroid.contain();
    asteroid.render();
  }
  
  for (int i = 0; i < missles.size(); i++) {
    Missle missle = missles.get(i);
    missle.update();
    missle.render();
  }
  
  rocket.turn();
  rocket.move();
  rocket.contain();
  rocket.render();
}

void keyReleased() {
  rocket.setRotation(0.0);
}

void keyPressed() {  
  if (keyCode == LEFT) {
    rocket.setRotation(-0.1);
  }
  
  if (keyCode == RIGHT) {
    rocket.setRotation(0.1);
  }
  
  if (keyCode == UP) {
    rocket.thrust();
  }
  
  if (keyCode == TAB) {
    fire();
  }
}

void fire() {
  missles.add(new Missle(rocket));
}
