Particle[] particles;
void setup()
{
	size(600,600);
	particles = new Particle[500];
	for (int i=0; i<particles.length; i++) 
	{
		particles[i] = new NormalParticle();
	}
	particles[0] = new OddballParticle();
	particles[1] = new JumboParticle();
}

void draw()
{
	background(0);
	for (int i=0; i<particles.length; i++) 
	{
		particles[i].show();
		particles[i].move();
	}
}

void mousePressed() 
{
	background(0);
	size(600,600);
	particles = new Particle[500];
	for (int i=0; i<particles.length; i++) 
	{
		particles[i] = new NormalParticle();
	}
	particles[0] = new OddballParticle();
	particles[1] = new JumboParticle();
}

class NormalParticle implements Particle
{
	double myAngle, mySpeed, myX, myY, mySize;
	
	NormalParticle() 
	{
		myX = myY = 300;
		myAngle = Math.random()*2*Math.PI;
		mySpeed = Math.random()*10;
		mySize = 2;
	}

	public void show() 
	{
		noStroke();
		fill(255);
		ellipse((float)myX, (float)myY, (float)mySize, (float)mySize);
		mySize = mySize + 0.02;
	}

	public void move() 
	{
		myX = myX + (Math.cos(myAngle) * mySpeed);
		myY = myY + (Math.sin(myAngle) * mySpeed);
	}
}

interface Particle
{
	public void show();
	public void move();
}

class OddballParticle implements Particle
{
	double oddAngle, oddSpeed, oddX, oddY;

	OddballParticle() 
	{
		oddX = oddY = 300;
		oddAngle = Math.random()*2*Math.PI;
		oddSpeed = Math.random()*5;
	}

	public void show() 
	{
		noStroke();
		fill((int)(Math.random()*255),(int)(Math.random()*255),(int)(Math.random()*255));
		rect((float)oddX,(float)oddY,25,25);
	}

	public void move() 
	{
		oddX = oddX + Math.cos(oddAngle) * oddSpeed + (int)(Math.random()*7)-3;
		oddY = oddY + Math.sin(oddAngle) * oddSpeed + (int)(Math.random()*7)-3;
	}
}

class JumboParticle extends NormalParticle
{
	void show() 
	{
		noStroke();
		fill(40,80,150);
		ellipse((float)myX,(float)myY,50,50);
		fill(100,100,100);
		ellipse((float)myX,(float)myY+12,90,30);
		fill(255,255,0);
		ellipse((float)myX-25,(float)myY+12,5,5);
		ellipse((float)myX-15,(float)myY+10,5,5);
		ellipse((float)myX-5,(float)myY+9,5,5);
		ellipse((float)myX+5,(float)myY+9,5,5);
		ellipse((float)myX+15,(float)myY+10,5,5);
		ellipse((float)myX+25,(float)myY+12,5,5);
	}
}

