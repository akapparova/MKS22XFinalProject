import fisica.*;

FWorld world;
FBox goal;
FBox gooCounter;

void setup(){
  size(800,500);
  smooth();
  Fisica.init(this); //what does this do!
  world = new FWorld();
  world.setGravity(0,799);
  world.setEdges();
  world.remove(world.top);

  goal = new FBox(100,50);
  goal.setPosition(300,height-450);
  goal.setStatic(true);
  goal.setFill(10,150,10);
  goal.setGrabbable(false);
  world.add(goal);
  
  gooCounter = new FBox (50,50);
  gooCounter.setPosition(750, height - 50);
  gooCounter.setStatic(true);
  gooCounter.setGrabbable(false);
  textSize(24);
  text("10",725,475);
  fill(0,102,153,51);
  world.add(gooCounter);

    Goo a = new Goo(true);
    Goo b = new Goo(true);
    Goo c = new Goo(true);

    a.setPosition(400,height-20); //testing branching
    
    b.setPosition(200,height-20);
    

    world.add(a.getShape());
    world.add(b.getShape());
    world.add(c.getShape());
    
    c.setPosition(300,height-200);
    c.setStatic(true);
    a.setStatic(true);
    b.setStatic(true);
    a.setGrabbable(false);
    b.setGrabbable(false);
    c.setGrabbable(false);




    FDistanceJoint aB = new FDistanceJoint(a.getShape(), b.getShape());
    aB.setLength(60);
    aB.setStroke(0);
    aB.setFill(#F5B502);
    aB.setStrokeColor(#F5B502);
    aB.setDrawable(true);
    aB.setFrequency(0.001);
    world.add(aB);
    
    FDistanceJoint bC = new FDistanceJoint(c.getShape(), b.getShape());
    bC.setLength(60);
    bC.setStroke(0);
    bC.setFill(#F5B502);
    bC.setStrokeColor(#F5B502);
    bC.setDrawable(true);
    bC.setFrequency(0.001);
    world.add(bC);
    
    FDistanceJoint aC = new FDistanceJoint(a.getShape(), c.getShape());
    aC.setLength(60);
    aC.setStroke(0);
    aC.setFill(#F5B502);
    aC.setStrokeColor(#F5B502);
    aC.setDrawable(true);
    aC.setFrequency(0.001);
    world.add(aC);
    
    FCompound start = new FCompound(); //connecting them all together into one shape

    /*
    
     start.addBody(a.getShape());
     start.addBody(b.getShape());
     start.addBody(c.getShape());
     world.add(start);
    */

    
}


void draw(){
  background(255);
  world.step();
  world.draw();
}