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

IgnoreList := ["Flazy_Fad", "Donny_Hayes", "Yann_Dobermann", "El_Capone", "Solomon_Adamov", "Vito_Anjello", "Emilio_Leon", "Alex_Nilsson", "Kamil_Boyka", "Vyacheslav_Ivankov", "Valik_Derevyanko", "Aleksey_Nechaev", "Alex_Merphy", "Aleksandro_Balotelli", "Vitaliy_Leonov", "Anton_Xabibullin", "John_Toronto", "Gabriele_Soto", "Richard_Alpert", "Theodore_Long", "Maga_Bagamaev", "Aidar_Valeyev", "Alessandro_Armani", "Maks_Kruger", "Alex_Deniro", "Lexa_Diablo", "Davi_Soto", "Nikita_Gryadunov", "Emmett_Hartley", "Mario_Brossi", "Filipp_Savchuk", "Serega_Sed", "Butter_Fly", "Benjamin_Stone", "Alek_Lester", "Diego_Revolt", "Zhenya_Bocharov", "Set_Willson", "Vladimir_Bondarenko", "Evgen_Kozlov", "Zhan_Dicaprio", "Sergio_Esteban", "Lee_Brooks", "Max_Hall", "Maks_River", "Maks_Sergeev", "Brian_Davis", "Marco_Barrosi", "Anton_Shkvarov", "Yoda_Sensei", "Mark_Vavillov", "Antonio_Mariarti", "Ruslan_Vlasov", "Doc_Elition", "Thomas_Versetti", "Tommy_Barbaro", "Roma_Mexanik", "Vovich_Robin", "Leonid_Litvinenko", "Erick_Miller", "Dima_Horow", "Kurt_Rock", "Igor_Doyal", "Phil_Galfond", "Christopher_Benitez", "Fill_Russel", "Roman_Hennesy", "Fedor_Manyc", "Johny_Fletcher", "Pavel_Snow", "Danya_Fox", "Christopher_Bell", "Alan_Hill", "Richard_Gun", "Vlados_Step", "Dave_Parker", "Mark_Laev", "Igor_Green", "Calvin_Anthony", "Aleks_Katsuba", "Antonio_Barbaro", "Alexey_Mikenin", "Frank_Zuzuka", "Ben_Grous", "Riccardo_Jerome", "Evgenie_Gluhov", "Alexandr_Sab", "Vadim_Gromov", "Yuriy_Baranov", "Jeffrey_Bradberry", "Aiden_Gastly", "Yurij_Taran", "Danil_Valov", "Enrique_Houston", "Diego_Aminatore", "Vladislav_Rudenko", "John_Markoff", "Frank_Lampard", "Viktor_Monetti", "Viktor_Myrazor", "Larvell_Jones", "Timon_Soto", "Maks_Collins", "Dmitry_Set", "Danny_Villa", "Mike_Rockstar", "Denis_Ochida", "El_Blok", "Dmitry_Norton", "Francesco_Valetti", "Groin_Axe", "Mike_Lowrens", "Kai_Wallker", "Link_Tao", "Fernando_Richardson", "Jason_Miller", "Leha_Vafiev", "Chan_Lee", "Arthur_Simpson", "Tony_Tweaker", "Adrien_Brody", "Javier_Villa", "Tobey_Marshall", "Shane_Nollan", "Jordan_West", "Terry_Jones", "Drake_Wallace", "Alex_Benelli", "Dany_Morgan", "Karlo_Bruno", "Denis_Volochay", "Max_Quiet", "Alfred_Lundberg", "Paul_Walker", "Apple_Purix", "Nik_Mariarti", "Tony_Malton", "Archie_White", "Melvin_River", "Zadrot_Info", "Santa_Claus"] ; ������ �������������, ������� ����� ���������� � ������ ������������, ������ ������� ������ � �.�.


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