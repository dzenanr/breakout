import 'package:breakout/breakout.dart';

import 'dart:html';

var canvasMinX;
var canvasMaxX;

start() {
  init();
  _initMouse();
  document.onMouseMove.listen(onMouseMove);
  // redraw
  window.animationFrame.then(gameLoop);
}

gameLoop(num delta) {
  if (draw()) {
    window.animationFrame.then(gameLoop);
  }
}

_initMouse() {
  canvasMinX = canvas.offset.left;
  canvasMaxX = canvasMinX + width;
}

onMouseMove(evt) {
  if (evt.page.x > canvasMinX && evt.page.x < canvasMaxX) {
    paddlex = evt.page.x - canvasMinX;
  }
}

bool draw() {
  clear();
  circle(x, y, 10, black);

  // move the paddle if left or right is currently pressed
  if (rightDown) paddlex += 5;
  else if (leftDown) paddlex -= 5;
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


