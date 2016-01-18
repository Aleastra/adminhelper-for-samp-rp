;;
;; ReconLastPM Plugin for AdminHelper.ahk
;; Description: ������ ��������� ����������� ������ ������������ � ID, ���������� � ��������� ������ � ������
;; Author: Danil Valov <danil@valov.me>
;; Version: 1.0b8 (Jan 19, 2015)
;; Required modules: SAMP-UDF-Ex, SendChatSavingMessage, Chatlog
;;

ReconLastPMHotKey:
{
  Chatlog.reader()
  
  if (StrLen(ReconLastPM)) {
    sendChatSavingMessage("/re " ReconLastPM)
  } else {
    sendChatSavingMessage("/re", False)
  }

  Return
}
