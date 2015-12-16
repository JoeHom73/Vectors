//declare variables
int count = 50000;
int colors = 0;
PVector []acc = new PVector [count];
PVector[] loc = new PVector [count];
float []diam = new float [count];
PVector[] vel = new PVector [count];

//float []x = new float [count];
void setup() {
  //set size of canvas

  size(1000, 800);
  for (int i=0; i < count; i++) {
    //initialize variables
    loc[i] = new PVector(width/2, height/2); 
    diam[i] = .5;
    vel[i] =PVector.random2D();
    vel[i].mult(1); 
    acc[i] = PVector.random2D();
    acc[i].mult(.001); 
    background(0, 0, 0, 10);
    colorMode(HSB, 360, 100, 100, 100);
  }
}

void draw() {
  //draw background to cover previous frame
  // background(0, 0,0, 10);
     fill(0,3);
  rect(0,0,width,height);
  //  background(0);
  for (int i=0; i < count; i++) {
    //draw ball

    
     fill(frameCount%360, 100, 100, 100);
    acc[i] = PVector.random2D();
    acc[i].mult(.3); 
    vel[i].add(acc[i]); 
    noStroke();
    //.  fill(random(255), random(255), random(255));
    //vel[i] = PVector.random2D().mult(random(8));
    ellipse(loc[i].x, loc[i].y, diam[i], diam[i]);

    //add velocity to position
    loc[i].add(vel[i]); 
    vel[i].limit(1.5);

    //wrap the ball's position

    if (loc[i].x >= width) {
      loc[i].x = width/2;    //if the ball hits the right wall go to left wall
      loc[i].y = height/2 ;
    } else if (loc[i].x <= 0) {
      loc[i].x = width/2;     //if the ball hits the left wall go to right wall
      loc[i].y = height/2 ;
    }
    if (loc[i].y >= height) {
      loc[i].y = height/2;
      loc[i].x = width/2;
    } else if (loc[i].y <= 0) {
      loc[i].y = height/2 ;
      loc[i].x = width/2;
    }
  }
}