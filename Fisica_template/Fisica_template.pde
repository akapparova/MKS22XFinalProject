import fisica.*;

FWorld world;

void setup(){
  size(500,500);
  smooth();
  Fisica.init(this); //what does this do!
  world = new FWorld();
  world.setGravity(0,800);
  world.setEdges();
  
    Goo a = new Goo(true);
    Goo b = new Goo(true);
    Goo c = new Goo(true);

    a.setPosition(200,height-400);
    
    b.setPosition(300,height-400);
    
    c.setStatic(true);
    c.setPosition(250,height-500);

    /*
    FLine aB = new FLine(a.getX(), a.getY(), b.getX(), b.getY());
    FLine aC = new FLine(a.getX(), a.getY(), c.getX(), c.getY());
    FLine bC = new FLine(b.getX(), b.getY(), c.getX(), c.getY());
*/

    world.add(a.getShape());
    world.add(b.getShape());
    world.add(c.getShape());

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