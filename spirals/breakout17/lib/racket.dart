part of breakout;

class Racket {
  static const num HIGHT = 10;
  static const num WIDTH = 75;
  static const num LEFT_ARROW = 37;
  static const num RIGHT_ARROW = 39;

  Board board;
  num x, y;
  bool rightDown = false, leftDown = false;
  String fillColor, styleColor;

  Racket(this.board, this.fillColor, [this.styleColor]) {
    x = board.canvas.width / 2;
    y = board.canvas.height - HIGHT;
    // Set rightDown or leftDown if the right or left keys are down.
    document.onKeyDown.listen((KeyboardEvent event) {
      if (event.keyCode == RIGHT_ARROW)     rightDown = true;
      else if (event.keyCode == LEFT_ARROW) leftDown  = true;
    });
    // Unset rightDown or leftDown when the right or left key is released.
    document.onKeyUp.listen((KeyboardEvent event) {
      if (event.keyCode == RIGHT_ARROW)     rightDown = false;
      else if (event.keyCode == LEFT_ARROW) leftDown  = false;
    });
    // Change a position of the racket with the mouse left or right mouvement.
    document.onMouseMove.listen((MouseEvent event) {
      var canvasMinX = board.canvas.offset.left;
      var canvasMaxX = canvasMinX + board.canvas.width;
      if (event.page.x > canvasMinX && event.page.x < canvasMaxX) {
        x = max(event.page.x - canvasMinX - (WIDTH / 2), 0);
        x = min(board.canvas.width - WIDTH, x);
      }
    });
  }

  draw() {
    rectangle(board.context, x, y, WIDTH, HIGHT, fillColor, styleColor);
  }
}