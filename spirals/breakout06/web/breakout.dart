import 'package:breakout/breakout.dart';

import 'dart:html';

start() {
  init();
  // redraw
  window.animationFrame.then(gameLoop);
}

gameLoop(num delta) {
  draw();
  window.animationFrame.then(gameLoop);
}

draw() {
  clear();
  circle(x, y, 10, black);

  if (x + dx > width || x + dx < 0) dx = -dx;
  if (y + dy > height || y + dy < 0) dy = -dy;

  x += dx;
  y += dy;
}

main() {
  start();
}


