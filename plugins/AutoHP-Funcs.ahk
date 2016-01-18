;;
;; AutoHP Plugin for AdminHelper.ahk
;; Description: ������ ������������� ��������� ���� �������� ����� ������� /hp, ����� ��� ���������� ���� ����������� �������
;; CMD: /ahk, /autohp, /ahptime, /ahpmin
;; Author: Danil Valov <danil@valov.me>
;; Version: 1.0b3 (Apr 22, 2015)
;; Required modules: SAMP-UDF-Ex
;;

class AutoHP
{
  __starting := 0
  __running := 0

  start()
  {
    global AutoHPTimeout

    if (!this.__starting) {
      this.__starting := 1

      SetTimer, AutoHPTimer, % (AutoHPTimeout * 1000)

      addMessageToChatWindow("{FFFF00}�������������� ���������� HP ��������")
    }

    Return
  }

  stop()
  {
    if (this.__starting) {
      this.__starting := 0

      SetTimer, AutoHPTimer, Off

      addMessageToChatWindow("{FF0000}�������������� ���������� HP �����������")
    }

    Return
  }

  toggle()
  {
    if (!this.__starting) {
      this.start()
    } else {
      this.stop()
    }

    Return
  }

  changeMinHP(Data)
  {
    global AutoHPMinHP

    NewMinHP := RegExReplace(Data[2], "[^0-9]", "")

    if (StrLen(NewMinHP) && NewMinHP >= 1 && NewMinHP < 100) {
      AutoHPMinHP := NewMinHP
    } else {
      if (!StrLen(NewMinHP)) {
        addMessageToChatWindow("{FF0000}�� �� ������� ������������ ���������� HP.")
      } else {
        addMessageToChatWindow("{FF0000}�� ������� ������������ �������� ���������� HP. ���������� �������� - �� 1 �� 99.")
      }
    }

    Return
  }

  changeTime(Data)
  {
    global AutoHPTimeout

    NewTime := RegExReplace(Data[2], "[^0-9]", "")

    if (StrLen(NewTime)) {
      AutoHPTimeout := NewTime

      if (!this.__starting) {
        this.start()
      } else {
        SetTimer, AutoHPTimer, % (AutoHPTimeout * 1000)

        addMessageToChatWindow("{FFFF00}�������� �������� HP �������. ������ HP ����� ����������� ������ " NewTime " ������(�)")
      }
    } else {
      addMessageToChatWindow("{FF0000}�� �� ������� ���������� ������")
    }

    Return
  }

  timer()
  {
    global AutoHPMinHP, AutoHPMessageBoolean

    if (getPlayerHealth() > -1 && getPlayerHealth() < AutoHPMinHP) {
      sendChatMessage("/hp")
      if (AutoHPMessageBoolean) {
        addMessageToChatWindow("{FFFF00}����� HP �������� �������������")
      }
    }

    Return
  }
}

AutoHP := new AutoHP()

if (AutoHPAutostartBoolean) {
  AutoHP.start()
}

CMD.commands["ahp"] := "AutoHP.toggle"
CMD.commands["autohp"] := "AutoHP.toggle"
CMD.commands["ahptime"] := "AutoHP.changeTime"
CMD.commands["ahpmin"] := "AutoHP.changeMinHP"
