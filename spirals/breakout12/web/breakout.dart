import 'package:breakout/breakout.dart';

import 'dart:html';

start() {
  initBoard();
  initBricks();
  initBall(WHITE, YELLOW);
  initRacket(WHITE, BLACK);
  // redraw
  window.animationFrame.then(gameLoop);
}

gameLoop(num delta) {
  if (drawBoard()) {
    window.animationFrame.then(gameLoop);
  }
}

main() {
  start();
}


