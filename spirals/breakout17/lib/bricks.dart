part of breakout;

class Wall {
  static const num NROWS = 5, NCOLS = 5;
  static const num BRICK_HEIGHT = 15, PADDING = 1;

  Board board;
  num brickWidth;
  var bricks = new List(NROWS);
  var brickRowColors = new List(NROWS);

  Wall(this.board) {
    brickWidth = (board.canvas.width / NCOLS) - 1;
    for (var i = 0; i < NROWS; i++) {
      bricks[i] = new List(NCOLS);
      brickRowColors[i] = randomColorCode();
      for (var j = 0; j < NCOLS; j++) {
        bricks[i][j] = 1;
      }
    }
  }

  // collision detection: http://www.metanetsoftware.com/
  bool hitBy(Ball ball) {
    var rowHeight = BRICK_HEIGHT + PADDING;
    var colWidth = brickWidth + PADDING;
    int row = (ball.y / rowHeight).floor();
    int col = (ball.x / colWidth).floor();
    if (row < NROWS && col < NCOLS && row >= 0 && col >= 0 &&
        ball.y < NROWS * rowHeight && bricks[row][col] == 1) {
      // hit, mark the brick as broken
      bricks[row][col] = 0;
      return true;
    } else return false;
  }

  bool draw() {
    var count = 0;
    for (var i = 0; i < NROWS; i++) {
      for (var j = 0; j < NCOLS; j++) {
        if (bricks[i][j] == 1) {
          rectangle(
            board.context,
            (j * (brickWidth + PADDING)) + PADDING,
            (i * (BRICK_HEIGHT + PADDING)) + PADDING,
            brickWidth, BRICK_HEIGHT,
            brickRowColors[i]);
          count++;
        }
      }
    }
    if (count == 0) return false;
    else return true;
  }
}