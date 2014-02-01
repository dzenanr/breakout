import 'package:breakout/breakout.dart';

import 'dart:html';

var NROWS = 5;
var NCOLS = 5;
var BRICK_HEIGHT = 15;
var PADDING = 1;
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
  brickw = (canvasw / NCOLS) - 1;
  bricks = new List(NROWS);
  for (var i = 0; i < NROWS; i++) {
    bricks[i] = new List(NCOLS);
    for (var j = 0; j < NCOLS; j++) {
      bricks[i][j] = 1;
    }
  }
}

bool draw() {
  clear();
  circle(x, y, 10, BLACK);

  //draw bricks
  var count = 0;
  for (var i = 0; i < NROWS; i++) {
    for (var j = 0; j < NCOLS; j++) {
      if (bricks[i][j] == 1) {
        rectangle(
          (j * (brickw + PADDING)) + PADDING,
          (i * (BRICK_HEIGHT + PADDING)) + PADDING,
           brickw, BRICK_HEIGHT, BLACK
        );
        count++;
      }
    }
  }
  if (count == 0) return false; // user wins

  // have we hit a brick?
  var rowHeight = BRICK_HEIGHT + PADDING;
  var colWidth = brickw + PADDING;
  int row = (y / rowHeight).floor();
  int col = (x / colWidth).floor();
  if (row < NROWS && col < NCOLS && row >= 0 && col >= 0) {
    if (y < NROWS * rowHeight && bricks[row][col] == 1) {
      // if so, reverse the ball and mark the brick as broken
      dy = -dy;
      bricks[row][col] = 0;
    }
  }

  // move the paddle if left or right is currently pressed
  if (rightDown) paddlex += 5;
  else if (leftDown) paddlex -= 5;
  rectangle(paddlex, canvash - paddleh, paddlew, paddleh, BLACK);

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


