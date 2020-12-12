void Display(){
  image(backg,0,0,900,700);
  fill(100);
  rect(0,0,15,height);
  rect(15+420,0,30,height);
  rect(900-15,0,15,height);
  rect(0,0,width,15);
  rect(0,700-15,width,15);
  line(450,15,450,height-15);
  display_casa();
  display_t();
  display_p();
  dice1.display();
  dice2.display();
  cursor_();
}

void display_t(){
  for(int i=1;i<=24;i++)
    triangle[i].display_t();
}

void display_p(){
  for(int i=1;i<=26;i++)
    triangle[i].display_p();
}

void display_casa(){
  if(out && triangle_pressed){
    fill(#D80000);
    rect(465,315,420,70);
  }
}

void cursor_(){
  //if(!dice)
    if(((player==1 || !started) && button1.over_button() && !button1.pressed) || 
    ((player==2 || !started) && button2.over_button() && !button2.pressed))
      cursor(HAND);
    else
      cursor(ARROW);
}

boolean z,x,c;
void keyPressed(){
  if(key=='z')
    z=true;
  else
    if(key=='x')
      x=true;
    else
      if(key=='c')
        c=true;
  if(z && x && c){
    //dice1.get_val();
    //dice2.valoare=dice1.valoare;
    dice2.valoare=dice1.valoare=6;
    dice1.moves=dice2.moves=2;
    z=x=c=false;
    verif_moves();
  }
}
