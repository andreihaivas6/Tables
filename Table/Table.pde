Triangle[] triangle=new Triangle[27]; //<>//
Dice dice1,dice2;
Button button1,button2;
PImage backg;
PImage dark_p,white_p;
PImage[] dice_im=new PImage[7];
boolean started,val1,val2;
boolean verificat,posibil;
boolean dice,triangle_pressed;
boolean button_pressed;
boolean casa,out;
int triangle_pressed_val;
int player;
int i,j;
int piese_out_p1=0,piese_out_p2=0;
boolean exceptie_z1,exceptie_z2;
void setup(){
  size(900,700);
  load_images();
  Init();
}
void draw(){
  Display();
  if(!started)
    start_();
  else{
    if(player==1)
      button1.display();
    else
      button2.display();
    if(!dice)
      dice_();
    else
      if((player==1 && triangle[26].nr_p==0) || (player==2 && triangle[25].nr_p==0)){
        ver_casa_plina();
        if(!verificat)
          verif_moves();
        else
          if(!posibil)
            switch_player();
          else
            if(!triangle_pressed)
              verif_t_pressed();
            else
              move_p();
      }
      else
        if(!verificat)
          verif_moves_p_c();//piece_captured
        else
          if(!posibil)
            switch_player();
          else
            if(!triangle_pressed)
              verif_t_pressed_p_c();
            else
              move_p();
  }
}
