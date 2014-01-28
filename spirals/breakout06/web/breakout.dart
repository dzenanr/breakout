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
  circle(x, y, 10, BLACK);

  if (x + dx > WIDTH || x + dx < 0) dx = -dx;
  if (y + dy > HEIGHT || y + dy < 0) dy = -dy;

  x += dx;
  y += dy;
}

main() {
  start();
}


