import fisica.*; //<>//

FWorld world;
FBox goal;
FCircle mouse;
Structure start;
Structure_Joints start_Joints;

void setup() {
  size(800, 500);
  smooth();
  Fisica.init(this);
  world = new FWorld();
  world.setGravity(0, 799);
  world.setEdges();
  world.remove(world.top);
  //
  goal = new FBox(100, 50);
  goal.setPosition(300, height-450);
  goal.setStatic(true);
  goal.setFill(10, 150, 10);
  goal.setGrabbable(false);
  world.add(goal);
  //
  mouse = new FCircle(200);
  world.add(mouse);
  //
  start = new Structure();
  start_Joints = new Structure_Joints();
  //
  Goo a = new Goo(true);
  Goo b = new Goo(true);
  Goo c = new Goo(true);
  a.setPosition(400, height-20); 
  b.setPosition(200, height-20);
  c.setPosition(300, height-200);
  world.add(a.getShape());
  world.add(b.getShape());
  world.add(c.getShape());
  c.setStatic(true);
  a.setStatic(true);
  b.setStatic(true);
  a.setGrabbable(false);
  b.setGrabbable(false);
  c.setGrabbable(false);
  start.add(a);
  start.add(b);
  start.add(c);
  //
  FDistanceJoint aB = new FDistanceJoint(a.getShape(), b.getShape());
  aB.setLength(60);
  aB.setStroke(0);
  aB.setFill(#F5B502);
  aB.setStrokeColor(#F5B502);
  aB.setDrawable(true);
  aB.setFrequency(0.001);
  world.add(aB);
  //  
  FDistanceJoint bC = new FDistanceJoint(c.getShape(), b.getShape());
  bC.setLength(60);
  bC.setStroke(0);
  bC.setFill(#F5B502);
  bC.setStrokeColor(#F5B502);
  bC.setDrawable(true);
  bC.setFrequency(0.001);
  world.add(bC);
  //
  FDistanceJoint aC = new FDistanceJoint(a.getShape(), c.getShape());
  aC.setLength(60);
  aC.setStroke(0);
  aC.setFill(#F5B502);
  aC.setStrokeColor(#F5B502);
  aC.setDrawable(true);
  aC.setFrequency(0.001);
  world.add(aC);


  /*
     start = new FCompound();   
   start.addBody(a.getShape());
   start.addBody(b.getShape());
   start.addBody(c.getShape());
   world.add(start);
   */
}


void draw() {
  background(255);
  world.step();
  world.draw();
  mouse.setPosition(mouseX, mouseY);
  //
  FDistanceJoint aC;
  if (start.getTouching(mouse) != null) {
    println(start.getTouching(mouse));
    aC = new FDistanceJoint(mouse, start.getTouching(mouse));
    aC.setLength(60);
    aC.setStroke(0);
    aC.setFill(#F5B502);
    aC.setStrokeColor(#F5B502);
    aC.setDrawable(true);
    aC.setFrequency(0.001);
    start_Joints.add(aC);
    world.add(aC);
  }
  start_Joints.checkJoints();
  //
}


public void addGoo() {
}