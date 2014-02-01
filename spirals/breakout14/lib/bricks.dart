part of breakout;

class Wall {
  static const num NROWS = 5;
  static const num NCOLS = 5;
  static const num BRICK_HEIGHT = 15;
  static const num PADDING = 1;

  num brickWidth;
  var bricks = new List(NROWS);
  var rowColors = ["#ff1c0a", "#fffd0a", "#00a308", "#0008db", "#eb0093"];

  CanvasRenderingContext2D context;

  Wall(this.context) {
    brickWidth = (context.canvas.width / NCOLS) - 1;
    for (var i = 0; i < NROWS; i++) {
      bricks[i] = new List(NCOLS);
      for (var j = 0; j < NCOLS; j++) {
        bricks[i][j] = 1;
      }
    }
  }

  bool hitBy(Ball ball) {
    // to learn about real collision detection:
    // http://www.metanetsoftware.com/
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

  _rectangle(x, y, w, h, fillColor, [styleColor]) {
    context
      ..fillStyle = fillColor
      ..beginPath()..rect(x, y, w, h)..closePath()
      ..fill();
    if (styleColor != null) {
      context..strokeStyle = styleColor..stroke();
    }
  }

  bool draw() {
    var count = 0;
    for (var i = 0; i < NROWS; i++) {
      for (var j = 0; j < NCOLS; j++) {
        if (bricks[i][j] == 1) {
          _rectangle((j * (brickWidth + PADDING)) + PADDING,
                     (i * (BRICK_HEIGHT + PADDING)) + PADDING,
                     brickWidth, BRICK_HEIGHT, rowColors[i]);
          count++;
        }
      }
    }
    if (count == 0) return false;
    else return true;
  }
}