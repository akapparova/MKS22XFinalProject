import fisica.*; //<>// //<>//

FWorld world;
FBox goal;
FBox onLevel;
FCircle mouse;
Structure start;
Structure_Joints start_Joints;
Goo b;
int level = 0;

public void setLevel(){
  if(level < 2){
    level++;
  }
}

void setup() {
  size(1000, 600);
  smooth();
  Fisica.init(this);
  world = new FWorld();
  world.setGravity(0, 800);
  world.setEdges();
  world.remove(world.top);
  world.remove(world.left);
  world.remove(world.right);
  //
  goal = new FBox(100, 50);
  goal.setPosition(300, height-450);
  goal.setStatic(true);
  goal.setFill(10, 150, 10);
  goal.setGrabbable(false);
  world.add(goal);
  //
  mouse = new FCircle(20);
  world.add(mouse);
  //
  onLevel = new FBox (50,50);
  //onLevel.setPosition(
  //
  start = new Structure();
  start_Joints = new Structure_Joints();
  //
  Goo a = new Goo(true);
  b = new Goo(true);//
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
  FDistanceJoint1 aB = new FDistanceJoint1(a.getShape(), b.getShape());
  aB.setLength(60);
  aB.setStroke(0);
  aB.setFill(#F5B502);
  aB.setStrokeColor(#F5B502);
  aB.setDrawable(true);
  aB.setFrequency(0.001);
  world.add(aB.x);
  //  
  FDistanceJoint1 bC = new FDistanceJoint1(c.getShape(), b.getShape());
  bC.setLength(60);
  bC.setStroke(0);
  bC.setFill(#F5B502);
  bC.setStrokeColor(#F5B502);
  bC.setDrawable(true);
  bC.setFrequency(0.001);
  world.add(bC.x);
  //
  FDistanceJoint1 aC = new FDistanceJoint1(a.getShape(), c.getShape());
  aC.setLength(60);
  aC.setStroke(0);
  aC.setFill(#F5B502);
  aC.setStrokeColor(#F5B502);
  aC.setDrawable(true);
  aC.setFrequency(0.001);
  world.add(aC.x);


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
  FDistanceJoint1 aC;
  if (start.getTouching(mouse) != null && start.getTouching(mouse).connected && start_Joints.js.size() < 2) {
    aC = new FDistanceJoint1(mouse, start.getTouching(mouse).getShape());

   if (start_Joints.doesNotHave(aC)){
      aC.setLength(60);
      aC.setStroke(0);
      aC.setFill(#F5B502);
      aC.setStrokeColor(#F5B502);
      aC.setDrawable(true);
      aC.setFrequency(0.00000001);
      start_Joints.add(aC);
      world.add(aC.x);
      //println(aC.getBody1());
   }
  }
  start_Joints.checkJoints();
  
  if(start.reachedGoal(goal)){
    setLevel();
  }
}


public Goo addGoo(float x, float y) {
  Goo g = new Goo(false);
  g.setPosition(x, y);
  world.add(g.getShape());
  g.setGrabbable(false);
  start.add(g);
  return g;
}

void keyReleased() {
  if (key == 'G' || key == 'g') {
    // try{
    Goo x = addGoo(mouseX, mouseY);
    /*
    FDistanceJoint1 aC = new FDistanceJoint1(x.getShape(), start.getTouching(mouse).getShape());
     aC.setLength(60);
     aC.setStroke(0);
     aC.setFill(#F5B502);
     aC.setStrokeColor(#F5B502);
     aC.setDrawable(true);
     aC.setFrequency(1);
     start_Joints.add(aC);
     world.add(aC);
     }
     catch(NullPointerException e){}*/
    try {
      FConstantVolumeJoint aC = new FConstantVolumeJoint();
      aC.setStrokeColor(#F5B502);
      aC.addBody(x.getShape());
      aC.addBody(start_Joints.js.get(0).getBody2());
      aC.addBody(start_Joints.js.get(1).getBody2());      /////////////////CHANGE THIS!!!!!!!!!!!!!!!!!!!!!!!!
      world.add(aC);
      x.connected = true;
    }
    catch(NullPointerException e) {
    }
  }
}