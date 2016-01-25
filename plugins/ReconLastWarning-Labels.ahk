;;
;; ReconLastWarning Plugin for AdminHelper.ahk
;; Description: ������ ��������� ����������� ������ ������������ � ID, ���������� � ��������� Warning'�
;; Author: Danil Valov <danil@valov.me>
;; Version: 1.0b (Apr 04, 2015)
;; Required modules: SAMP-UDF-Ex, SendChatSavingMessage, Chatlog
;;

ReconLastWarningHotKey:
{
  Chatlog.reader()

  if (StrLen(ReconLastWarning)) {
    sendChatSavingMessage("/re " ReconLastWarning)
  } else {
    sendChatSavingMessage("/re", False)
  }

  Return
}
