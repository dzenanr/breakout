library breakout;

import 'dart:html';
import 'dart:math';

part 'ball.dart';
part 'racket.dart';

const WHITE = 'ffffff';
const BLACK = '000000';
const NROWS = 5;
const NCOLS = 5;
const BRICK_HEIGHT = 15;
const PADDING = 1;

var rowColors = ["#ff1c0a", "#fffd0a", "#00a308", "#0008db", "#eb0093"];

CanvasElement canvas;
var context;

var bricks;
var brickw;

Ball ball;
Racket racket;

var dx = 2;
var dy = 4;

init() {
  canvas = querySelector('#canvas');
  context = canvas.getContext("2d");
  brickw = (canvas.width / NCOLS) - 1;
  _initBricks();
  ball = new Ball(context, WHITE);
  racket = new Racket(context, WHITE, BLACK);
}

_initBricks() {
  bricks = new List(NROWS);
  for (var i = 0; i < NROWS; i++) {
    bricks[i] = new List(NCOLS);
    for (var j = 0; j < NCOLS; j++) {
      bricks[i][j] = 1;
    }
  }
}

bool drawBricks() {
  var count = 0;
  for (var i = 0; i < NROWS; i++) {
    for (var j = 0; j < NCOLS; j++) {
      if (bricks[i][j] == 1) {
        rectangle(
          (j * (brickw + PADDING)) + PADDING,
          (i * (BRICK_HEIGHT + PADDING)) + PADDING,
           brickw, BRICK_HEIGHT, rowColors[i]
        );
        count++;
      }
    }
  }
  if (count == 0) return false;
  else return true;
}

rectangle(x, y, w, h, fillColor, [styleColor]) {
  context
    ..fillStyle = fillColor
    ..beginPath()
    ..rect(x, y, w, h)
    ..closePath()
    ..fill();
  if (styleColor != null) {
    context
      ..strokeStyle = styleColor
      ..stroke();
  }
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
