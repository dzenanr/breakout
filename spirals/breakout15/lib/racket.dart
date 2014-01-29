part of breakout;

class Racket {
  static const num HIGHT = 10;
  static const num WIDTH = 75;

  Board board;
  num x, y;
  bool rightDown = false, leftDown = false;
  String fillColor, styleColor;

  Racket(this.board, this.fillColor, [this.styleColor]) {
    x = board.canvas.width / 2;
    y = board.canvas.height - HIGHT;
    document.onKeyDown.listen(onKeyDown);
    document.onKeyUp.listen(onKeyUp);
    document.onMouseMove.listen(onMouseMove);
  }

  draw() {
    rectangle(board.context, x, y, WIDTH, HIGHT, fillColor, styleColor);
  }

  // Set rightDown or leftDown if the right or left keys are down.
  onKeyDown(event) {
    if (event.keyCode == 39)      rightDown = true;
    else if (event.keyCode == 37) leftDown  = true;
  }

  // Unset rightDown or leftDown when the right or left key is released.
  onKeyUp(event) {
    if (event.keyCode == 39)      rightDown = false;
    else if (event.keyCode == 37) leftDown  = false;
  }

  // Change a position of the racket with the mouse left or right mouvement.
  onMouseMove(event) {
    var canvasMinX = board.canvas.offset.left;
    var canvasMaxX = canvasMinX + board.canvas.width;
    if (event.page.x > canvasMinX && event.page.x < canvasMaxX) {
      x = max(event.page.x - canvasMinX - (WIDTH / 2), 0);
      x = min(board.canvas.width - WIDTH, x);
    }
  }
}