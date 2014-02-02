part of breakout;

CanvasElement canvas;
var canvasw;
var canvash;
var canvasMinX;
var canvasMaxX;
var context;

initBoard() {
  canvas = querySelector('#canvas');
  canvasw = canvas.width;
  canvash = canvas.height;
  context = canvas.getContext("2d");
  canvasMinX = canvas.offset.left;
  canvasMaxX = canvasMinX + canvasw;
}

bool drawBoard() {
  clearBoard();
  drawBall();

  if (!drawBricks()) return false; // user wins

  // have we hit a brick?
  // to learn about real collision detection:
  // http://www.metanetsoftware.com/
  var rowHeight = BRICK_HEIGHT + PADDING;
  var colWidth = brickw + PADDING;
  int row = (y / rowHeight).floor();
  int col = (x / colWidth).floor();
  if (row < NROWS && col < NCOLS && row >= 0 && col >= 0 &&
      y < NROWS * rowHeight && bricks[row][col] == 1) {
    // if so, reverse the ball and mark the brick as broken
    dy = -dy;
    bricks[row][col] = 0;
  }

  // move the paddle if left or right is currently pressed
  if (rightDown) paddlex += 5;
  else if (leftDown) paddlex -= 5;
  drawRacket();

  if (x + dx + radius > canvasw || x + dx - radius < 0) dx = -dx;

  if (y + dy - radius < 0) dy = -dy;
  else if (y + dy + radius > canvash - paddleh) {
    if (x > paddlex && x < paddlex + paddlew) {
      // move the ball differently based on where it hits the paddle
      dx = 8 * ((x- (paddlex + paddlew / 2)) / paddlew);
      dy = -dy;
    }
    else if (y + dy + radius > canvash) return false; // game over
  }

  x += dx;
  y += dy;
  return true;
}

paintBoard() => rectangle(0, 0, canvasw, canvash, BLACK);

clearBoard() {
  rectangle(0, 0, canvasw, canvash, WHITE);
  paintBoard();
}