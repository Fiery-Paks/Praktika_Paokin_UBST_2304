   M S B A M L   `   `   `  ����N  JWpfAppUserInterface, Version=1.0.0.0, Culture=neutral, PublicKeyToken=nullE'clr-namespace:WpfAppUserInterface.PagesWpfAppUserInterface.Pages  5   	   /    )WpfAppUserInterface.Pages.WindowWeighings   5   	   W SPresentationCore, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35e aSystem.Windows.Controls.Ribbon, Version=8.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089R NWindowsBase, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35F 9http://schemas.microsoft.com/winfx/2006/xaml/presentation     5   	   R NSystem.Xaml, Version=8.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	   @d2http://schemas.microsoft.com/expression/blend/2008     5   	   Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5   	   9local'clr-namespace:WpfAppUserInterface.Pages     5   	     � Title$D  >Система управления взвешиваниями��5   	   $	��650��5	   	   $	��900��6    � WindowStartupLocation$ CenterScreen=�5
   	    � 	Resources 5       �� 
TargetType �� Property �� Value �� 
TargetType �� CornerRadius �� Triggers	 P� Property
 P� Value   HeaderStyle��%  '��       '�� [    '�� �    &	  X    �� 5   
   " ��6   .�5      ��  � �� �#4285F46+   �� 5       � ��
 �����6+   �� 5       � ��$
 10,5q�6(   �� 5       � ��$ 5q�6'   �� 5       � ��$ 14(�6)   �� 5       �@�Cursor$
 Hand��6'   �� 5       � ��$ 0q�60   �� 5       � �� 5      �� 5      " ��6&   .R�5      �� #��z��6!   $ 4��6K   ._�5      �� $��Center=�6/   $��Center=�6L   5      5      5       5      P� 5       	 �@J�IsMouseOver$

 True��61   . �5!      ��  � �� �#3367D663   5"      5$      �� 5'   
   " ��6   .�5(      ��  � ��$ 5q�6'   �� 5)       � ��$ Center=�62   5*      �� 5-   
   " ��6   .�5.      ��  � ��$ 5q�6'   �� 5/       � ��$ 5q�6(   �� 50       � ��$ 14(�6)   51      �� 54   
   " ��6   .�55      ��  � ��$
 Bold"�6+   �� 56       � ��$ 16(�6)   �� 57       � ��$ 0,10,0,5q�6'   58      59      .��5;      � $��10q�6    � RowDefinitions 5<   
   �� 5=      $
��Auto �6   �� 5>      $��* �6   �� 5?      $
��Auto �6   .+�5C   
   � $��0��6   $��0,0,0,10q�6    � ColumnDefinitions 5D      �� 5E      $
��Auto �6#   �� 5G      $
��Auto �6#   �� 5I      $��* �6#   �� 5K      $
��Auto �6#   .+�5O      �� $5��/Управление взвешиваниями��6   $��20(�5P      $
��Bold"�6   $��Center=�5Q      �� 5S      -   5         ��Name$ RefreshButton��5S      $��Обновить��6,   $	��100��5T      $��20,0,0,0q�6   $��1��5U      5V      �� 5X      -   5        $ 
BackButton��5X      $��
Выйти��6)   $	��100��5Y      $��0,0,0,0q�6   $��3��5Z      $��Right=�5[      5\      5]      &   System.Windows.Controls.DataGrid  5`   
   -   5          Name$ WeighingsDataGrid��5`      $��1��6.      AutoGenerateColumns$ False��5a         CanUserAddRows$ False��5b         
IsReadOnly$
 True��5c         SelectionMode$ Single=�5d         SelectionUnit$ FullRow=�5e      $��0,0,0,10q�5f         Columns 5g      0  *System.Windows.Controls.DataGridTextColumn  5h      ,  &System.Windows.Controls.DataGridColumn   Header$ ID��6%      Width5  /System.Windows.Controls.DataGridLengthConverter$
 Auto 6P   1  +System.Windows.Controls.DataGridBoundColumn   Binding 61   �� *
WeighingId+6P     5i      $ Весы��6%   $
 Auto 6S    63   �� *Scale.Model+6S     5j      $ Клиент��6%   $
 Auto 6U    65   �� *Client.Name+6U     5k      $ Номер ТС��6%   $	 120 6Y    67   �� *VehicleNumber+6Y     5l      $ Тип ТС��6%   $	 120 6Z    65   �� *TypeVehicle.Name+6Z     5m      $ Вес брутто��6%   $
 Auto 6Y    69   �� *GrossWeight+6Y     5n      $ Вес тары��6%   $
 Auto 6V    67   �� *
TareWeight+6V     5o      $ Дата/время��6%   $	 150 6^    69   �� *WeighingDateTime+6^     5p      $ Оператор��6%   $
 Auto 6V    67   �� *
OperatorId+6V     5q      $ Примечания��6%   $ * 6S    69   �� *Notes+6S   5s      �� 5v   
   $��2��6   ���#DDDDDD$��0,1,0,0q�64    �� Padding$
 0,10q�6N   ._�5w      ��  �� Orientation$ 
Horizontal=�6   $��Right=�62   .+�5x      �� -   5        $ 	AddButton��5x      $��Добавить��6,   $	��195��5y      $��35��6%   5z      5{      5|      5}      5      