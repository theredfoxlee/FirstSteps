import QtQuick 2.0

MouseArea {
    property variant previousPosition
    onPressed: {
        previousPosition = Qt.point(mouseX, mouseY)
    }
    onPositionChanged: {
        if (pressedButtons == Qt.LeftButton) {
            var dx = mouseX - previousPosition.x
            var dy = mouseY - previousPosition.y
            window.x += dx;
            window.y += dy;
        }
    }
}
