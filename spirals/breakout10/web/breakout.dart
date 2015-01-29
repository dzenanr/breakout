import 'package:breakout/breakout.dart';

import 'dart:html';

var rowCount = 5;
var colCount = 5;
var brickHeight = 15;
var padding = 1;
var brickw;
var bricks;

start() {
  init();
  _initBricks();
  // redraw
  window.animationFrame.then(gameLoop);
}

gameLoop(num delta) {
  if (draw()) {
    window.animationFrame.then(gameLoop);
  }
}

_initBricks() {
  brickw = (canvasw / colCount) - 1;
  bricks = new List(rowCount);
  for (var i = 0; i < rowCount; i++) {
    bricks[i] = new List(colCount);
    for (var j = 0; j < colCount; j++) {
      bricks[i][j] = 1;
    }
  }
}

bool draw() {
  clear();
  circle(x, y, 10, black);

  //draw bricks
  var count = 0;
  for (var i = 0; i < rowCount; i++) {
    for (var j = 0; j < colCount; j++) {
      if (bricks[i][j] == 1) {
        rectangle(
          (j * (brickw + padding)) + padding,
          (i * (brickHeight + padding)) + padding,
           brickw, brickHeight, black
        );
        count++;
      }
    }
  }
  if (count == 0) return false; // user wins

  // have we hit a brick?
  var rowHeight = brickHeight + padding;
  var colWidth = brickw + padding;
  int row = (y / rowHeight).floor();
  int col = (x / colWidth).floor();
  if (row < rowCount && col < colCount && row >= 0 && col >= 0) {
    if (y < rowCount * rowHeight && bricks[row][col] == 1) {
      // if so, reverse the ball and mark the brick as broken
      dy = -dy;
      bricks[row][col] = 0;
    }
  }

  // move the paddle if left or right is currently pressed
  if (rightDown) paddlex += 5;
  else if (leftDown) paddlex -= 5;
  rectangle(paddlex, canvash - paddleh, paddlew, paddleh, black);

  if (x + dx > canvasw || x + dx < 0) dx = -dx;

  if (y + dy < 0) dy = -dy;
  else if (y + dy > canvash) {
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


