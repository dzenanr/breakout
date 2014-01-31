part of breakout;

circle(CanvasRenderingContext2D context,
       num centerX, num centerY, num radius,
       String fillColor, [String styleColor]) {
  context
    ..fillStyle = fillColor
    ..beginPath()
    ..arc(centerX, centerY, radius, 0, PI * 2, true)
    ..closePath()
    ..fill();
  if (styleColor != null) {
    context..strokeStyle = styleColor..stroke();
  }
}

rectangle(CanvasRenderingContext2D context,
          num x, num y, num width, num height,
          String fillColor, [String styleColor]) {
  context
    ..fillStyle = fillColor
    ..beginPath()..rect(x, y, width, height)..closePath()
    ..fill();
  if (styleColor != null) {
    context..strokeStyle = styleColor..stroke();
  }
}