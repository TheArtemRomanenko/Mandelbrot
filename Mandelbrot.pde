complexNum[][] complexPlane;
float threshold;
int steps;

void setup(){
  float scale = height/2;
  size(750,500);
  background(color(0));
  
  complexPlane = new complexNum[height][width];
  for(int y = 0; y < height; y++){
    for(int x = 0; x < width; x++){
      complexPlane[y][x] = new complexNum( (y-scale)/scale , (x-2*scale)/scale );
    }
  }
  threshold = 2;
  steps = 0;
}

class complexNum{
  double a; double b;
  double Ca; double Cb;
  
  complexNum(double Ca, double Cb){
    this.Ca = Ca; this.Cb = Cb;
    a = 0; b = 0;
  }
  
  void iterate(){
    double Ta = a; double Tb = b;
    Ta = 2*a*b+Ca;
    Tb = pow((float)b,2)-pow((float)a,2)+Cb;
    
    a = Ta;
    b = Tb;
  }
}

void mousePressed(){
  steps++;
  for(int y = 0; y < height; y++){
    for(int x = 0; x < width; x++){
      complexPlane[y][x].iterate();
    }
  }
  
  textSize(40);
  fill(255);
  //text("steps: "+steps,0,40);
  
  //colorMode(HSB,100);
  //stroke(color((steps*7)%100,100,100));
  if(steps%2 == 0){
    stroke(color(0));
  } else{
    stroke(color(255));
  }
  
  for(int y = 0; y < height; y++){
    for(int x = 0; x < width; x++){
      if(sqrt( pow((float)complexPlane[y][x].a,2) + pow((float)complexPlane[y][x].b,2) ) < threshold){
        line(x,y,x,y);
      }
    }
  }
}

void draw(){
  //background(color(0));
  
}