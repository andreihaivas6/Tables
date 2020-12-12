void load_images(){
  backg=loadImage("fundal.jpg");
  dark_p=loadImage("piece_d.png");
  white_p=loadImage("piece_w.png");
  for(int i=1;i<=6;i++)
    dice_im[i]=loadImage("dice"+i+".png");
}

void Init(){
  init_t();
  init_d();
  init_b();
}

void init_t(){
  int i,x=885;
  for(i=1;i<=12;i++){
    x-=70;
    triangle[i]=new Triangle(x,i);
    if(i==6)
      x-=30;
  }
  x=15;
  for(i=13;i<=24;i++){
    triangle[i]=new Triangle(x,i);
    x+=70;
    if(i==18)
      x+=30;
  }
  triangle[1].player=1;
  triangle[12].player=1;
  triangle[17].player=1;
  triangle[19].player=1;
  triangle[1].nr_p=2;
  triangle[17].nr_p=3;
  triangle[12].nr_p=triangle[19].nr_p=5;

  triangle[24].player=2;
  triangle[13].player=2;
  triangle[8].player=2;
  triangle[6].player=2;
  triangle[24].nr_p=2;
  triangle[8].nr_p=3;
  triangle[6].nr_p=triangle[13].nr_p=5;
  
  triangle[25]=new Triangle(450-35,25);
  triangle[26]=new Triangle(450-35,26);
  triangle[25].player=2; // ==25- piese(p2) mancate de alb(p1) -jos
  triangle[26].player=1; // ==26- piese(p1) mancate de negru(p2)-sus
}

void init_d(){
  dice1=new Dice();
  dice2=new Dice();
  dice1.x=160;
  dice2.x=230;
  dice1.get_val();
  dice2.get_val();
  dice1.moves=dice2.moves=1;
}

void init_b(){
  button1=new Button(1);
  button2=new Button(2);
  button1.x=70;
  button2.x=310;
}
