part of breakout;

circle(x, y, r, String fillColor, [String styleColor]) {
  context
    ..fillStyle = fillColor
    ..beginPath()
    ..arc(x, y, r, 0, PI * 2, true)
    ..closePath()
    ..fill();
  if (styleColor != null) {
    context
      ..strokeStyle = styleColor
      ..stroke();
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