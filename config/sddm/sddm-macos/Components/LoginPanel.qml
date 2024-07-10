import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15

Item {
    property var user: userField.text
    property var password: passwordField.text
    property var session: sessionPanel.session
    property var inputHeight: Screen.height * 0.032
    property var inputWidth: Screen.width * 0.16

    Rectangle {
        id: loginBackground
        anchors.centerIn: parent
        height: inputHeight * 5.3
        width: inputWidth * 1.2
        radius: 5
        visible: config.LoginBackground == "true"
        color: config.mantle
    }

    Column {
        spacing: 8
        anchors {
            bottom: parent.bottom
            left: parent.left
        }
        PowerButton { id: powerButton }
        RebootButton { id: rebootButton }
        SleepButton { id: sleepButton }
        z: 5
    }

    Column {
        spacing: 8
        anchors {
            bottom: parent.bottom
            right: parent.right
        }
        SessionPanel { id: sessionPanel }
        z: 5
    }

    Column {
        spacing: 8
        z: 5
        width: inputWidth
        anchors.centerIn: parent
        UserField {
            id: userField
            height: inputWidth / 2
            width: inputWidth / 2
            anchors.horizontalCenter: parent.horizontalCenter
        }
        Item {
            id: passwordItem
            height: inputHeight
            width: parent.width
            PasswordField {
                id: passwordField
                height: inputHeight
                width: parent.width
                anchors.verticalCenter: parent.verticalCenter
                onAccepted: loginButton.clicked()
            }
            Button {
                id: loginButton
                height: inputHeight
                width: inputHeight
                anchors.verticalCenter: parent.verticalCenter
                anchors.right: passwordField.right
                enabled: user !== "" && password !== ""
                hoverEnabled: true
                icon.source: Qt.resolvedUrl("../icons/login.svg")
                icon.width: inputHeight
                icon.height: inputHeight
                icon.color: config.colorWhite
                background: Rectangle {
                    id: buttonBackground
                    color: config.colorButton
                    radius: inputHeight / 2
                }
                states: [
                    State {
                        name: "pressed"
                        when: loginButton.down
                        PropertyChanges { target: buttonBackground; color: config.colorHover }
                    },
                    State {
                        name: "hovered"
                        when: loginButton.hovered
                        PropertyChanges { target: buttonBackground; color: config.colorHover }
                    }
                ]
                transitions: Transition {
                    PropertyAnimation {
                        properties: "color"
                        duration: 300
                    }
                }
                onClicked: sddm.login(user, password, session)
            }
        }
    }

    Connections {
        target: sddm
        function onLoginFailed() {
            passwordField.text = ""
            passwordField.focus = true
        }
    }
}
