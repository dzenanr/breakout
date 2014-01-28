import 'dart:html';
import 'dart:math';

void main() {
  // get a reference to the canvas
  var canvas = querySelector('#canvas');
  var ctx = canvas.getContext("2d");

  // draw a circle
  ctx.fillStyle = "#00a308";
  ctx.beginPath();
  ctx.arc(220, 220, 50, 0, PI * 2, true);
  ctx.closePath();
  ctx.fill();

  ctx.fillStyle = "#ff1c0a";
  ctx.beginPath();
  ctx.arc(100, 100, 100, 0, PI * 2, true);
  ctx.closePath();
  ctx.fill();

  //the rectangle is half transparent
  ctx.fillStyle = "rgba(255, 255, 0, .5)";
  ctx.beginPath();
  ctx.rect(15, 150, 120, 120);
  ctx.closePath();
  ctx.fill();
}


