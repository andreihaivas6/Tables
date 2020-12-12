class Button{
  int ind;
  float x,y=320;
  boolean pressed=false;
  Button(int ind_){
    ind=ind_;
  }
  void display(){
    if(over_button() && !pressed)
      if(ind==1)
        fill(205);
      else
        fill(55);
    else
      if(ind==1)
        fill(255);
      else
        fill(0);
    stroke(0);
    rect(x,y,60,60);
    textSize(20);
    if(ind==1)
      fill(0);
    else
      fill(255);
    if(!pressed){
      text("Dă cu",x+3,y+22);
      text("zarul",x+6,y+49);
    }
    else
      if(started){
        if(player==1)
          text("Alb",x+14,y+22);
        else
          text("Negru",x+1,y+22);
        text("mută",x+6,y+49);
      }
      else{
        textSize(40);
        text("...",x+11,y+45);
      }
  }
  void press_button(){//e nevoie de ambele butoane apasate in start_()
    if(mousePressed && over_button() && !pressed)
      pressed=true;
  }
  boolean over_button(){
    if(mouseX>=x && mouseX<=x+60 && mouseY>=y && mouseY<=y+60)
      return true;
    return false;
  }
}
