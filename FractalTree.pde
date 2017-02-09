private double fractionLength = .82; 
private int smallestBranch = 10; 
private double branchAngle = .2; 


public void setup() 
{   
	size(800,640);    
	noLoop(); 
} 
public void draw() 
{   
	background(255);   
	strokeWeight(11);
	stroke(0,0,0);   
	line(400,640,400,500);   
	drawBranches(400, 500, 90, 3*Math.PI/2, 9);
} 
public void keyPressed(){
	if(keyCode == 32){ //spacebar
		redraw();
	}
}
public void drawBranches(int x,int y, double branchLength, double angle, float strokeW) 
{   
	double angle1, angle2;
	angle1 = angle + branchAngle + 0.1;
	angle2 = angle - branchAngle - 0.1;
	strokeW -= 1;
	branchLength = branchLength * fractionLength;
	int endX1 = (int)(branchLength*Math.cos(angle1) + x);
	int endY1 = (int)(branchLength*Math.sin(angle1) + y);
	int endX2 = (int)(branchLength*Math.cos(angle2) + x);
	int endY2 = (int)(branchLength*Math.sin(angle2) + y);

	if(strokeW<1) strokeW=1;

	if(strokeW<=1){
		stroke(0,0,0,120);
	}else if(strokeW<=2){
		stroke(0,0,0,150);
	}else{
		stroke(0,0,0);
	}

	strokeWeight(strokeW);
	line(x, y, endX1, endY1);
	line(x, y, endX2, endY2);

	branchAngle = (Math.random()*0.5);  //variation of branch angle change per branch
	fractionLength = (Math.random()*0.08)+0.8; //length variation

	if(branchLength > smallestBranch){
		drawBranches(endX1, endY1, branchLength, angle1, strokeW);
		drawBranches(endX2, endY2, branchLength, angle2, strokeW);
	
	}
} 
