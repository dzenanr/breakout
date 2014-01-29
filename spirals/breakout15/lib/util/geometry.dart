part of breakout;

circle(context, centerX, centerY, radius, fillColor, [styleColor]) {
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

rectangle(context, x, y, width, height, fillColor, [styleColor]) {
  context
    ..fillStyle = fillColor
    ..beginPath()..rect(x, y, width, height)..closePath()
    ..fill();
  if (styleColor != null) {
    context..strokeStyle = styleColor..stroke();
  }
}