part of breakout;

const rowCount = 5;
const colCount = 5;
const brickHeight = 15;
const padding = 1;

var brickw;
var bricks;

initBricks() {
  brickw = (canvasw / colCount) - 1;
  bricks = new List(rowCount);
  for (var i = 0; i < rowCount; i++) {
    bricks[i] = new List(colCount);
    for (var j = 0; j < colCount; j++) {
      bricks[i][j] = 1;
    }
  }
}

bool drawBricks() {
  var count = 0;
  for (var i = 0; i < rowCount; i++) {
    for (var j = 0; j < colCount; j++) {
      if (bricks[i][j] == 1) {
        rectangle(
          (j * (brickw + padding)) + padding,
          (i * (brickHeight + padding)) + padding,
           brickw, brickHeight, colors[i]
        );
        count++;
      }
    }
  }
  if (count == 0) return false;
  else return true;
}