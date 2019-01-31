int x = 150;
int y = 550;
int len = 300;
public void setup()
{
	size(600,600);
	background(0);
}

public void draw()
{
	fractal(x,y,len);
}

public void fractal(int x, int y, int len)
{
	if(len<=20){
		noFill();
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