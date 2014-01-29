library breakout;

import 'dart:html';
import 'dart:math';

part 'bricks.dart';
part 'ball.dart';
part 'racket.dart';

const WHITE = 'ffffff';
const BLACK = '000000';

CanvasElement canvas;
var context;

Wall wall;
Ball ball;
Racket racket;

var dx = 2;
var dy = 4;

init() {
  canvas = querySelector('#canvas');
  context = canvas.getContext("2d");
  wall = new Wall(context);
  ball = new Ball(context, WHITE);
  racket = new Racket(context, WHITE, BLACK);
}

board() {
  context
    ..fillStyle = BLACK
    ..beginPath()
    ..rect(0, 0, canvas.width, canvas.height)
    ..closePath()
    ..fill();
}

clear() {
  context.clearRect(0, 0, canvas.width, canvas.height);
  board();
}
