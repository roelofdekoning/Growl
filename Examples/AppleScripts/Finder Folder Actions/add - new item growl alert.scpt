FasdUAS 1.101.10   ��   ��    k             l      �� ��   NH
New Item Alert


For the Folder Notification scripts to work, they have to be placed in "Scripts/Folder Action Scripts" ... either in /Library or ~/Library. After placing them there, right-click on the folder for which you want notifications and choose "Attach a Folder Action."



Based on ADD - NEW ITEM ALERT (�2002 Apple Computer)

This Folder Action script is designed for use with Mac OS X version 10.2 and higher.

This Folder Action handler is triggered whenever items are added to the attached folder.  The script will display an alert 
containing the number of items added
       	  l     ������  ��   	  
  
 i         I     ��  
�� .facofget****      � ****  o      ���� 0 this_folder    �� ��
�� 
flst  o      ���� 0 added_items  ��    Q     h  ��  k    _       O        k           l   �� ��      get the name of the folder      ��  r        l   
 ��  n    
   !   1    
��
�� 
pnam ! o    ���� 0 this_folder  ��    l      "�� " o      ���� 0 folder_name  ��  ��    m     # #�null     ߀��  

Finder.app��`� �0��Ȑ 7��Ԑ���� ]`0   )       *(�� ��԰ bMACS   alis    `  kremit                     ��=)H+    

Finder.app                                                       2����;        ����  	                CoreServices    �Ãy      ���      
  
  
  -kremit:System:Library:CoreServices:Finder.app    
 F i n d e r . a p p    k r e m i t  &System/Library/CoreServices/Finder.app  / ��     $ % $ l   ������  ��   %  & ' & r     ( ) ( n    * + * I    �� ,���� 0 alias_to_url alias_to_URL ,  -�� - o    ���� 0 this_folder  ��  ��   +  f     ) o      ���� 0 folder_icon   '  . / . l   ������  ��   /  0 1 0 r     2 3 2 l    4�� 4 n     5 6 5 m    ��
�� 
nmbr 6 n    7 8 7 2   ��
�� 
cobj 8 l    9�� 9 o    ���� 0 added_items  ��  ��   3 l      :�� : o      ���� 0 
item_count  ��   1  ; < ; Z    6 = >�� ? = ?   " @ A @ l     B�� B o     ���� 0 
item_count  ��   A m     !����  > k   % , C C  D E D r   % ( F G F m   % & H H  s    G o      ���� 0 	plurality   E  I�� I r   ) , J K J m   ) * L L 
 have    K o      ���� 0 	have_verb  ��  ��   ? k   / 6 M M  N O N r   / 2 P Q P m   / 0 R R       Q o      ���� 0 	plurality   O  S�� S r   3 6 T U T m   3 4 V V 	 has    U o      ���� 0 	have_verb  ��   <  W X W l  7 7������  ��   X  Y Z Y r   7 @ [ \ [ b   7 > ] ^ ] b   7 < _ ` _ b   7 : a b a m   7 8 c c  New File    b o   8 9���� 0 	plurality   ` m   : ; d d 
  in     ^ l  < = e�� e o   < =���� 0 folder_name  ��   \ o      ���� 0 thetitle theTitle Z  f g f r   A P h i h b   A N j k j b   A L l m l b   A J n o n b   A H p q p b   A F r s r l  A D t�� t c   A D u v u l  A B w�� w o   A B���� 0 
item_count  ��   v m   B C��
�� 
ctxt��   s m   D E x x   item    q o   F G���� 0 	plurality   o m   H I y y       m o   J K���� 0 	have_verb   k m   L M z z   been added.    i o      ���� 0 thetext theText g  { | { l  Q Q������  ��   |  } ~ } I   Q ]�� ���� 0 growlnotify GrowlNotify   � � � o   R S���� 0 thetitle theTitle �  � � � o   S T���� 0 thetext theText �  � � � m   T U � �  icon of file    �  � � � o   U V���� 0 folder_icon   �  ��� � m   V W��
�� boovfals��  ��   ~  ��� � l  ^ ^������  ��  ��    R      ������
�� .ascrerr ****      � ****��  ��  ��     � � � l     ������  ��   �  � � � i     � � � I      �� ����� 0 growlnotify GrowlNotify �  � � � o      ���� 0 thetitle theTitle �  � � � o      ���� 0 thetext theText �  � � � o      ���� 0 	imagetype 	imageType �  � � � o      ����  0 imagespecifier imageSpecifier �  ��� � o      ���� 
0 sticky  ��  ��   � k     � � �  � � � O     � � � r     � � � l 	   ��� � l    ��� � I   �� ���
�� .corecnte****       **** � l    ��� � 6    � � � 2   ��
�� 
pcap � l    ��� � =    � � � 1   	 ��
�� 
pnam � l 
   ��� � m     � �  GrowlHelperApp   ��  ��  ��  ��  ��  ��   � o      ���� 0 growlrunning GrowlRunning � m      � ��null     ߀��  
System Events.app���� 7��ՠ���� ]`(   )       *(�� ���� bsevs   alis    |  kremit                     ��=)H+    
System Events.app                                                Z�����        ����  	                CoreServices    �Ãy      ��<      
  
  
  4kremit:System:Library:CoreServices:System Events.app  $  S y s t e m   E v e n t s . a p p    k r e m i t  -System/Library/CoreServices/System Events.app   / ��   �  � � � l   ������  ��   �  � � � Z    � � ��� � � @     � � � o    ���� 0 growlrunning GrowlRunning � m    ����  � k    g � �  � � � r    + � � � b    ) � � � b    ' � � � b    % � � � b    # � � � b    ! � � � l 	   ��� � m     � �  notify with title "   ��   � o     ���� 0 thetitle theTitle � m   ! " � �  "     � l 	 # $ ��� � m   # $ � �  description "   ��   � o   % &���� 0 thetext theText � m   ' ( � �  "    � o      ���� 0 notifycommand notifyCommand �  � � � l  , ,������  ��   �  � � � Z   , K � ����� � F   , 7 � � � >   , / � � � o   , -���� 0 	imagetype 	imageType � m   - . � �       � >   2 5 � � � o   2 3����  0 imagespecifier imageSpecifier � m   3 4 � �       � r   : G � � � b   : E � � � b   : C � � � b   : A � � � b   : ? � � � b   : = � � � o   : ;���� 0 notifycommand notifyCommand � l 	 ; < ��� � m   ; < � �      ��   � o   = >���� 0 	imagetype 	imageType � m   ? @ � �   "    � o   A B����  0 imagespecifier imageSpecifier � m   C D � �  "    � o      ���� 0 notifycommand notifyCommand��  ��   �  � � � l  L L������  ��   �  � � � l  L L�� ���   � * $ work around AppleScript's potential    �  � � � l  L L�� ���   � ' ! "Where is GrowlHelperApp" dialog    �  � � � r   L Q � � � m   L O � �  GrowlHelperApp    � o      ���� 
0 gha GHA �  ��� � O  R g � � � I  [ f�� ���
�� .sysodsct****        scpt � b   [ b � � � b   [ ` � � � l 	 [ \ ��� � o   [ \���� 0 notifycommand notifyCommand��   � m   \ _    sticky     � o   ` a���� 
0 sticky  ��   � 4   R X��
�� 
capp o   V W���� 
0 gha GHA��  ��   � I  j ���
�� .sysodlogaskr        TEXT b   j u b   j s b   j o	 o   j k���� 0 thetitle theTitle	 o   k n��
�� 
ret  o   o r�
� 
ret  o   s t�~�~ 0 thetext theText �}

�} 
btns
 J   x } �| m   x {  OK   �|   �{�z
�{ 
dflt m   � ��y�y �z   � �x l  � ��w�v�w  �v  �x   �  l     �u�t�u  �t    l     �s�s   / ) translate a file alias to a file:/// URL     i     I      �r�q�r 0 alias_to_url alias_to_URL �p o      �o�o 0 	this_file  �p  �q   k     R  r       c     !"! n     #$# 1    �n
�n 
psxp$ o     �m�m 0 	this_file  " m    �l
�l 
ctxt  o      �k�k 0 	this_file   %&% r    '(' m    	))  /   ( n     *+* 1   
 �j
�j 
txdl+ 1   	 
�i
�i 
ascr& ,-, r    ./. n    010 2    �h
�h 
citm1 o    �g�g 0 	this_file  / l     2�f2 o      �e�e 0 path_segments  �f  - 343 Y    ;5�d67�c5 k   " 688 9:9 r   " (;<; n   " &=>= 4   # &�b?
�b 
cobj? o   $ %�a�a 0 i  > l  " #@�`@ o   " #�_�_ 0 path_segments  �`  < o      �^�^ 0 this_segment  : A�]A r   ) 6BCB l 	 ) 1D�\D n  ) 1EFE I   * 1�[G�Z�[ 0 encode_text  G HIH o   * +�Y�Y 0 this_segment  I JKJ m   + ,�X
�X boovtrueK L�WL m   , -�V
�V boovfals�W  �Z  F  f   ) *�\  C n      MNM 4   2 5�UO
�U 
cobjO o   3 4�T�T 0 i  N l  1 2P�SP o   1 2�R�R 0 path_segments  �S  �]  �d 0 i  6 m    �Q�Q 7 l   Q�PQ I   �OR�N
�O .corecnte****       ****R l   S�MS o    �L�L 0 path_segments  �M  �N  �P  �c  4 TUT r   < AVWV m   < =XX  /   W n     YZY 1   > @�K
�K 
txdlZ 1   = >�J
�J 
ascrU [\[ r   B G]^] c   B E_`_ l  B Ca�Ia o   B C�H�H 0 path_segments  �I  ` m   C D�G
�G 
TEXT^ o      �F�F 0 	this_file  \ bcb r   H Mded m   H Iff      e n     ghg 1   J L�E
�E 
txdlh 1   I J�D
�D 
ascrc i�Ci L   N Rjj b   N Qklk m   N Omm  file://   l o   O P�B�B 0 	this_file  �C   non l     �A�@�A  �@  o pqp l     �?r�?  r 9 3 encode spaces and other unsafe characters in a URL   q sts i    uvu I      �>w�=�> 0 
encode_url 
encode_URLw x�<x o      �;�; 0 this_url this_URL�<  �=  v k     Hyy z{z r     |}| c     ~~ o     �:�: 0 this_url this_URL m    �9
�9 
ctxt} o      �8�8 0 this_url this_URL{ ��� r    ��� m    ��  /   � n     ��� 1    
�7
�7 
txdl� 1    �6
�6 
ascr� ��� r    ��� n    ��� 2    �5
�5 
citm� o    �4�4 0 this_url this_URL� l     ��3� o      �2�2 0 path_segments  �3  � ��� Y    9��1���0� k     4�� ��� r     &��� n     $��� 4   ! $�/�
�/ 
cobj� o   " #�.�. 0 i  � l    !��-� o     !�,�, 0 path_segments  �-  � o      �+�+ 0 this_segment  � ��*� r   ' 4��� l 	 ' /��)� n  ' /��� I   ( /�(��'�( 0 encode_text  � ��� o   ( )�&�& 0 this_segment  � ��� m   ) *�%
�% boovtrue� ��$� m   * +�#
�# boovfals�$  �'  �  f   ' (�)  � n      ��� 4   0 3�"�
�" 
cobj� o   1 2�!�! 0 i  � l  / 0�� � o   / 0�� 0 path_segments  �   �*  �1 0 i  � m    �� � l   ��� I   ���
� .corecnte****       ****� l   ��� o    �� 0 path_segments  �  �  �  �0  � ��� r   : ?��� c   : =��� l  : ;��� o   : ;�� 0 path_segments  �  � m   ; <�
� 
TEXT� o      �� 0 this_url this_URL� ��� r   @ E��� m   @ A��      � n     ��� 1   B D�
� 
txdl� 1   A B�
� 
ascr� ��� L   F H�� o   F G�� 0 this_url this_URL�  t ��� l     ���  �  � ��� i    ��� I      ���� 0 encode_text  � ��� o      �� 0 	this_text  � ��� o      �� 0 encode_url_a encode_URL_A� ��
� o      �	�	 0 encode_url_b encode_URL_B�
  �  � k     f�� ��� r     ��� l 	   ��� m     �� * $abcdefghijklmnopqrstuvwxyz0123456789   �  � l     ��� o      �� 0 standard_characters  �  � ��� r    ��� m    ��  $+!'/?;&@=#%><{}[]"~`^\|*   � l     ��� o      �� 0 url_a_chars URL_A_chars�  � ��� r    ��� m    	�� 
 .-_:   � l     ��� o      �� 0 url_b_chars URL_B_chars�  � ��� r    ��� l   ��� o    � �  0 standard_characters  �  � l     ���� o      ���� 0 acceptable_characters  ��  � ��� Z   ������� =   ��� o    ���� 0 encode_url_a encode_URL_A� m    ��
�� boovfals� l 	  ���� r    ��� b    ��� l 	  ���� l   ���� o    ���� 0 acceptable_characters  ��  ��  � l   ���� o    ���� 0 url_a_chars URL_A_chars��  � l     ���� o      ���� 0 acceptable_characters  ��  ��  ��  ��  � ��� Z    /������� =    #��� o     !���� 0 encode_url_b encode_URL_B� m   ! "��
�� boovfals� l 	 & +���� r   & +��� b   & )��� l 	 & '���� l  & ' ��  o   & '���� 0 acceptable_characters  ��  ��  � l  ' (�� o   ' (���� 0 url_b_chars URL_B_chars��  � l     �� o      ���� 0 acceptable_characters  ��  ��  ��  ��  �  r   0 3 m   0 1       l     �� o      ���� 0 encoded_text  ��   	
	 X   4 c�� Z   D ^�� E  D G l  D E�� o   D E���� 0 acceptable_characters  ��   o   E F���� 0 	this_char   r   J O l  J M�� b   J M l  J K�� o   J K���� 0 encoded_text  ��   o   K L���� 0 	this_char  ��   l     �� o      ���� 0 encoded_text  ��  ��   r   R ^ c   R \ l  R Z�� b   R Z  l  R S!��! o   R S���� 0 encoded_text  ��    l 	 S Y"��" I   S Y��#���� 0 encode_char  # $��$ o   T U���� 0 	this_char  ��  ��  ��  ��   m   Z [��
�� 
TEXT l     %��% o      ���� 0 encoded_text  ��  �� 0 	this_char   o   7 8���� 0 	this_text  
 &��& L   d f'' l  d e(��( o   d e���� 0 encoded_text  ��  ��  � )*) l     ������  ��  * +��+ i    ,-, I      ��.���� 0 encode_char  . /��/ o      ���� 0 	this_char  ��  ��  - k     K00 121 r     343 l    5��5 l    6��6 I    ��7��
�� .sysoctonshor       TEXT7 o     ���� 0 	this_char  ��  ��  ��  4 l     8��8 o      ���� 0 	ascii_num 	ASCII_num��  2 9:9 r     ;<; l 	  =��= J    >> ?@? m    	AA  0   @ BCB m   	 
DD  1   C EFE m   
 GG  2   F HIH m    JJ  3   I KLK m    MM  4   L NON m    PP  5   O QRQ m    SS  6   R TUT l 	  V��V m    WW  7   ��  U XYX m    ZZ  8   Y [\[ m    ]]  9   \ ^_^ m    ``  A   _ aba m    cc  B   b ded m    ff  C   e ghg m    ii  D   h jkj l 	  l��l m    mm  E   ��  k n��n m    oo  F   ��  ��  < l     p��p o      ���� 0 hex_list  ��  : qrq r   ! /sts n   ! -uvu 4   " -��w
�� 
cobjw l  % ,x��x [   % ,yzy l  % *{��{ _   % *|}| o   % &���� 0 	ascii_num 	ASCII_num} m   & )���� ��  z m   * +���� ��  v l  ! "~��~ o   ! "���� 0 hex_list  ��  t o      ���� 0 x  r � r   0 >��� n   0 <��� 4   1 <���
�� 
cobj� l  4 ;���� [   4 ;��� l  4 9���� `   4 9��� o   4 5���� 0 	ascii_num 	ASCII_num� m   5 8���� ��  � m   9 :���� ��  � l  0 1���� o   0 1���� 0 hex_list  ��  � o      ���� 0 y  � ���� L   ? K�� c   ? J��� l  ? F���� b   ? F��� b   ? D��� m   ? B��  %   � o   B C���� 0 x  � o   D E���� 0 y  ��  � m   F I��
�� 
TEXT��  ��       �����������  � ������������
�� .facofget****      � ****�� 0 growlnotify GrowlNotify�� 0 alias_to_url alias_to_URL�� 0 
encode_url 
encode_URL�� 0 encode_text  �� 0 encode_char  � �� ��������
�� .facofget****      � ****�� 0 this_folder  �� ������
�� 
flst�� 0 added_items  ��  � 	�������������������� 0 this_folder  �� 0 added_items  �� 0 folder_name  �� 0 folder_icon  �� 0 
item_count  �� 0 	plurality  �� 0 	have_verb  �� 0 thetitle theTitle�� 0 thetext theText�  #�������� H L R V c d�� x y z ��������
�� 
pnam�� 0 alias_to_url alias_to_URL
�� 
cobj
�� 
nmbr
�� 
ctxt�� �� 0 growlnotify GrowlNotify��  �  �� i a� ��,E�UO)�k+ E�O��-�,E�O�k �E�O�E�Y 	�E�O�E�O�%�%�%E�O��&�%�%�%�%�%E�O*���fa + OPW X  h� �~ ��}�|���{�~ 0 growlnotify GrowlNotify�} �z��z �  �y�x�w�v�u�y 0 thetitle theTitle�x 0 thetext theText�w 0 	imagetype 	imageType�v  0 imagespecifier imageSpecifier�u 
0 sticky  �|  � �t�s�r�q�p�o�n�m�t 0 thetitle theTitle�s 0 thetext theText�r 0 	imagetype 	imageType�q  0 imagespecifier imageSpecifier�p 
0 sticky  �o 0 growlrunning GrowlRunning�n 0 notifycommand notifyCommand�m 
0 gha GHA�  ��l��k ��j � � � � � ��i � � � ��h �g�f�e�d�c�b
�l 
pcap�  
�k 
pnam
�j .corecnte****       ****
�i 
bool
�h 
capp
�g .sysodsct****        scpt
�f 
ret 
�e 
btns
�d 
dflt�c 
�b .sysodlogaskr        TEXT�{ �� *�-�[�,\Z�81j E�UO�k N�%�%�%�%�%E�O��	 ���& ��%�%�%�%�%E�Y hOa E�O*a �/ �a %�%j UY �_ %_ %�%a a kva ka  OP� �a�`�_���^�a 0 alias_to_url alias_to_URL�` �]��] �  �\�\ 0 	this_file  �_  � �[�Z�Y�X�[ 0 	this_file  �Z 0 path_segments  �Y 0 i  �X 0 this_segment  � �W�V)�U�T�S�R�Q�PX�Ofm
�W 
psxp
�V 
ctxt
�U 
ascr
�T 
txdl
�S 
citm
�R .corecnte****       ****
�Q 
cobj�P 0 encode_text  
�O 
TEXT�^ S��,�&E�O���,FO��-E�O &k�j kh ��/E�O)�efm+ ��/F[OY��O���,FO��&E�O���,FO�%� �Nv�M�L���K�N 0 
encode_url 
encode_URL�M �J��J �  �I�I 0 this_url this_URL�L  � �H�G�F�E�H 0 this_url this_URL�G 0 path_segments  �F 0 i  �E 0 this_segment  � 
�D��C�B�A�@�?�>�=�
�D 
ctxt
�C 
ascr
�B 
txdl
�A 
citm
�@ .corecnte****       ****
�? 
cobj�> 0 encode_text  
�= 
TEXT�K I��&E�O���,FO��-E�O &k�j kh ��/E�O)�efm+ ��/F[OY��O��&E�O���,FO�� �<��;�:���9�< 0 encode_text  �; �8��8 �  �7�6�5�7 0 	this_text  �6 0 encode_url_a encode_URL_A�5 0 encode_url_b encode_URL_B�:  � 	�4�3�2�1�0�/�.�-�,�4 0 	this_text  �3 0 encode_url_a encode_URL_A�2 0 encode_url_b encode_URL_B�1 0 standard_characters  �0 0 url_a_chars URL_A_chars�/ 0 url_b_chars URL_B_chars�. 0 acceptable_characters  �- 0 encoded_text  �, 0 	this_char  � 	����+�*�)�(�'
�+ 
kocl
�* 
cobj
�) .corecnte****       ****�( 0 encode_char  
�' 
TEXT�9 g�E�O�E�O�E�O�E�O�f  
��%E�Y hO�f  
��%E�Y hO�E�O .�[��l kh �� 
��%E�Y �*�k+ %�&E�[OY��O�� �&-�%�$���#�& 0 encode_char  �% �"��" �  �!�! 0 	this_char  �$  � � �����  0 	this_char  � 0 	ascii_num 	ASCII_num� 0 hex_list  � 0 x  � 0 y  � �ADGJMPSWZ]`cfimo����
� .sysoctonshor       TEXT� 
� 
cobj
� 
TEXT�# L�j  E�O���������������a a vE�O�a �a "k/E�O�a �a #k/E�Oa �%�%a &ascr  ��ޭ