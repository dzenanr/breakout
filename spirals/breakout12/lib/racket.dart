part of breakout;

var paddlex;
var paddleh = 10;
var paddlew = 75;
var paddleColor;
var paddleOutline;

var rightDown = false;
var leftDown = false;

initRacket(color, outline) {
  paddlex = canvasw / 2;
  paddleColor = color;
  paddleOutline = outline;

  document.onKeyDown.listen(onKeyDown);
  document.onKeyUp.listen(onKeyUp);
  document.onMouseMove.listen(onMouseMove);
}

drawRacket() =>
  rectangle(paddlex, canvash - paddleh, paddlew, paddleh, WHITE, BLACK);

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