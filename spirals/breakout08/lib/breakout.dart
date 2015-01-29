library breakout;

import 'dart:html';
import 'dart:math';

var white = '#ffffff';
var black = '#000000';
var width;
var height;

var context;

var x = 150;
var y = 150;
var dx = 2;
var dy = 4;

var paddlex;
var paddleh = 10;
var paddlew = 75;

init() {
  CanvasElement canvas = querySelector('#canvas');
  width = canvas.width;
  height = canvas.height;
  context = canvas.getContext("2d");
  paddlex = width / 2;
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
    ..rect(0, 0, width, height)
    ..closePath()
    ..stroke();
}

clear() {
  context.clearRect(0, 0, width, height);
  border();
}
