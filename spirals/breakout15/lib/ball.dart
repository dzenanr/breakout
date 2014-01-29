part of breakout;

class Ball {
  static const num RADIUS = 10;

  Board board;
  num x, y;
  String fillColor, styleColor;

  Ball(this.board, this.fillColor, [this.styleColor]) {
    x = board.canvas.width / 2;
    y = board.canvas.height / 2;
  }

  draw() {
    circle(board.context, x, y, RADIUS, fillColor);
  }
}