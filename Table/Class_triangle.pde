class Triangle{
  int ind;
  int player=0;
  int poz1=0,poz2=0;
  boolean out;
  int nr_p=0;
  float x,y;
  boolean selected;
  //selected=> triangle[poz1/2]
  Triangle(int x_,int ind_){
    x=x_;
    ind=ind_;
    if(ind<=12)
      y=15;
    else
      if(ind<=24)
        y=685;
      else
          y=350;
  }
  void display_t(){
    stroke(0);
    if(!selected)
      if(ind%2==1)
        fill(255);
      else
        fill(0);
    else
      fill(#D80000);
    if(ind<=12)
      triangle(x,y,x+70,y,x+35,y+300);
    else
      triangle(x,y,x+70,y,x+35,y-300);
  }
  void display_p(){//desi dim_imagine e 70, piesa are doar 60; restul e fundal
    int i,k=5,c=0;
    float Y;
    while(c<nr_p){
      Y=y-5;
      if((12<ind && ind<=24) || ind==26)
        Y-=60;
      if(ind<=12 || ind==25)    
        for(i=1;i<=(5-k);i++)
          Y+=30;
      else          
        for(i=1;i<=(5-k);i++)
          Y-=30;
      for(i=1;i<=k && c<nr_p;i++){
        c++;
        if(player==1)
          image(white_p,x,Y,70,70);
        else
          image(dark_p,x,Y,70,70);
        if(ind<=12 || ind==25)
          Y+=60;
        else
          Y-=60;
      }
      k--; 
    }
  }
  boolean press_t(){
    if(mousePressed && over_t())
      return true;
    return false;
  }
  boolean over_t(){
    if(ind<=12 && mouseX>=x && mouseX<=x+70 && mouseY>=y && mouseY<=y+300)// daca era y+60-*nr_p nu merge la pus piese pe triangle gol
        return true;
    else
      if(12<ind && ind<=24 && mouseX>=x && mouseX<=x+70 && mouseY<=y && mouseY>=y-300)
        return true;
    return false;
  } 
}
