class Structure_Joints {
  ArrayList<FDistanceJoint> js;

  public Structure_Joints() {
    js = new ArrayList<FDistanceJoint>();
  }

  public void add(FDistanceJoint x) {
    js.add(x);
    println(js.size());
  }

  public void checkJoints() {
    ArrayList<FDistanceJoint> rem = new ArrayList<FDistanceJoint>();
    for (FDistanceJoint y : js) {
      if (dist(y.getAnchor1X(), y.getAnchor1Y(), y.getAnchor2X(), y.getAnchor2X()) > 300) {
        rem.add(y);
        y.removeFromWorld();
      }
    }
    if (rem.size() != 0) {
      for (FDistanceJoint y : rem) {
        js.remove(y);
        js.trimToSize();
      }
    }
  }
}