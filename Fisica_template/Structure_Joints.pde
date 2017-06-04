class Structure_Joints {
  ArrayList<FDistanceJoint> js;

  public Structure_Joints() {
    js = new ArrayList<FDistanceJoint>();
  }

  public void add(FDistanceJoint x) {
    js.add(x);
  }

  public void checkJoints() {
    for (FDistanceJoint y : js) {
      if (dist(y.getAnchor1X(), y.getAnchor1Y(), y.getAnchor2X(), y.getAnchor2X()) > 400) {
        println(y.getAnchor1X() + " " + y.getAnchor2X());
        y.removeFromWorld();
      }
    }
  }
  
 /* public void doesNotHave(FDistanceJoint x){
  }*/
}