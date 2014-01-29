import 'package:breakout/breakout.dart';

import 'dart:html';

var rightDown = false;
var leftDown = false;

start() {
  init();
  document.onKeyDown.listen(onKeyDown);
  document.onKeyUp.listen(onKeyUp);
  // redraw
  window.animationFrame.then(gameLoop);
}

gameLoop(num delta) {
  if (draw()) {
    window.animationFrame.then(gameLoop);
  }
}

// set rightDown or leftDown if the right or left keys are down
onKeyDown(evt) {
  if (evt.keyCode == 39) rightDown = true;
  else if (evt.keyCode == 37) leftDown = true;
}

// and unset them when the right or left key is released
onKeyUp(evt) {
  if (evt.keyCode == 39) rightDown = false;
  else if (evt.keyCode == 37) leftDown = false;
}

bool draw() {
  clear();
  circle(x, y, 10, BLACK);

  // move the paddle if left or right is currently pressed
  if (rightDown) paddlex += 5;
  else if (leftDown) paddlex -= 5;
  rectangle(paddlex, HEIGHT - paddleh, paddlew, paddleh, BLACK);

  if (x + dx > WIDTH || x + dx < 0) dx = -dx;

  if (y + dy < 0) dy = -dy;
  else if (y + dy > HEIGHT) {
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


