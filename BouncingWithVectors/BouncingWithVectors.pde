//declare variables

int count = 3000;
PVector[] loc = new PVector [count];
float []diam = new float [count];
PVector[] vel = new PVector [count];
float []x = new float [count];
float [] g = new float [count];

void setup() {
  //set size of canvas
  frameRate(150);
  size(800, 600);
  for (int i=0; i < count; i++) {
    //initialize variables
    loc[i] = new PVector(width/2, height/2); 
    diam[i] = random(4, 6);
    vel[i] = PVector.random2D();
    g[i] = PVector.2D(0,1);
  }
}

void draw() {
  //draw background to cover previous frame
  background(0);
  for (int i=0; i < count; i++) {
    //draw ball
    fill(255, 0, 0);
    ellipse(loc[i].x, loc[i].y, diam[i], diam[i]);

    //add velocity to position
    //loc.x += vel.x;
    //loc.y += vel.y;
    loc[i].add(vel[i]);  
    //bounce ball if it hits walls
    if (loc[i].x + diam[i]/2 >= width) {
      vel[i].x = -abs(vel[i].x);    //if the ball hits the right wall, assign x velocity the negative version of itself
      
    } else if (loc[i].x - diam[i]/2 <= 0) {
      vel[i].x = abs(vel[i].x);     //if the ball hits the left wall, assign x velocity the positive version of itself
    }
    if (loc[i].y + diam[i]/2 >= height) {
      vel[i].y = -abs(vel[i].y);
    } else if (loc[i].y - diam[i]/2 <= 0) {
      vel[i].y = abs(vel[i].y);
    }
  }
}