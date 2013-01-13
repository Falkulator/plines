
ArrayList beans;
boolean toggleRun;

void setup() {
    size(1024, 900);
    beans = new ArrayList;
    b = new Bean(0, 0);
    beans.add(b);

    background(0);
}

void draw() {
//    fill(0, 1);
//    rect(0, 0, width, height);
//    strokeWeight(4);

    if (toggleRun) return;
    colorMode(HSB, 360, 100, 100);
    for (i = 0; i < beans.size(); i++) {
        stroke(beans.get(i).r, 100, 100, beans.get(i).f);
//        stroke(beans.get(i).r, beans.get(i).g, beans.get(i).b, 15);
        line(beans.get(i).x1, beans.get(i).y1, beans.get(i).x2 , beans.get(i).y2);
        beans.get(i).move();
    }
}

void mousePressed() {
  if (mouseButton == LEFT) {
     toggleRun = !toggleRun;
  }
}

class Bean {

    Bean(xo, yo) {
        this.x = 00;
        this.y = 00;
        this.r = 200;
        this.g = 0;
        this.b = 0;
        this.f = 25;
        this.xoff = xo;
        this.yoff = yo;
    }
    
    void move() {
        this.xoff += .0006;
        this.yoff += .0008;
        yoff1 = this.yoff + 200;
        xoff1 = this.xoff + 2000;
        noiseDetail(4, .65);
        n1 = map(noise(this.xoff), 0.5, 1, 0, width);
        this.x1 = n1;
        n2 = map(noise(xoff1), 0.5, 1, 0, width);
        this.x2 = n2;
        n3 = map(noise(this.yoff), 0.5, 1, 0, height);
        this.y1 = n3;
        n4 = map(noise(yoff1), 0.5, 1, 0, height);
        this.y2 = n4;
        
        this.r = map(noise(this.xoff), 0.5, 1, 1, 360);
        this.g = map(noise(yoff1), 0.5, 1, 0, 255);
        this.b = map(noise(xoff1), 0.5, 1, 0, 255);
    }
    
    
}
