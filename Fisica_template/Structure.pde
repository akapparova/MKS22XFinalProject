class Structure {
  ArrayList<Goo> gooo;

  public Structure() {
    gooo = new ArrayList<Goo>();
  }

  public void add(Goo x) {
    gooo.add(x);
  }

  public FBody getTouching(FBody x) {
    FBody ans = null;
    boolean f = false;
    for (Goo y : gooo) {
      if (y.getShape().isTouchingBody(x)) {
        ans = y.getShape();
        x.setFill(20,40,20);
        f = true;
      }
    }
    if(!f){
      x.setFill(1000,1000,1000);
    }
    return ans;
  }
  
}