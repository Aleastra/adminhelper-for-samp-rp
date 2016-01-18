;;
;; PMToLastMuteOrDM Plugin for AdminHelper.ahk
;; Description: ������ ��������� ����������� ������ �������� ������, �������� �� ������ ��� ������ �� ��� �������� � ��
;; Author: Danil Valov <danil@valov.me>
;; Version: 1.0b (Apr 18, 2015)
;; Required modules: SAMP-UDF-Ex, SendChatSavingMessage, Chatlog, SAMP-UsersListUpdater
;;

PMToLastMuteOrDMHotKey:
{
  Chatlog.reader()

  if (StrLen(PMToLastMuteOrDM)) {
    sendChatSavingMessage("/pm " PMToLastMuteOrDM, False)
  } else {
    sendChatSavingMessage("/pm", False)
  }

  Return
}
