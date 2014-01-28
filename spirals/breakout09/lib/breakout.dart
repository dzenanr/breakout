library breakout;

import 'dart:html';
import 'dart:math';

var WHITE = 'ffffff';
var BLACK = '000000';
var WIDTH;
var HEIGHT;

CanvasElement canvas;
var context;

var x = 150;
var y = 150;
var dx = 2;
var dy = 4;

var paddlex;
var paddleh = 10;
var paddlew = 75;
var rightDown = false;
var leftDown = false;

init() {
  canvas = querySelector('#canvas');
  WIDTH = canvas.width;
  HEIGHT = canvas.height;
  context = canvas.getContext("2d");
  paddlex = WIDTH / 2;

  document.onKeyDown.listen(onKeyDown);
  document.onKeyUp.listen(onKeyUp);
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
    ..rect(0, 0, WIDTH, HEIGHT)
    ..closePath()
    ..stroke();
}

clear() {
  context.clearRect(0, 0, WIDTH, HEIGHT);
  border();
}
