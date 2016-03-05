;;
;; LastSMS Plugin for AdminHelper.ahk
;; Description: ������ ��������� ����������� ������ �������� �� SMS ��� ����� Id �����������
;; Author: Danil Valov <danil@valov.me>
;; Version: 1.0b11 (Mar 06, 2015)
;; Required modules: SAMP-UDF-Ex, SendChatSavingMessage, Chatlog
;;

LastSMS =

LastSMSChatlogChecker(ChatlogString)
{
  global LastSMS, LastSMSOnlyReceivedBoolean

  if (SubStr(ChatlogString, 2, 5) = "SMS: " && (!LastSMSOnlyReceivedBoolean || InStr(ChatlogString, ". �����������: "))) {
    RegExMatch(SubStr(ChatlogString, StrLen(ChatlogString) - 3), "(\d){1,3}", LastSMSID)

    if (StrLen(LastSMSID)) {
      LastSMS := LastSMSID
    }
  }
}

Chatlog.checker.Insert("LastSMSChatlogChecker")

if (StrLen(LastSMSKey)) {
  Hotkey, %LastSMSKey%, LastSMSHotKey
}
