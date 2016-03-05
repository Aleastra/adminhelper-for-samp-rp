;;
;; ReconViewer Plugin for AdminHelper.ahk
;; Description: ������ ��������� ����������� ������ ������������� �� ������� � Recon (����������/��������� �����)
;; CMD: /rerun, /restop, /relvl, /retime
;; Author: Danil Valov <danil@valov.me>
;; Version: 1.0b11 (Mar 06, 2015)
;; Required modules: SAMP-UDF-Ex, SAMP-UsersListUpdater, CMD, IgnoreList
;;

class ReconViewer
{
  __timerRunning := 0
  
  __currentId := 0
  
  __usersList := []

  __usersListUpdate()
  {
    global ReconViewerMaxLVL, oScoreboardData

    if (hardUpdateOScoreboardData()) {
      Sleep 100

      this.__usersList := []

      for Id, User in oScoreboardData
      {
        if (StrLen(User["NAME"]) && User["SCORE"] > 0 && User["SCORE"] <= ReconViewerMaxLVL && !checkInIgnoreList(User["NAME"])) {
          this.__usersList.Insert(Id)
        }
      }

      if (this.__usersList.MaxIndex()) {
        Return True
      } else {
        Return False
      }
    } else {
      Return False
    }
  }

  step(duration)
  {
    global ReconViewerMaxLVL

    if (ReconViewerMaxLVL < 1) {
      ReconViewerMaxLVL := 1
    }

    if (!this.__timerRunning) {
      this.stop()
    }

    if (!this.__usersList.MaxIndex()) {
      this.__usersListUpdate()

      Sleep 1000
    }

    if (!this.__usersList.MaxIndex()) {
      this.__usersListUpdate()

      Sleep 1000
    }

    if (!this.__usersList.MaxIndex()) {
      addMessageToChatWindow("{FF0000}� ���� ��� �� ������ ����������� �� LVL ������")

      Return
    }

    if (this.__currentId + duration > this.__usersList.MaxIndex()) {
      this.__usersListUpdate()
      sleep 200
      currentId := 1
    } else if (this.__currentId + duration <= 0) {
      this.__usersListUpdate()
      sleep 200
      currentId := this.__usersList.MaxIndex()
    } else {
      currentId := this.__currentId + duration
    }
    
    if (this.__usersList.MaxIndex() && StrLen(currentId) && StrLen(this.__usersList[currentId]) && StrLen(getPlayerNameById(this.__usersList[currentId])) && getPlayerScoreById(this.__usersList[currentId]) > 0 && getPlayerScoreById(this.__usersList[currentId]) <= ReconViewerMaxLVL && !checkInIgnoreList(getPlayerNameById(this.__usersList[currentId]))) {
      sendChatMessage("/re " this.__usersList[currentId])
      this.__currentId := currentId
      Sleep 1200
    } else {
      if (this.__usersListUpdate()) {
        sleep 200
        this.step(duration)
      }
    }

    Return
  }

  start()
  {
    global ReconViewerTimeout

    if (!this.__timerRunning) {
      showGameText("Starting ReconViewer Loop", 2000, 4)
      this.__timerRunning := 1
      SetTimer, ReconViewerTimer, % (ReconViewerTimeout * 1000)
    }

    Return
  }

  stop()
  {
    global ReconViewerTimeout

    if (this.__timerRunning) {
      showGameText("Stoping ReconViewer Loop", (ReconViewerTimeout * 1000), 4)
      this.__timerRunning := 0
      SetTimer, ReconViewerTimer, Off
    }

    Return
  }

  changeLVL(data)
  {
    global ReconViewerMaxLVL
    
    NewLVL := RegExReplace(data[2], "[^0-9]", "")
    if (NewLVL < 1) {
      NewLVL := 1
    }
    if (StrLen(NewLVL)) {
      ReconViewerMaxLVL := NewLVL
      this.__usersListUpdate()
      
      addMessageToChatWindow("{FFFF00}Recon Viewer: {FFFFFF}������������ LVL ������� ��� ��������� ������ ��: {FFFF00}" NewLVL)
    } else {
      addMessageToChatWindow("{FFFF00}Recon Viewer: {FFFFFF}������� ������������ LVL ������� ��� ��������� - {FFFF00}" ReconViewerMaxLVL)
    }

    Return
  }

  changeTimeout(data)
  {
    global ReconViewerTimeout
    
    NewTimeout := RegExReplace(data[2], "[^0-9.]", "")
    if (StrLen(NewTimeout)) {
      if (NewTimeout < 1.2) {
        NewTimeout := 1.2
      }
      ReconViewerTimeout := NewTimeout

      if (this.__timerRunning) {
        SetTimer, ReconViewerTimer, % (ReconViewerTimeout * 1000)
      }
      
      addMessageToChatWindow("{FFFF00}Recon Viewer: {FFFFFF}����� ����� ������ ������� �������� ��: " NewTimeout " ������")
    } else {
      addMessageToChatWindow("{FFFF00}Recon Viewer: {FFFFFF}������� ����� ����� ������ ������� - {FFFF00}" ReconViewerTimeout " ������")
    }

    Return
  }
}

ReconViewer := new ReconViewer()

CMD.commands["rerun"] := "ReconViewer.start"
CMD.commands["restop"] := "ReconViewer.stop"
CMD.commands["relvl"] := "ReconViewer.changeLVL"
CMD.commands["retime"] := "ReconViewer.changeTimeout"

if (StrLen(ReconViewerNextKey)) {
  Hotkey, %ReconViewerNextKey%, ReconViewerNextHotKey
}

if (StrLen(ReconViewerPrevKey)) {
  Hotkey, %ReconViewerPrevKey%, ReconViewerPrevHotKey
}

if (StrLen(ReconViewerStartKey)) {
  Hotkey, %ReconViewerStartKey%, ReconViewerStartHotKey
}

if (StrLen(ReconViewerStopKey)) {
  Hotkey, %ReconViewerStopKey%, ReconViewerStopHotKey
}
