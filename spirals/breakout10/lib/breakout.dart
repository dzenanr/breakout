library breakout;

import 'dart:html';
import 'dart:math';

const WHITE = 'ffffff';
const BLACK = '000000';

CanvasElement canvas;
var canvasw;
var canvash;
var canvasMinX;
var canvasMaxX;
var context;

var x = 150;
var y = 150;
var dx = 2;
var dy = 4;

var paddlex;
var paddlew = 75;
var paddleh = 10;
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

  document.onKeyDown.listen(onKeyDown);
  document.onKeyUp.listen(onKeyUp);
  document.onMouseMove.listen(onMouseMove);
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
    paddlex = event.page.x - canvasMinX;
  }
}

rectangle(x, y, w, h, color) {
  context
    ..fillStyle = color
    ..beginPath()
    ..rect(x, y, w, h)
    ..closePath()
    ..fill();
}

circle(x, y, r, color) {
  context
    ..fillStyle = color
    ..beginPath()
    ..arc(x, y, r, 0, PI * 2, true)
    ..closePath()
    ..fill();
}

border() {
  context
    ..beginPath()
    ..rect(0, 0, canvasw, canvash)
    ..closePath()
    ..stroke();
}

clear() {
  context.clearRect(0, 0, canvasw, canvash);
  border();
}
