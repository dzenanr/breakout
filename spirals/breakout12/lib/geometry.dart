part of breakout;

circle(x, y, r, color) {
  context
    ..fillStyle = color
    ..beginPath()
    ..arc(x, y, r, 0, PI * 2, true)
    ..closePath()
    ..fill();
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