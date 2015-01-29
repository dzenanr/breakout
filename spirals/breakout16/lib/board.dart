part of breakout;

class Board {
  static const String white = '#ffffff';
  static const String black = '#000000';

  CanvasElement canvas;
  CanvasRenderingContext2D context;

  num width;
  num height;
  num dx = 2;
  num dy = 4;

  Wall wall;
  Ball ball;
  Racket racket;

  Board(this.canvas) {
    context = canvas.getContext("2d");
    width = canvas.width;
    height = canvas.height;
    fill();
    wall = new Wall(this);
    ball = new Ball(this, white);
    racket = new Racket(this, white, black);
    // redraw
    window.animationFrame.then(gameLoop);
  }

  gameLoop(num delta) {
    if (draw()) {
      window.animationFrame.then(gameLoop);
    }
  }

  fill() {
    context
    ..fillStyle = black
    ..beginPath()..rect(0, 0, width, height)..closePath()
    ..fill();
  }

  clear() {
    context.clearRect(0, 0, width, height);
    fill();
  }

  bool draw() {
    clear();
    ball.draw();
    racket.draw();
    if (!wall.draw()) return false; // user wins

    // If hit, reverse the ball.
    if (wall.hitBy(ball)) dy = -dy;

    // Move the racket if left or right is currently pressed.
    if (racket.rightDown) racket.x += 5;
    else if (racket.leftDown) racket.x -= 5;

    if (ball.x + dx + Ball.radius > width ||
        ball.x + dx - Ball.radius < 0) dx = -dx;

    if (ball.y + dy - Ball.radius < 0) dy = -dy;
    else if (ball.y + dy + Ball.radius > height - Racket.height) {
      if (ball.x > racket.x && ball.x < racket.x + Racket.width) {
        // Move the ball differently based on where it hits the racket.
        dx = 8 * ((ball.x- (racket.x + Racket.width / 2)) / Racket.width);
        dy = -dy;
      } else if (ball.y + dy + Ball.radius > height) return false;
    }

    ball.x += dx;
    ball.y += dy;
    return true;
  }
}