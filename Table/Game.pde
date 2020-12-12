void start_(){
  button1.press_button();
  if(button1.pressed && !val1){
    dice1.get_val();
    val1=true;
    while(dice1.valoare==dice2.valoare && val2)
        dice1.get_val();
  }
  button2.press_button();
  if(button2.pressed && !val2){
    dice2.get_val();
    val2=true;
    while(dice1.valoare==dice2.valoare && val1)
      dice2.get_val();
  }
  button1.display();
  button2.display();
  if(val1 && val2){
      dice=true;
      started=true;
      if(dice1.valoare>dice2.valoare){
        player=1;
        button2.pressed=false;
      }
      else{
        player=2;
        button1.pressed=false;
      }
  }
}

void dice_(){
  button_pressed=false;
  if(player==1){
    button1.press_button();
    if(button1.pressed)
      button_pressed=true;
  }
    else{
    button2.press_button();
    if(button2.pressed)
      button_pressed=true;
  }
  if(button_pressed){
    dice=true;
    dice1.get_val();
    dice2.get_val();
    if(dice1.valoare!=dice2.valoare)
      dice1.moves=dice2.moves=1;
    else
      dice1.moves=dice2.moves=2;
  }
}

void ver_casa_plina(){
  int s=0;
  if(player==1){
    for(i=18;i<=24;i++)
      if(triangle[i].player==1)
        s+=triangle[i].nr_p;
    if(s==15-piese_out_p1)
      casa=true;
  }
  else{
    for(i=1;i<=6;i++)
      if(triangle[i].player==2)
        s+=triangle[i].nr_p;
    if(s==15-piese_out_p2)
      casa=true;
  }
}

void verif_moves(){
  posibil=false;
  for(i=1;i<=24;i++)
    if(triangle[i].player==player){
      triangle[i].out=false;
      triangle[i].poz1=triangle[i].poz2=0;
      if(verif_m())
        posibil=true;
    }
  if(casa)
    verif_moves_casa();
  verificat=true; 
}

boolean verif_m(){
  boolean ok=false;
  if(player==1 && dice1.moves>0 && i+dice1.valoare>=1 && i+dice1.valoare<=24 && 
  (triangle[i+dice1.valoare].player!=2 || (triangle[i+dice1.valoare].player==2 && triangle[i+dice1.valoare].nr_p==1))){
    triangle[i].poz1=i+dice1.valoare;
    ok=true;
  }
  if(player==1 && dice2.moves>0 && i+dice2.valoare>=1 && i+dice2.valoare<=24 && 
  (triangle[i+dice2.valoare].player!=2 || (triangle[i+dice2.valoare].player==2 && triangle[i+dice2.valoare].nr_p==1))){
    triangle[i].poz2=i+dice2.valoare;
    ok=true;
  }
  if(player==2 && dice1.moves>0 && i-dice1.valoare>=1 && i-dice1.valoare<=24 && 
  (triangle[i-dice1.valoare].player!=1 || (triangle[i-dice1.valoare].player==1 && triangle[i-dice1.valoare].nr_p==1))){
    triangle[i].poz1=i-dice1.valoare;
    ok=true;
  }
  if(player==2 && dice2.moves>0 && i-dice2.valoare>=1 && i-dice2.valoare<=24 && 
  (triangle[i-dice2.valoare].player!=1 || (triangle[i-dice2.valoare].player==1 && triangle[i-dice2.valoare].nr_p==1))){
    triangle[i].poz2=i-dice2.valoare;
    ok=true;
  }
  return ok;
}

void verif_moves_casa(){
  boolean c;
  exceptie_z1=exceptie_z2=false;
  if(player==1){
    if(dice1.moves>0)
      if(triangle[24-dice1.valoare+1].player==1){
        triangle[24-dice1.valoare+1].out=true;
        posibil=true;
      }
      else{
        c=true;
        for(i=24-dice1.valoare;i>=19;i--)
          if(triangle[i].player==1 && triangle[i].nr_p>0)
            c=false;
        if(c){
          posibil=true;
          exceptie_z1=true;
          while(triangle[i].player!=1)
            i++;
          triangle[i].out=true;
        }
      }
    if(dice2.moves>0)
      if(triangle[24-dice2.valoare+1].player==1){
        triangle[24-dice2.valoare+1].out=true;
        posibil=true;
      }
      else{
        c=true;
        for(i=24-dice2.valoare+1;i>=19;i--)
          if(triangle[i].player==1 && triangle[i].nr_p>0)
            c=false;
        if(c){
          posibil=true;
          exceptie_z2=true;
          while(triangle[i].player!=1)
            i++;
          triangle[i].out=true;
        }
      }
  }
  else{
    if(dice1.moves>0)
      if(triangle[dice1.valoare].player==2){
        triangle[dice1.valoare].out=true;
        posibil=true;
      }
    else{
      c=true;
      for(i=dice1.valoare+1;i<=6;i++)
        if(triangle[i].player==2 && triangle[i].nr_p>0)
          c=false;
      if(c){
        posibil=true;
        exceptie_z1=true;
        while(triangle[i].player!=2)
          i--;
        triangle[i].out=true;
      }
    }
    if(dice2.moves>0)
      if(triangle[dice2.valoare].player==2){
        triangle[dice2.valoare].out=true;
        posibil=true;
      }
      else{
        c=true;
        for(i=dice2.valoare+1;i<=6;i++)
          if(triangle[i].player==2 && triangle[i].nr_p>0)
            c=false;
        if(c){
          exceptie_z2=true;
          posibil=true;
          while(triangle[i].player!=2)
            i--;
          triangle[i].out=true;
        }
      }
  }
}

void switch_player(){
  dice=false;
  verificat=posibil=false;
  triangle_pressed=false;
  if(player==1){
    player=2;
    button2.pressed=false;
  }
  else{
    player=1;
    button1.pressed=false;
  }
}

void verif_t_pressed(){
  for(i=1;i<=24 && !triangle_pressed;i++)
    if(triangle[i].player==player)
      if(triangle[i].press_t()){
        triangle_pressed=true;
        triangle_pressed_val=i;
        triangle[i].selected=true;
        triangle[i].nr_p--;
        if(triangle[i].nr_p==0)
          triangle[i].player=0;
        if(triangle[i].poz1>0)
          triangle[triangle[i].poz1].selected=true;
        if(triangle[i].poz2>0)
          triangle[triangle[i].poz2].selected=true;
        if(triangle[i].out)
          out=true;
      }
}

void move_p(){
  if(player==1)
    image(white_p,mouseX-35,mouseY-35,70,70);
  else
    image(dark_p,mouseX-35,mouseY-35,70,70);
  boolean move;
  if(!mousePressed)
    if(!casa || !over_casa()){
      move=false;
      out=false;
      for(i=1;i<=24 && !move;i++)
        if(triangle[i].selected && triangle[i].over_t() && i!=triangle_pressed_val ){
          move=true;
          verificat=false;
          if(triangle[i].nr_p==1 && triangle[i].player!=player){
            triangle[i].nr_p--;
            if(player==1)
              triangle[25].nr_p++;
            else
              triangle[26].nr_p++;
          }
          triangle[i].nr_p++;
          triangle[i].player=player;
          if(i==triangle[triangle_pressed_val].poz1)
            dice1.moves--;
          else
            if(i==triangle[triangle_pressed_val].poz2)
              dice2.moves--;
          if(dice1.moves+dice2.moves==0)
            switch_player();
        }
      if(!move){
        triangle[triangle_pressed_val].nr_p++;
        triangle[triangle_pressed_val].player=player;
      }
      triangle_pressed=false;
      triangle[triangle_pressed_val].selected=false;
      if(triangle[triangle_pressed_val].poz1>0)//fara if=> error Null
        triangle[triangle[triangle_pressed_val].poz1].selected=false;
      if(triangle[triangle_pressed_val].poz2>0)
        triangle[triangle[triangle_pressed_val].poz2].selected=false;
    }
    else{
      move=false;
      if(triangle[triangle_pressed_val].out==true){
        verificat=false;
        move=true;
        if(player==1){
          piese_out_p1++;
          if((triangle_pressed_val==24-dice1.valoare+1 || exceptie_z1) && dice1.moves>0)//>0 pt duble
            dice1.moves--;
          else
            if((triangle_pressed_val==24-dice2.valoare+1 || exceptie_z2) && dice2.moves>0)
              dice2.moves--;
        }
        else{
          piese_out_p2++;
          if((triangle_pressed_val==dice1.valoare || exceptie_z1) && dice1.moves>0)
            dice1.moves--;
          else
            if((triangle_pressed_val==dice2.valoare || exceptie_z2) && dice2.moves>0)
              dice2.moves--;
        }
        if(dice1.moves+dice2.moves==0)
          switch_player(); 
        end_game();
      }
      if(!move){
        triangle[triangle_pressed_val].nr_p++;
        triangle[triangle_pressed_val].player=player;
      }
      out=false;
      casa=false;//se schimba jucatorul; sau ar ramane jucatorul mereu cu casa=true
      triangle_pressed=false;
      triangle[triangle_pressed_val].selected=false;
      if(triangle[triangle_pressed_val].poz1>0)//fara if=> error Null
        triangle[triangle[triangle_pressed_val].poz1].selected=false;
      if(triangle[triangle_pressed_val].poz2>0)
        triangle[triangle[triangle_pressed_val].poz2].selected=false;
    }  
}

boolean over_casa(){
  if(mouseX>=465 && mouseX<=885 && mouseY>=315 && mouseY<=385)
    return true;
  return false;
}

void end_game(){
  if(piese_out_p1==15){
    triangle[triangle_pressed_val].selected=out=false;
    dice1.moves=dice2.moves=0;
    Display();
    fill(0);
    textSize(60);
    text("Alb a câștigat!",470,370);
    noLoop();
  }
  else
    if(piese_out_p2==15){
      triangle[triangle_pressed_val].selected=out=false;
      dice1.moves=dice2.moves=0;
      Display();
      fill(0);
      textSize(52);
      text("Negru a câștigat",470,370);
      noLoop();
    }
}

void verif_moves_p_c(){
  posibil=false;
  if(player==1){
    triangle[26].poz1=triangle[26].poz2=0;
    if(dice1.moves>0 && triangle[dice1.valoare].player!=2 || (triangle[dice1.valoare].player==2 && triangle[dice1.valoare].nr_p==1)){
      posibil=true;
      triangle[26].poz1=dice1.valoare;
    }
    if(dice2.moves>0 && triangle[dice2.valoare].player!=2 || (triangle[dice2.valoare].player==2 && triangle[dice2.valoare].nr_p==1)){
      posibil=true;
      triangle[26].poz2=dice2.valoare;
    }
  }
  else{
    triangle[25].poz1=triangle[25].poz2=0;
    if(dice1.moves>0 && 
    triangle[24-dice1.valoare+1].player!=1 || (triangle[24-dice1.valoare+1].player==1 && triangle[24-dice1.valoare+1].nr_p==1)){
       posibil=true;
       triangle[25].poz1=24-dice1.valoare+1;
    }
    if(dice2.moves>0 && 
    triangle[24-dice2.valoare+1].player!=1 || (triangle[24-dice2.valoare+1].player==1 && triangle[24-dice2.valoare+1].nr_p==1)){
       posibil=true;
       triangle[25].poz2=24-dice2.valoare+1;
    }
  }
  verificat=true;
}

void verif_t_pressed_p_c(){
  if(player==1 && mousePressed && 
  mouseX>=430 && mouseX<=470 && mouseY<=triangle[26].y && mouseY>=triangle[26].y-60*triangle[26].nr_p && mouseY>=triangle[26].y-60*5){
    triangle[26].nr_p--;
    triangle_pressed=true;
    triangle_pressed_val=26;
    triangle[26].selected=true;
    if(triangle[26].poz1>0)
      triangle[triangle[26].poz1].selected=true;
    if(triangle[26].poz2>0)  
      triangle[triangle[26].poz2].selected=true;
  }
  else
    if(player==2 && mousePressed &&
    mouseX>=430 && mouseX<470 && mouseY>=triangle[25].y && mouseY<=triangle[25].y+60*triangle[25].nr_p && mouseY<=triangle[25].y+60*5){
      triangle[25].nr_p--;
      triangle_pressed=true;
      triangle_pressed_val=25;
      triangle[25].selected=true;
      if(triangle[25].poz1>0)
        triangle[triangle[25].poz1].selected=true;
      if(triangle[25].poz2>0)
        triangle[triangle[25].poz2].selected=true;
    }
}
