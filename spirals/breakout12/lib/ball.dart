part of breakout;

var radius = 10;
var x = 150;
var y = 150;
var ballColor;
var ballOutline;

var dx = 2;
var dy = 4;

initBall(color, outline) {
  ballColor = color;
  ballOutline = outline;
}

drawBall() => circle(x, y, radius, ballColor, ballOutline);