part of breakout;

class Racket {
  static const num HIGHT = 10;
  static const num WIDTH = 75;

  CanvasElement canvas;
  CanvasRenderingContext2D context;
  num x, y;
  bool rightDown = false;
  bool leftDown = false;
  String fillColor, styleColor;

  Racket(this.context, this.fillColor, [this.styleColor]) {
    canvas = context.canvas;
    x = canvas.width / 2;
    y = canvas.height - HIGHT;
    document.onKeyDown.listen(onKeyDown);
    document.onKeyUp.listen(onKeyUp);
    document.onMouseMove.listen(onMouseMove);
  }

  draw() {
    context
      ..fillStyle = fillColor
      ..beginPath()
      ..rect(x, y, WIDTH, HIGHT)
      ..closePath()
      ..fill();
    if (styleColor != null) {
      context
        ..strokeStyle = styleColor
        ..stroke();
    }
  }

  // Set rightDown or leftDown if the right or left keys are down.
  onKeyDown(event) {
    if (event.keyCode == 39) {
      rightDown = true;
    } else if (event.keyCode == 37) {
      leftDown = true;
    }
  }

  // Unset rightDown or leftDown when the right or left key is released.
  onKeyUp(event) {
    if (event.keyCode == 39) {
      rightDown = false;
    } else if (event.keyCode == 37) {
      leftDown = false;
    }
  }

  onMouseMove(event) {
    var canvasMinX = canvas.offset.left;
    var canvasMaxX = canvasMinX + canvas.width;
    if (event.page.x > canvasMinX && event.page.x < canvasMaxX) {
      x = max(event.page.x - canvasMinX - (WIDTH / 2), 0);
      x = min(context.canvas.width - WIDTH, x);
    }
  }
}