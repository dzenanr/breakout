import 'package:breakout/breakout.dart';

import 'dart:html';

start() {
  initBoard();
  initRacket();
  initBricks();
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


