import 'package:breakout/breakout.dart';

import 'dart:html';

var paddlex;
var paddleh;
var paddlew;

start() {
  init();
  initPaddle();
  // redraw
  window.animationFrame.then(gameLoop);
}

gameLoop(num delta) {
  if (draw()) {
    window.animationFrame.then(gameLoop);
  }
}

initPaddle() {
  paddlex = width / 2;
  paddleh = 10;
  paddlew = 75;
}

bool draw() {
  clear();
  circle(x, y, 10, black);
  rectangle(paddlex, height - paddleh, paddlew, paddleh, black);

  if (x + dx > width || x + dx < 0) dx = -dx;

  if (y + dy < 0) dy = -dy;
  else if (y + dy > height) {
    if (x > paddlex && x < paddlex + paddlew) dy = -dy;
    else return false; // game over
  }

  x += dx;
  y += dy;

  return true;
}

main() {
  start();
}


