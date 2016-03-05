;;
;; LastPM Plugin for AdminHelper.ahk
;; Description: ������ ��������� ����������� ������ �������� �� ������� ��� ����� Id ����������� ������
;; Author: Danil Valov <danil@valov.me>
;; Version: 1.0b11 (Mar 06, 2015)
;; Required modules: SAMP-UDF-Ex, SendChatSavingMessage, Chatlog
;;

LastPM =
LastSetNik =

LastPMChatlogChecker(ChatlogString)
{
  global LastPM, LastSetNik, LastPMOnlyReceivedBoolean

  NickName :=

  if (SubStr(ChatlogString, 2, StrLen("������ �� ")) = "������ �� ") {
    NickName := SubStr(Trim(ChatlogString), StrLen("������ �� ") + 1)
    NickName := SubStr(Trim(NickName), 1, InStr(Trim(NickName), ": ") - 1)
    NickName := Trim(NickName)
  } else if (SubStr(ChatlogString, 2, StrLen("������ �� ")) = "������ �� ") {
    NickName := SubStr(Trim(ChatlogString), StrLen("������ �� ") + 1)
    NickName := SubStr(Trim(NickName), 1, InStr(Trim(NickName), " ") - 1)
    NickName := Trim(NickName)
  } else if (!LastPMOnlyReceivedBoolean && SubStr(ChatlogString, 1, StrLen("<-����� �")) = "<-����� �") {
    NickName := SubStr(Trim(ChatlogString), StrLen("<-����� �") + 1)
    NickName := SubStr(Trim(NickName), 1, InStr(Trim(NickName), ": ") - 1)
    NickName := Trim(NickName)
  } else if (SubStr(Trim(ChatlogString), 1, StrLen("[������ �� ����� ����]")) = "[������ �� ����� ����]" && InStr(ChatlogString, "������ ������� ��� ��:")) {
    NickName := SubStr(ChatlogString, InStr(ChatlogString, "[������ �� ����� ����] ") + StrLen("[������ �� ����� ����] "))
    NickName := SubStr(NickName, 1, InStr(NickName, "������ ������� ��� ��:") - 1)
    NickName := Trim(NickName)
  } else if (SubStr(Trim(ChatlogString), 1, StrLen("->������")) = "->������") {
    NickName := SubStr(Trim(ChatlogString), StrLen("->������") + 1)
    NickName := SubStr(Trim(NickName), 1, InStr(Trim(NickName), ": ") - 1)
    NickName := Trim(NickName)
  }

  if (StrLen(NickName)) {
    RegExMatch(NickName, "\[(\d){1,3}]", LastPMID)
    if (StrLen(LastPMID)) {
      Id := SubStr(LastPMID, 2, -1)
    } else if (StrLen(NickName)) {
      Id := getPlayerIdByName(NickName)
    }

    if (!StrLen(Id) && StrLen(NickName) >= 0) {
      hardUpdateOScoreboardData()
      Sleep 500
      Id := getPlayerIdByName(NickName)
    }

    if (StrLen(Id) && Id >= 0) {
      LastPM := Id

      if (SubStr(Trim(ChatlogString), 1, 22) = "[������ �� ����� ����]" && InStr(ChatlogString, "������ ������� ��� ��:")) {
        LastSetNik := Id
      }
    }
  }
}

Chatlog.checker.Insert("LastPMChatlogChecker")

if (StrLen(LastPMKey)) {
  Hotkey, %LastPMKey%, LastPMHotKey
}
