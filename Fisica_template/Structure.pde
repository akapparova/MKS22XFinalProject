class Structure {
  ArrayList<Goo> gooo;

  public Structure() {
    gooo = new ArrayList<Goo>();
  }

  public void add(Goo x) {
    gooo.add(x);
  }

  public Goo getTouching(FBody x) {
    Goo ans = null;
    boolean f = false;
    for (Goo y : gooo) {
      if (y.getShape().isTouchingBody(x)) {
        ans = y;
        x.setFill(20, 40, 20);
        f = true;
      }
    }
    if (!f) {
      x.setFill(1000, 1000, 1000);
    }
    return ans;
  }

  public boolean reachedGoal(FBox reached) {
    boolean ans = false;
    for (Goo g : gooo) {
      if (g.isTouchingBody(reached)) {
        ans = true;
      }
    }
    return ans;
  }
  
  public int size(){
    return gooo.size();
  }
  
  public Goo get(int x){
    return gooo.get(x);
  }
}