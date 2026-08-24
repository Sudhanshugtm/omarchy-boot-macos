import QtQuick
import qs.Commons
import qs.Ui

BarWidget {
  id: root
  moduleName: "sid.boot-macos"

  readonly property string bootScript: Qt.resolvedUrl("boot-macos").toString().replace(/^file:\/\//, "")

  function bootMacOS() {
    if (root.bar)
      root.bar.run("omarchy-launch-floating-terminal-with-presentation " + bootScript)
  }

  implicitWidth: button.implicitWidth
  implicitHeight: button.implicitHeight

  BarIconButton {
    id: button
    anchors.fill: parent
    bar: root.bar
    text: "\uf179"
    slotSize: Style.bar.statusSlot
    fontSize: Style.font.caption
    tooltipText: "Restart once into macOS"
    onPressed: root.bootMacOS()
  }
}
