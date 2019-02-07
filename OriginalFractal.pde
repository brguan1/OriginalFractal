int x = 150;
int y = 550;
int len = 300;
boolean moveOne = false;
boolean moveTwo = false;
boolean moveThree = false;
boolean moveFour = false;
boolean moveFast = false;
public void setup()
{
	size(600,600);
	background(0);
}

public void draw()
{
	fractal(x,y,len);
		if(moveOne == true){y--;}
	if(moveOne == true && moveFast == true){y-=10;}
	if(moveFast == true && moveOne == true){y-=10;}
	if(moveTwo == true){x--;}
	if(moveTwo == true && moveFast == true){x-=10;}
	if(moveFast == true && moveTwo == true){x-=10;}
	if(moveThree == true){y++;}
	if(moveThree == true && moveFast == true){y+=10;}
	if(moveFast == true && moveThree == true){y+=10;}
	if(moveFour == true){x++;}
	if(moveFour == true && moveFast == true){x+=10;}
	if(moveFast == true && moveFour == true){x+=10;}
}

public void mouseDragged(){
x = mouseX-len/2;
y=mouseY+len-len/4;
}
public void keyPressed(){
	if(key=='q'){background(0);}
	if(key=='w'){moveOne = true;}
	if(keyCode==SHIFT){moveFast = true;}
	if(key=='a'){moveTwo = true;}
	if(key=='s'){moveThree = true;}
	if(key=='d'){moveFour = true;}
}

public void keyReleased() {
	if(key=='w'){moveOne = false;}
	if(keyCode == SHIFT){moveFast = false;}
	if(key=='a'){moveTwo = false;}
	if(key=='s'){moveThree = false;}
	if(key=='d'){moveFour = false;}
}
public void fractal(int x, int y, int len)
{
	if(len<=20){
		fill(0,0,0,50);
		stroke(255);
		pentagon(x,y,len);
	} else {
		fractal(x,y,len/2);
		fractal(x+len/2,y,len/2);
		fractal(x+len/2+(int)(Math.cos(1.26)*len/2),y-(int)(Math.sin(1.26)*len/2),len/2);
		fractal(x+len/2+(int)(Math.cos(1.26)*len/2)-(int)(Math.cos(0.62)*len/2),(y-(int)(Math.sin(1.26)*len/2))-(int)(Math.sin(0.62)*len/2),len/2);
		fractal(x+len/2+(int)(Math.cos(1.26)*len/2)-(int)(Math.cos(0.62)*len/2)-(int)(Math.cos(0.62)*len/2),y-(int)(Math.sin(1.26)*len/2)-(int)(Math.sin(0.62)*len/2)+(int)(Math.sin(0.62)*len/2),len/2);
	}
}

public void pentagon(int x, int y, int len)
{
	beginShape();
	vertex(x,y);
	vertex(x+len,y);
	vertex(x+len+(int)(Math.cos(1.26)*len),y-(int)(Math.sin(1.26)*len));
	vertex(x+len+(int)(Math.cos(1.26)*len)-(int)(Math.cos(0.62)*len),(y-(int)(Math.sin(1.26)*len))-(int)(Math.sin(0.62)*len));
	vertex(x+len+(int)(Math.cos(1.26)*len)-(int)(Math.cos(0.62)*len)-(int)(Math.cos(0.62)*len),y-(int)(Math.sin(1.26)*len)-(int)(Math.sin(0.62)*len)+(int)(Math.sin(0.62)*len));
	endShape(CLOSE);
}