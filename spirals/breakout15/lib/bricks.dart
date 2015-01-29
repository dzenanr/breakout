part of breakout;

class Wall {
  static const num rowCount = 5;
  static const num colCount = 5;
  static const num brickHeight = 15;
  static const num padding = 1;

  Board board;
  num brickWidth;
  var bricks = new List(rowCount);
  var rowColors = ["#ff1c0a", "#fffd0a", "#00a308", "#0008db", "#eb0093"];

  Wall(this.board) {
    brickWidth = (board.canvas.width / colCount) - 1;
    for (var i = 0; i < rowCount; i++) {
      bricks[i] = new List(colCount);
      for (var j = 0; j < colCount; j++) {
        bricks[i][j] = 1;
      }
    }
  }

  // collision detection: http://www.metanetsoftware.com/
  bool hitBy(Ball ball) {
    var rowHeight = brickHeight + padding;
    var colWidth = brickWidth + padding;
    int row = (ball.y / rowHeight).floor();
    int col = (ball.x / colWidth).floor();
    if (row < rowCount && col < colCount && row >= 0 && col >= 0 &&
        ball.y < rowCount * rowHeight && bricks[row][col] == 1) {
      // hit, mark the brick as broken
      bricks[row][col] = 0;
      return true;
    } else return false;
  }

  bool draw() {
    var count = 0;
    for (var i = 0; i < rowCount; i++) {
      for (var j = 0; j < colCount; j++) {
        if (bricks[i][j] == 1) {
          rectangle(
            board.context,
            (j * (brickWidth + padding)) + padding,
            (i * (brickHeight + padding)) + padding,
            brickWidth, brickHeight,
            rowColors[i]);
          count++;
        }
      }
    }
    if (count == 0) return false;
    else return true;
  }
}