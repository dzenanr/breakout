import 'package:breakout/breakout.dart';

import 'dart:html';

start() {
  init();
  // redraw
  window.animationFrame.then(gameLoop);
}

gameLoop(num delta) {
  if (draw()) {
    window.animationFrame.then(gameLoop);
  }
}

bool draw() {
  clear();
  ball.draw();
  racket.draw();
  if (!drawBricks()) return false; // user wins

  // have we hit a brick?
  // to learn about real collision detection:
  // http://www.metanetsoftware.com/
  var rowHeight = brickHeight + padding;
  var colWidth = brickw + padding;
  int row = (ball.y / rowHeight).floor();
  int col = (ball.x / colWidth).floor();
  if (row < rowCount && col < colCount && row >= 0 && col >= 0 &&
      ball.y < rowCount * rowHeight && bricks[row][col] == 1) {
    // if so, reverse the ball and mark the brick as broken
    dy = -dy;
    bricks[row][col] = 0;
  }

  // move the racket if left or right is currently pressed
  if (racket.rightDown) racket.x += 5;
  else if (racket.leftDown) racket.x -= 5;

  if (ball.x + dx + Ball.radius > canvas.width ||
      ball.x + dx - Ball.radius < 0) dx = -dx;

  if (ball.y + dy - Ball.radius < 0) dy = -dy;
  else if (ball.y + dy + Ball.radius > canvas.height - Racket.height) {
    if (ball.x > racket.x && ball.x < racket.x + Racket.width) {
      // move the ball differently based on where it hits the racket
      dx = 8 * ((ball.x- (racket.x + Racket.width / 2)) / Racket.width);
      dy = -dy;
    } else if (ball.y + dy + Ball.radius > canvas.height) return false;
  }

  ball.x += dx;
  ball.y += dy;
  return true;
}

main() {
  start();
}


