NormalParticle[] particles;
void setup()
{
	size(600);
	particles = new NormalParticle[500];
	for (int i=0; i<particles.length; i++) {
		particles[i] = new NormalParticle();
		particles[0] = new OddballParticle();
		particles[1] = new JumboParticle();
	}
	
}

void draw()
{
	background(0);
	for (int i=0; i<particles.length; i++) {
		particles[i].show();
		particles[i].move();
	}
}

class NormalParticle
{
	double myAngle, mySpeed, myX, myY;
	
	NormalParticle() {
		myX = myY = 300;
		myAngle = Math.random()*2*Math.PI;
		mySpeed = Math.random()*10;
	}

	void show() {
		noStroke();
		fill(255);
		ellipse((float)myX, (float)myY, 10, 10);
	}

	void move() {
		myX = myX + (Math.cos(myAngle) * mySpeed);
		myY = myY + (Math.sin(myAngle) * mySpeed);
	}
}

interface Particle
{
	public void show();
	public void move();
}

class OddballParticle implements Particl
{
	int oddX, oddY;
	double oddAngle, oddSpeed;

	OddballParticle() {
		oddX = oddY = 300;
		oddAngle = Math.random()*2*Math.PI;
		oddSpeed = Math.random()*10;
	}

	public void show() {
		noStroke();
		fill((int)(Math.random()*255),(int)(Math.random()*255),(int)(Math.random()*255));
		rect((float)oddX,(float)oddY,15,15);
	}

	public void move() {
		oddX = oddX + Math.cos(oddAngle) * oddSpeed + (int)(Math.random()*7)-3;
		oddY = oddY + Math.sin(oddAngle) * oddSpeed + (int)(Math.random()*7)-3;
	}
}

class JumboParticle extends NormalParticle
{
	void show() {
		noStroke();
		fill((int)(Math.random()*255),(int)(Math.random()*255),(int)(Math.random()*255));
		ellipse((float)myX, (float)myY, 20, 20);
	}
}

