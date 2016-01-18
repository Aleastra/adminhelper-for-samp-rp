;;
;; Config for AdminHelper.ahk
;; Author: Danil Valov <danil@valov.me>
;; Version: 1.0b5 (Jul 19, 2015)
;;


AdminLVL = 5                                     ; LVL �������������� (��� �������, �� ��������������� lvl'�, ���������� �������������)


;;   1 lvl

; ����� �� ��������� SMS
; (� ������ ����� ��������� ����� ���������: "/t [id_������_�_���������_���] ")

LastSMSKey = !vk54                               ; ������� (��-���������, Alt+T)

LastSMSOnlyReceivedBoolean = 0                   ; 1 - ��������� ������ ���������� ��������� (��� ������������)
				                                         ; 0 - ��������� � ����������, � ������������ ���������


; ����� �� ��������� ������
; (� ������ ����� ��������� ����� ���������: "/pm [id_������_�_���������_�������] ")

LastPMKey = !vk50                                ; ������� (��-���������, Alt+P)

LastPMOnlyReceivedBoolean = 0                    ; 1 - ��������� ������ ���������� ������� (��� �������)
				                                         ; 0 - ��������� � ���������� �������, � ������������ ������


; ����� ���������� ������, �������� �� ������ ��� ���� ��� �������� � ��������
; (� ������ ����� ��������� ����� ���������: "pm [id_����������_�����������_������] ")

PMToLastMuteOrDMKey = !vk55                      ; ������� (��-���������, Alt+U)


;;   2 lvl

; TagName (WH)

TagNameAutostartBoolean = 1                      ; 1 - ������������� ��������� TagName ��� ������ �������
                                                 ; 0 - �� ��������� ������������� (��������� ������ ����� ����� `/wh` � ����)


; AutoHP

AutoHPMinHP = 95                                 ; ���������� HP, ��� ������� ����� ����������� ������ (��-���������, 95)

AutoHPTimeout = 10                               ; ���������� � �������� ����� �������������� ��������� HP (��-���������, 10)

AutoHPAutostartBoolean = 1                       ; 1 - ������������� ��������� AutoHP ��� ������ �������
                                                 ; 0 - �� ��������� ������������� (��������� ������ ����� ����� `/autohp` (`/ahp`) � ����)

AutoHPMessageBoolean = 1                         ; 1 - �������� ���������, ������������ � ������ �������������� ���������� HP
                                                 ; 0 - �� �������� ���������


; Recon

;; ������������ � ID, ���������� � ������ ���������� �������
;; (������������� ������ ������� � ������� � ������)

ReconLastPMKey = Numpad2                         ; ������� (��-���������, NumPad2)

;; ������������ � ID � ��������� Warning'�

ReconLastWarningKey = Numpad3                    ; ������� (��-���������, NumPad3)


; Recon Viewer

ReconViewerMaxLVL = 3                            ; ������������ LVL ������� ��� ��������� ����� Recon Viewer (��-���������, 3)

ReconViewerTimeout = 5                           ; ����� � �������� ����� �������������� ��������� ���������� ������� ����� Recon (��-���������, 5)

ReconViewerNextKey = !vkBE                       ; ������� ������������ �� ���������� �� ID ������ (��-���������, Alt+�)

ReconViewerPrevKey = !vkBC                       ; ������� ������������ �� ����������� �� ID ������ (��-���������, Alt+�)

;; ��������� �������������� ��������� �������� ������� ����� Recon

ReconViewerStartKey = !vk4C                      ; ������� ������� ����� (��-���������, Alt+L)

ReconViewerStopKey = !vk4B                       ; ������� ��������� ����� (��-���������, Alt+K)


; Ignore List

IgnoreList := ["Flazy_Fad", "Donny_Hayes", "Yann_Dobermann", "El_Capone", "Jame_Smith", "Vito_Anjello", "Dale_Farrell", "Alex_Nilsson", "Denis_Fat", "Kamil_Boyka", "Vyacheslav_Ivankov", "Aleksey_Nechaev", "Alex_Merphy", "Aleksandro_Balotelli", "Vitaliy_Leonov", "Anton_Xabibullin", "John_Toronto", "Gabriele_Soto", "Richard_Alpert", "Theodore_Long", "Maga_Bagamaev", "Aidar_Valeyev", "Alessandro_Armani", "Maks_Kruger", "Alex_Deniro", "Lexa_Diablo", "Nikita_Gryadunov", "Emmett_Hartley", "Mario_Brossi", "Filipp_Savchuk", "Serega_Sed", "Fernando_Freeman", "Butter_Fly", "Benjamin_Stone", "Alek_Lester", "Chilly_Villi", "Zhenya_Bocharov", "Vladimir_Bondarenko", "Evgen_Kozlov", "Zhan_Dicaprio", "Lee_Brooks", "Max_Hall", "Maks_River", "Maks_Sergeev", "Brian_Davis", "Marco_Barrosi", "Anton_Shkvarov", "Yoda_Sensei", "Antonio_Mariarti", "Ruslan_Vlasov", "Thomas_Versetti", "Roma_Mexanik", "Vovich_Robin", "Leonid_Litvinenko", "Artem_Keepers", "Erick_Miller", "Dima_Horow", "Jonathan_Armstrong", "Igor_Doyal", "Phil_Galfond", "Christopher_Benitez", "Fill_Russel", "Roman_Hennesy", "Fedor_Manyc", "Johny_Fletcher", "Pavel_Snow", "Danya_Fox", "Christopher_Bell", "Pavel_Pustyakov", "Alexander_Briliante", "Richard_Gun", "Vlados_Step", "Dave_Parker", "Arian_Cross", "Mark_Laev", "Igor_Green", "Calvin_Anthony", "Antonio_Barbaro", "Mark_Hoffman", "Alexey_Mikenin", "Santiago_Talerte", "Slevin_Kelevra", "Roman_Hadson", "Ben_Grous", "Alfa_Rhino", "Chris_Ramsey", "Samuel_Duarte", "Riccardo_Jerome", "Evgenie_Gluhov", "Alexandr_Sab", "Vadim_Gromov", "Yuriy_Baranov", "Jeffrey_Bradberry", "Aiden_Gastly", "Yurij_Taran", "Danil_Valov", "Enrique_Houston", "Vladislav_Rudenko", "John_Markoff", "Frank_Lampard", "Viktor_Monetti", "Viktor_Myrazor", "Vadima_Norman", "Larvell_Jones", "Timon_Soto", "Maks_Collins", "Mike_Rockstar", "Denis_Ochida", "Dmitry_Norton", "Francesco_Valetti", "Clyde_Pringles", "Frank_Blubery", "Groin_Axe", "Mike_Lowrens", "Vlad_Biernatskii", "Link_Tao", "Fernando_Richardson", "Filipp_Kane", "Dave_Smit", "Alexis_Ronka", "Arthur_Simpson", "Tony_Tweaker", "Tobey_Marshall", "Marat_Rezapov", "Shane_Nollan", "Jordan_West", "Norman_Osborn", "Terry_Jones", "Chris_Milton", "Alex_Benelli", "Dany_Morgan", "Djon_Smith", "Karlo_Bruno", "Mark_Cole", "Denis_Volochay", "David_Cameron", "Viktor_Scott", "Apple_Purix", "Nik_Mariarti", "Tony_Malton", "Derrick_Hoover", "Archie_White", "Zadrot_Info"] ; ������ �������������, ������� ����� ���������� � ������ ������������, ������ ������� ������ � �.�.


;;   3 lvl

; BanIP

BanIPKey = !Numpad9                              ; ������� ���� �� IP ���������� ����������� ������ (��-���������, Alt+NumPad9)

BanIPGetIPUsersBoolean = 1                       ; 1 - �������� ������ ������������� ������ � ���� �� IP ����� ������� ������ ���� �� IP
                                                 ; 0 - �� �������� ������ ������������� ������


;;   4 lvl

GetIPKey = +!vk49                                ; ������� ��������� �������������� �� IP � ���� (��-���������, Shift+Alt+I)

GetIPToAdminChatBoolean = 1                      ; 1 - ���������� ������ � �������������� ������ � ��������
                                                 ; 0 - �� ���������� ������ � �������������� ������ � ��������

GetIPSetNikKey = +!vk6F                          ; ������� ��������� �������������� ������, ������������ ������ �� ����� ���� (��-���������, Shift+Alt+Numpad "/")

;;   5 lvl

; Uninvites

UninvitesListFile = UninvitesList.ini                ; ���� �� ������� ������� ��� ���������� � Offline �������� `/listuninvites`


;Hbj

HbjListFile = HbjectsList.ini                        ; ���� �� ������� ��������, ���������� �� ������� �������� `/hbj [id] [��������_�������]`