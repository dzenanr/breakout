part of breakout;

class Ball {
  static const RADIUS = 10;

  CanvasRenderingContext2D context;
  num x;
  num y;
  String color;

  Ball(this.context, this.color) {
    x = canvas.width / 2;
    y = canvas.height / 2;
  }

  draw() {
    context
      ..fillStyle = color
      ..beginPath()
      ..arc(x, y, RADIUS, 0, PI * 2, true)
      ..closePath()
      ..fill();
  }
}