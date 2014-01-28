library breakout;

import 'dart:html';
import 'dart:math';

const WHITE = 'ffffff';
const BLACK = '000000';
const NROWS = 5;
const NCOLS = 5;
const BRICK_HEIGHT = 15;
const PADDING = 1;

var rowColors = ["#ff1c0a", "#fffd0a", "#00a308", "#0008db", "#eb0093"];

CanvasElement canvas;
var canvasw;
var canvash;
var canvasMinX;
var canvasMaxX;
var context;

var bricks;
var brickw;

var x = 150;
var y = 150;
var dx = 2;
var dy = 4;

var ballr = 10;

var paddlex;
var paddleh = 10;
var paddlew = 75;
var rightDown = false;
var leftDown = false;

init() {
  canvas = querySelector('#canvas');
  canvasw = canvas.width;
  canvash = canvas.height;
  context = canvas.getContext("2d");
  canvasMinX = canvas.offset.left;
  canvasMaxX = canvasMinX + canvasw;
  paddlex = canvasw / 2;
  brickw = (canvasw / NCOLS) - 1;
  _initBricks();

  document.onKeyDown.listen(onKeyDown);
  document.onKeyUp.listen(onKeyUp);
  document.onMouseMove.listen(onMouseMove);
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

// set rightDown or leftDown if the right or left keys are down
onKeyDown(event) {
  if (event.keyCode == 39) rightDown = true;
  else if (event.keyCode == 37) leftDown = true;
}

// and unset them when the right or left key is released
onKeyUp(event) {
  if (event.keyCode == 39) rightDown = false;
  else if (event.keyCode == 37) leftDown = false;
}

onMouseMove(event) {
  if (event.page.x > canvasMinX && event.page.x < canvasMaxX) {
    paddlex = max(event.page.x - canvasMinX - (paddlew/2), 0);
    paddlex = min(canvasw - paddlew, paddlex);
  }
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

circle(x, y, r, color) {
  context
    ..fillStyle = color
    ..beginPath()
    ..arc(x, y, r, 0, PI * 2, true)
    ..closePath()
    ..fill();
}

board() {
  context
    ..fillStyle = BLACK
    ..beginPath()
    ..rect(0, 0, canvasw, canvash)
    ..closePath()
    ..fill();
}

clear() {
  context.clearRect(0, 0, canvasw, canvash);
  board();
}
