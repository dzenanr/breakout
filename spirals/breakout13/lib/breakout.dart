library breakout;

import 'dart:html';
import 'dart:math';

part 'ball.dart';
part 'racket.dart';

const white = '#ffffff';
const black = '#000000';
const rowCount = 5;
const colCount = 5;
const brickHeight = 15;
const padding = 1;

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
  brickw = (canvas.width / colCount) - 1;
  _initBricks();
  ball = new Ball(context, white);
  racket = new Racket(context, white, black);
}

_initBricks() {
  bricks = new List(rowCount);
  for (var i = 0; i < rowCount; i++) {
    bricks[i] = new List(colCount);
    for (var j = 0; j < colCount; j++) {
      bricks[i][j] = 1;
    }
  }
}

bool drawBricks() {
  var count = 0;
  for (var i = 0; i < rowCount; i++) {
    for (var j = 0; j < colCount; j++) {
      if (bricks[i][j] == 1) {
        rectangle(
          (j * (brickw + padding)) + padding,
          (i * (brickHeight + padding)) + padding,
           brickw, brickHeight, rowColors[i]
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
    ..fillStyle = black
    ..beginPath()
    ..rect(0, 0, canvas.width, canvas.height)
    ..closePath()
    ..fill();
}

clear() {
  context.clearRect(0, 0, canvas.width, canvas.height);
  board();
}
