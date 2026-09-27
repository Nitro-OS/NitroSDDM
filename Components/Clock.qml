import QtQuick

Item {
    id: clock

    property string backgroundSource: ""
    property color defaultHoursColor: "#AED68A"
    property color defaultMinutesColor: "#D4E4BC"
    property string fontFamily: "CommitMono Nerd Font Mono"
    property color baseAccent: config.accentColor
    property color smartHoursColor: defaultHoursColor
    property color smartMinutesColor: defaultMinutesColor
    property string timeStr: ""

    function updateTime() {
        var date = new Date();
        var hours = date.getHours();
        var minutes = date.getMinutes();

        if (config.use24HourClock !== "true") {
            hours = hours % 12;
            if (hours === 0) hours = 12;
        }

        var hStr = hours < 10 ? "0" + hours : "" + hours;
        var mStr = minutes < 10 ? "0" + minutes : "" + minutes;

        clock.timeStr = hStr + mStr;
    }

    function updateColors() {
        var base = clock.baseAccent;

        if (base.hsvSaturation < 0.15) {
            clock.smartHoursColor = Qt.lighter(base, 1.3);
            clock.smartMinutesColor = Qt.darker(base, 1.4);
            return;
        }

        if (base.hsvValue < 0.5) {
            clock.smartHoursColor = Qt.hsva(base.hsvHue, 0.7, 0.9, 1.0);
            clock.smartMinutesColor = Qt.hsva(base.hsvHue, 0.45, 0.85, 1.0);
        } else if (base.hsvValue > 0.8 && base.hsvSaturation < 0.2) {
            clock.smartHoursColor = Qt.hsva(base.hsvHue, 0.8, 0.7, 1.0);
            clock.smartMinutesColor = Qt.hsva(base.hsvHue, 0.5, 0.75, 1.0);
        } else {
            clock.smartHoursColor = Qt.hsva(base.hsvHue, Math.min(1.0, base.hsvSaturation * 1.3), 0.95, 1.0);
            clock.smartMinutesColor = Qt.hsva(base.hsvHue, Math.min(1.0, base.hsvSaturation * 0.75), 0.92, 1.0);
        }
    }

    onBaseAccentChanged: updateColors()
    Component.onCompleted: {
        updateColors();
        updateTime();
    }

    Column {
        anchors.centerIn: parent
        width: 500
        spacing: -8

        Row {
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.horizontalCenterOffset: 0
            spacing: 8

            Text {
                text: clock.timeStr.charAt(0)
                color: clock.smartHoursColor
                font.pixelSize: 340
                font.family: clock.fontFamily
                font.weight: Font.Medium
                width: 180
                horizontalAlignment: Text.AlignHCenter
                antialiasing: true
            }
            Text {
                text: clock.timeStr.charAt(1)
                color: clock.smartHoursColor
                font.pixelSize: 340
                font.family: clock.fontFamily
                font.weight: Font.Medium
                width: 260
                horizontalAlignment: Text.AlignHCenter
                antialiasing: true
            }
        }

        Rectangle {
            width: 360
            height: 3
            anchors.horizontalCenter: parent.horizontalCenter
            color: clock.smartHoursColor
            opacity: 0.7
            radius: 2
        }

        Row {
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.horizontalCenterOffset: 0
            spacing: 8

            Text {
                text: clock.timeStr.charAt(2)
                color: clock.smartMinutesColor
                font.pixelSize: 340
                font.family: clock.fontFamily
                font.weight: Font.Medium
                width: 180
                horizontalAlignment: Text.AlignHCenter
                antialiasing: true
            }
            Text {
                text: clock.timeStr.charAt(3)
                color: clock.smartMinutesColor
                font.pixelSize: 340
                font.family: clock.fontFamily
                font.weight: Font.Medium
                width: 260
                horizontalAlignment: Text.AlignHCenter
                antialiasing: true
            }
        }
    }

    Timer {
        interval: 1000
        running: true
        repeat: true
        onTriggered: updateTime()
    }
}
