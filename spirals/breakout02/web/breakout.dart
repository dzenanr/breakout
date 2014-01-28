import 'dart:html';
import 'dart:math';

void main() {
  // get a reference to the canvas
  var canvas = querySelector('#canvas');
  var ctx = canvas.getContext("2d");

  // draw a circle
  ctx.beginPath();
  ctx.arc(75, 75, 10, 0, PI * 2, true);
  ctx.closePath();
  ctx.fill();
}


