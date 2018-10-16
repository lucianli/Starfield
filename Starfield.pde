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
		fill((int)(Math.random()*255),(int)(Math.random()*255),(int)(Math.random()*255));
		ellipse((float)myX, (float)myY, 50, 50);
	}
}

