private float fractionLength = 0.8f;
private int smallestBranch = 10;
private float branchAngle = 0.2f;

void setup() {
    size(640, 480);
    noLoop(); 
} 

void draw() {
    background(0);
    stroke(150, 75, 0);
    line(320, 480, 320, 380);
    drawBranches(320, 380, 100, -PI / 2);  // Initial trunk (angle facing up)
} 

void drawBranches(int x, int y, float branchLength, float angle) {
    if (branchLength < smallestBranch) return;

    float endX = x + branchLength * cos(angle);
    float endY = y + branchLength * sin(angle);

    line(x, y, (int) endX, (int) endY);

    branchLength *= fractionLength;  // Reduce branch length

    drawBranches((int) endX, (int) endY, branchLength, angle + branchAngle);
    drawBranches((int) endX, (int) endY, branchLength, angle - branchAngle);
}
