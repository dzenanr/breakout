import 'dart:html';
import 'dart:math';

var x = 150;
var y = 150;
var dx = 2;
var dy = 4;
var ctx;

init() {
  var canvas = querySelector('#canvas');
  ctx = canvas.getContext("2d");
  // redraw
  window.animationFrame.then(gameLoop);
}

gameLoop(num delta) {
  draw();
  window.animationFrame.then(gameLoop);
}

draw() {
  ctx.clearRect(0, 0, 300, 300);
  ctx.beginPath();
  ctx.arc(x, y, 10, 0, PI * 2, true);
  ctx.closePath();
  ctx.fill();
  x += dx;
  y += dy;
}

main() {
  init();
}


