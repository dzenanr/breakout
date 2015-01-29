part of breakout;

class Ball {
  static const num radius = 10;

  Board board;
  num x, y;
  String color, outline;

  Ball(this.board, this.color, [this.outline]) {
    x = board.canvas.width / 4;
    y = board.canvas.height / 4;
  }

  draw() {
    circle(board.context, x, y, radius, color, outline);
  }
}