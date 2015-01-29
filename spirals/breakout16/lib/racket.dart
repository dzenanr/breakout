part of breakout;

class Racket {
  static const num height = 10;
  static const num width = 75;
  static const num leftArrow = 37;
  static const num rightArrow = 39;

  Board board;
  num x, y;
  bool rightDown = false, leftDown = false;
  String fillColor, styleColor;

  Racket(this.board, this.fillColor, [this.styleColor]) {
    x = board.canvas.width / 2;
    y = board.canvas.height - height;
    // Set rightDown or leftDown if the right or left keys are down.
    document.onKeyDown.listen((KeyboardEvent event) {
      if (event.keyCode == rightArrow)     rightDown = true;
      else if (event.keyCode == leftArrow) leftDown  = true;
    });
    // Unset rightDown or leftDown when the right or left key is released.
    document.onKeyUp.listen((KeyboardEvent event) {
      if (event.keyCode == rightArrow)     rightDown = false;
      else if (event.keyCode == leftArrow) leftDown  = false;
    });
    // Change a position of the racket with the mouse left or right mouvement.
    document.onMouseMove.listen((MouseEvent event) {
      var canvasMinX = board.canvas.offset.left;
      var canvasMaxX = canvasMinX + board.canvas.width;
      if (event.page.x > canvasMinX && event.page.x < canvasMaxX) {
        x = max(event.page.x - canvasMinX - (width / 2), 0);
        x = min(board.canvas.width - width, x);
      }
    });
  }

  draw() {
    rectangle(board.context, x, y, width, height, fillColor, styleColor);
  }
}