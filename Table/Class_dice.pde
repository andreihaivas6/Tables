class Dice{
  int valoare;
  int moves;
  float x,y=325;
  Dice(){}
  void display(){
    if(started && posibil){
      noStroke();
      if(moves==1){
        fill(#FFF700);
        rect(x-5,y-5,60,60);
      }
      else
        if(moves==2){
          fill(#FFBC00);
          rect(x-5,y-5,60,60);
        }
    }
    fill(255);
    rect(x+1,y+1,50-2,50-2);
    image(dice_im[valoare],x,y,50,50);
  }
  void get_val(){
    valoare=(int)random(6)+1;
  }
}
