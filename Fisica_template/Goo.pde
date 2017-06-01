public class Goo extends FBody{
  FCircle shape;
  boolean connected;
  boolean start;
  
  public Goo(){
      shape = new FCircle(40);
      connected = false;
      start = false;
  }
  
  public Goo(FCircle circle){
      shape = circle;
      connected = false;
      start = false;
  }
  
  public Goo(boolean bool){
      shape = new FCircle(40);
      connected = bool;
      start = true;
  }
  
  void draw(){
  }
  
  /*
  boolean checkTouching(){
    ArrayList<FBody> x = shape.getTouching();
    boolean ans = false;
    FBody n = null;
 
   for(FCircle y:x){
     if(y.
   }
  }
  */
  
  public boolean getConn(){
    return this.connected;
  }
  
  public FCircle getShape(){
    return shape;
  }
  
  public void setPosition(float x, float y){
    shape.setPosition(x,y);
  }
  
  public float getX(){
    return shape.getX();
  }
  
  public float getY(){
    return shape.getY();
  }
  
  public void setStatic(boolean bool){
    shape.setStatic(bool);
  }
  
}