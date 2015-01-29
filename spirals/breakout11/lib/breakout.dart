library breakout;

import 'dart:html';
import 'dart:math';

const white = '#ffffff';
const black = '#000000';
const rowCount = 5;
const colCount = 5;
const brickHeight = 15;
const padding = 1;

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
  brickw = (canvasw / colCount) - 1;
  _initBricks();

  document.onKeyDown.listen(onKeyDown);
  document.onKeyUp.listen(onKeyUp);
  document.onMouseMove.listen(onMouseMove);
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
    paddlex = max(event.page.x - canvasMinX - (paddlew / 2), 0);
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
    ..fillStyle = black
    ..beginPath()
    ..rect(0, 0, canvasw, canvash)
    ..closePath()
    ..fill();
}

clear() {
  context.clearRect(0, 0, canvasw, canvash);
  board();
}
