import 'dart:html';
import 'dart:math';

// begin library code
var white = '#ffffff';
var black = '#000000';
var width;
var height;

var x = 150;
var y = 150;
var dx = 2;
var dy = 4;
var ctx;

init() {
  CanvasElement canvas = querySelector('#canvas');
  width = canvas.width;
  height = canvas.height;
  ctx = canvas.getContext("2d");
  // redraw
  window.animationFrame.then(gameLoop);
}

gameLoop(num delta) {
  draw();
  window.animationFrame.then(gameLoop);
}

rect(x, y, w, h, color) {
  ctx.fillStyle = color;
  ctx.beginPath();
  ctx.rect(x, y, w, h);
  ctx.closePath();
  ctx.fill();
}

circle(x, y, r, color) {
  ctx.fillStyle = color;
  ctx.beginPath();
  ctx.arc(x, y, r, 0, PI * 2, true);
  ctx.closePath();
  ctx.fill();
}

border() {
  ctx.beginPath();
  ctx.rect(0, 0, width, height);
  ctx.closePath();
  ctx.stroke();
}

clear() {
  ctx.clearRect(0, 0, width, height);
  border();
}
// end library code

draw() {
  clear();
  circle(x, y, 10, black);

  x += dx;
  y += dy;
}

main() {
  init();
}


