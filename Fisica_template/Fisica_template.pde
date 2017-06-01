import fisica.*;

FWorld world;

void setup(){
  size(500,500);
  smooth();
  Fisica.init(this);
  world = new FWorld();
  world.setGravity(0,800);
  world.setEdges();
  
    Goo a = new Goo(true);
    Goo b = new Goo(true);
    Goo c = new Goo(true);

    a.setPosition(200,height-400);
    
    b.setPosition(300,height-400);
    
    c.setPosition(250,height-500);
    
    FLine aB = new FLine(a.getX(), a.getY(), b.getX(), b.getY());
    FLine aC = new FLine(a.getX(), a.getY(), c.getX(), c.getY());
    FLine bC = new FLine(b.getX(), b.getY(), c.getX(), c.getY());

    
    FCompound start = new FCompound();
    
     start.addBody(a.getShape());
     start.addBody(b.getShape());
     start.addBody(c.getShape());
     start.addBody(aB);
     start.addBody(aC);
     start.addBody(bC);

     world.add(start);
        
/*    FRevoluteJoint l = new FRevoluteJoint(a,b);
    FRevoluteJoint m = new FRevoluteJoint(c,b);
    FRevoluteJoint n = new FRevoluteJoint(a,c);
    l.setReferenceAngle(0);
    m.setReferenceAngle(120);
    n.setReferenceAngle(60);


    world.add(l);
    world.add(m);
    world.add(n);
    */
}


void draw(){
  background(255);
  world.step();
  world.draw();
}