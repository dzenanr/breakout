part of breakout;

const WHITE = 'ffffff';
const BLACK = '000000';

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
  drawBall(x, y, 10, WHITE);

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
  drawRacket(paddlex, canvash - paddleh, paddlew, paddleh, WHITE, BLACK);

  if (x + dx + ballr > canvasw || x + dx - ballr < 0) dx = -dx;

  if (y + dy - ballr < 0) dy = -dy;
  else if (y + dy + ballr > canvash - paddleh) {
    if (x > paddlex && x < paddlex + paddlew) {
      // move the ball differently based on where it hits the paddle
      dx = 8 * ((x- (paddlex + paddlew / 2)) / paddlew);
      dy = -dy;
    }
    else if (y + dy + ballr > canvash) return false; // game over
  }

  x += dx;
  y += dy;
  return true;
}

paintBoard() {
  context
    ..fillStyle = BLACK
    ..beginPath()
    ..rect(0, 0, canvasw, canvash)
    ..closePath()
    ..fill();
}

clearBoard() {
  context.clearRect(0, 0, canvasw, canvash);
  paintBoard();
}