part of breakout;

const NROWS = 5;
const NCOLS = 5;
const BRICK_HEIGHT = 15;
const PADDING = 1;

var bricks;
var brickw;
var rowColors = ["#ff1c0a", "#fffd0a", "#00a308", "#0008db", "#eb0093"];

initBricks() {
  bricks = new List(NROWS);
  for (var i = 0; i < NROWS; i++) {
    bricks[i] = new List(NCOLS);
    for (var j = 0; j < NCOLS; j++) {
      bricks[i][j] = 1;
    }
  }
}

bool drawBricks() {
  var count = 0;
  for (var i = 0; i < NROWS; i++) {
    for (var j = 0; j < NCOLS; j++) {
      if (bricks[i][j] == 1) {
        rectangle(
          (j * (brickw + PADDING)) + PADDING,
          (i * (BRICK_HEIGHT + PADDING)) + PADDING,
           brickw, BRICK_HEIGHT, rowColors[i]
        );
        count++;
      }
    }
  }
  if (count == 0) return false;
  else return true;
}