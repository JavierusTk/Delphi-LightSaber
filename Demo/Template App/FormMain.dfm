object MainForm: TMainForm
  Left = 891
  Top = 327
  AlphaBlendValue = 249
  Caption = 'Enviroment'
  ClientHeight = 536
  ClientWidth = 700
  Color = clBtnFace
  Constraints.MinHeight = 300
  Constraints.MinWidth = 350
  DoubleBuffered = True
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Arial'
  Font.Style = []
  GlassFrame.Enabled = True
  Menu = MainMenu
  Position = poDesigned
  ScreenSnap = True
  ShowHint = True
  SnapBuffer = 5
  OnClose = FormClose
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  TextHeight = 15
  object pgCtrl: TPageControl
    Left = 0
    Top = 0
    Width = 700
    Height = 517
    ActivePage = tabMemo
    Align = alClient
    TabOrder = 0
    object tabMain: TTabSheet
      Caption = 'Main'
      object btnStart: TButton
        Left = 544
        Top = 425
        Width = 134
        Height = 53
        Caption = 'START'
        TabOrder = 0
        OnClick = btnSTARTClick
      end
      object RichEdit1: TRichEdit
        Left = 0
        Top = 0
        Width = 692
        Height = 412
        Align = alTop
        Lines.Strings = (
          'RichEdit1')
        TabOrder = 1
      end
    end
    object tabLog: TTabSheet
      Caption = 'Log'
      ImageIndex = 4
    end
    object tabMemo: TTabSheet
      Caption = 'tabMemo'
      ImageIndex = 2
      object Path: TCubicPathEdit
        Left = 0
        Top = 0
        Width = 692
        Height = 49
        Align = alTop
        Caption = 'Path'
        TabOrder = 0
      end
      object mmo: TMemo
        AlignWithMargins = True
        Left = 3
        Top = 52
        Width = 501
        Height = 432
        Align = alClient
        TabOrder = 1
      end
      object pnlRight: TPanel
        Left = 507
        Top = 49
        Width = 185
        Height = 438
        Align = alRight
        TabOrder = 2
      end
    end
  end
  object StatBar: TcubicStatusBar
    Left = 0
    Top = 517
    Width = 700
    Height = 19
    Panels = <>
    ParentColor = True
    ParentFont = True
    SimplePanel = True
    UseSystemFont = False
  end
  object MainMenu: TMainMenu
    Left = 53
    Top = 51
    object File1: TMenuItem
      Caption = '&File'
      object mnuSettings: TMenuItem
        Action = actSettings
      end
    end
    object Info1: TMenuItem
      Caption = '&Info'
      object mnuUpdates: TMenuItem
        Action = actUpdater
      end
      object mnuEnterKey: TMenuItem
        Action = actEnterKey
      end
      object mnuAbout: TMenuItem
        Caption = '&About'
        OnClick = mnuAboutClick
      end
      object mnuLanguage: TMenuItem
        Action = actLanguage
      end
    end
  end
  object Actions: TActionList
    Left = 122
    Top = 51
    object actEnterKey: TAction
      Caption = '&Enter key'
      OnExecute = actEnterKeyExecute
    end
    object actSettings: TAction
      Caption = 'Program settings'
      ShortCut = 16468
      OnExecute = actSettingsExecute
    end
    object actUpdater: TAction
      Caption = 'Check for &updates'
      OnExecute = actUpdaterExecute
    end
    object actLanguage: TAction
      Caption = 'Select &language'
      OnExecute = actLanguageExecute
    end
  end
  object TrayIcon: TCoolTrayIcon
    CycleInterval = 0
    Icon.Data = {
      0000010001002020200000000000A81000001600000028000000200000004000
      0000010020000000000000100000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0002000000060000000B0000000D0000000D0000000D0000000D0000000D0000
      000D0000000D0000000D0000000D0000000D0000000D0000000D0000000D0000
      000D0000000D0000000D0000000D0000000D0000000D0000000D0000000D0000
      000D0000000D0000000D0000000D0000000D0000000B00000006000000020000
      0006000000160000002300000026000000260000002600000026000000260000
      0026000000260000002600000026000000260000002600000026000000260000
      0026000000260000002600000026000000260000002600000026000000260000
      0026000000260000002600000026000000260000002300000016000000068B86
      848185817EF7888481FF888481FF888481FF888481FF888481FF888481FF8884
      81FF888481FF888481FF888481FF888481FF888481FF888481FF888481FF8A86
      83FF8C8986FF8F8C89FF8F8A87FF8B8785FF888482FF888481FF888481FF8884
      81FF888481FF888481FF888481FF888481FF79757394000000230000000B8884
      81FFF7F2EFFFFBF9F6FFFBF9F6FFFBF9F6FFFBF9F6FFFBF9F6FFFBF9F6FFFBF9
      F6FFFBF9F6FFFBF9F6FFFBF9F6FFFBF9F6FFFBF9F6FFFBF9F6FFFBF9F6FFFBF9
      F6FFFBF9F6FFFBF9F6FFFBF9F6FFFBF9F6FFFBF9F6FFFBF9F6FFFBF9F6FFFBF9
      F6FFFBF9F6FFFBF9F6FFFBF9F6FFFBF9F6FF888481FF000000260000000D8884
      81FFF7F2EFFFFCFCFCFFF9FDFFFFF4F8FAFFFAFFFFFFF7FCFFFFF5F9FCFFF5F9
      FBFFF8FDFFFFFEFFFFFFFDFFFFFFFCFFFFFFFAFFFFFFF9FFFFFFF6FBFEFFF5F6
      F6FFF6F7F8FFF6F7F8FFF6F6F7FFF4F5F4FFF2F3F3FFF1F2F2FFF0F1F0FFF0F1
      F1FFF0F1F1FFF0F1F1FFF1F2F3FFFBF9F6FF888481FF000000260000000D8884
      81FFF7F3F1FFFBF9F6FFFAFBFCFFE6E6E7FFE6E6E7FFE6E6E7FFE6E6E7FFE6E6
      E7FFE6E6E7FFE6E6E7FFE6E6E7FFE6E6E7FFE6E6E7FFE6E6E7FFE6E6E7FFF2F3
      F5FFF6F7F8FFF7F8F9FFF6F7F8FFF5F6F7FFF3F4F4FFF2F3F2FFF0F0F0FFEDEE
      EEFFECECECFFECECECFFEDEDEEFFFBF9F6FF888481FF000000260000000D8884
      81FFF8F6F5FFFBF9F6FFAEA3A2FFD1BDBCFFD1BDBCFFD1BDBCFFD1BDBCFFD1BD
      BCFFD1BDBCFFD1BDBCFFD1BDBCFFD1BDBCFFD1BDBCFFADA1A0FFE6E6E7FFF4F5
      F7FFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFF4F4F5FFF1F2
      F3FFEEEEEEFFEDEDEDFFEDEDEEFFFBF9F6FF888481FF000000260000000D8884
      81FFF7F6F3FFFBF9F6FFD1BDBCFF84A057FF82A259FF80A55AFF7EA75CFF7BA9
      5EFF79AB60FF77AD62FF75AF63FF73B165FF71B366FFD1BDBCFFE6E6E7FFF2F6
      F8FFF6F7F8FFF7F8F9FFF7F8F9FFF7F8F9FFF7F8F9FFF7F8F9FFF6F7F8FFF4F5
      F5FFEFF0F1FFEDEDEDFFEDEEEEFFFBF9F6FF888481FF000000260000000D8884
      81FFF7F5F3FFFBF9F6FFD1BDBCFF879C54FF859F56FF83A158FF81A45AFF7FA6
      5CFF7CA85DFF7AAB5FFF78AD61FF76AF63FF74B164FFD1BDBCFFE6E6E7FFF3F6
      F8FFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFF7F7F8FFF4F6
      F6FFF0F1F1FFEFEFEFFFEEEFF0FFFBF9F6FF888481FF000000260000000D8884
      81FFF7F5F3FFFBF9F6FFD1BDBCFF8A9852FF889B53FF869E55FF84A057FF82A3
      59FF7FA55BFF7DA75DFF7BAA5FFF79AC60FF76AE62FFD1BDBCFFE6E6E7FFF4F6
      F7FFF5F6F7FFF6F7F8FFF7F8F9FFF7F8F9FFF7F8F9FFF7F8F9FFF6F7F8FFF5F6
      F6FFF2F2F2FFF0F0F0FFEFF0F1FFFBF9F6FF888481FF000000260000000D8884
      81FFF7F5F3FFFBF9F6FFD1BDBCFF8C9550FF8B9751FF899A53FF879C55FF859F
      56FF83A258FF80A45AFF7EA65CFF7CA95EFF79AB60FFD1BDBCFFE6E6E7FFF4F7
      F9FFF6F7F9FFF7F8F8FFF7F8F9FFF7F8F9FFF7F8F9FFF7F8F9FFF7F8F9FFF7F8
      F9FFF7F8F9FFF7F8F9FFF7F8F9FFFBF9F6FF888481FF000000260000000D8884
      81FFF7F5F3FFFBF9F6FFD1BDBCFF8F904DFF8D934FFF8B9651FF8A9952FF889B
      54FF869E56FF84A157FF81A359FF7FA55BFF7DA85DFFD1BDBCFFE6E6E7FFF4F7
      F9FFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFF7F8F9FFF7F8
      F9FFF7F8F9FFF7F8F9FFF7F8F9FFFBF9F6FF888481FF000000260000000D8884
      81FFF7F5F3FFFBF9F6FFD1BDBCFF918C4BFF908F4DFF8E924EFF8C9550FF8A98
      51FF899A53FF879D55FF84A057FF82A259FF80A55AFFD1BDBCFFE6E6E7FFF4F5
      F9FFF8F9FAFFF7F8F9FFF7F8F9FFF7F8F9FFF7F8F9FFF7F8F9FFF7F8F9FFF7F8
      F9FFF7F8F9FFF7F8F9FFF7F8F9FFFBF9F6FF888481FF000000260000000D8884
      81FFF6F5F3FFFBF9F6FFD1BDBCFF948749FF928A4AFF908E4CFF8F914EFF8D94
      4FFF8B9751FF899952FF879C54FF859F56FF83A158FFD1BDBCFFE6E6E7FFF4F6
      F9FFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFF7F8F9FFF7F8
      F9FF6EB669FF6EB669FFF7F8F9FFFBF9F6FF888481FF000000260000000D8884
      81FFF6F4F3FFFBF9F6FFD1BDBCFF968247FF948648FF93894AFF918D4BFF8F90
      4DFF8E934FFF8C9650FF8A9852FF889B53FF869E55FFD1BDBCFFE6E6E7FFF4F7
      FAFFF8F8F8FFF5F6F7FFF7F8F9FFF7F8F9FFF7F8F9FFF7F8F9FFF7F8F9FFF7F8
      F9FF6EB669FF6EB669FFF7F8F9FFFBF9F6FF888481FF000000260000000D8884
      81FFF6F4F2FFFBF9F6FFD1BDBCFFB29E73FF99854CFF958447FF938849FF928B
      4BFF908E4CFF8E924EFF8C9550FF8B9751FF899A53FFD1BDBCFFE6E6E7FFF3F6
      FAFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFF7F8F9FFF7F8
      F9FF80A55BFF6EB669FFF7F8F9FFFBF9F6FF888481FF000000260000000D8884
      81FFF6F4F2FFFBF9F6FFD1BDBCFFBCA682FFB9A57FFFA89464FF9B884FFF9486
      48FF928A4AFF918D4CFF8F904DFF8D934FFF8B9651FFD1BDBCFFE6E6E7FFF4F6
      FAFFF7F8F9FFF6F7F8FFF7F8F8FFF6F7F8FFF6F7F8FFF7F8F9FFF7F8F9FFF7F8
      F9FF8B9751FF80A55BFFF7F8F9FFFBF9F6FF888481FF000000260000000D8884
      81FFF7F6F4FFFBF9F6FFD1BDBCFFB99D78FFB89F7AFFB7A17AFFB6A47CFFB09F
      72FFAB9F6FFFA69D69FF9F9B63FF9D9C62FF9CA064FFD1BDBCFFE6E6E7FFF5F6
      FAFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFF7F8F9FFF7F8
      F9FF958347FF8B9751FFF7F8F9FFFBF9F6FF888481FF000000260000000D8884
      81FFFCFCFDFFFBF9F6FFD1BDBCFFB5936EFFB4956EFFB3976FFFB39A71FFB19C
      71FFB09F73FFAFA174FFAEA475FFADA676FFABA978FFD1BDBCFFE6E6E7FFF4F7
      FAFFF7F8F9FFF6F8F8FFF7F8F9FFF6F7F8FFF7F8F9FFF7F8F9FFF7F8F9FFF7F8
      F9FFA06A3CFF958347FFF7F8F9FFFBF9F6FF888481FF000000260000000D8A86
      84F6FCFCFCFFFBF9F6FFD1BDBCFFB18861FFB08A62FFAF8B62FFAE8E64FFAD91
      65FFAC9366FFAA9667FFA99969FFA89C6AFFA79F6BFFD1BDBCFFE6E6E7FFF4F7
      F9FFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFF7F8F9FFF7F8
      F9FFA06A3CFFA06A3CFFF7F8F9FFFBF9F6FF888481FF000000260000000D8A86
      84F6FCFCFCFFFBF9F6FFD1BDBCFFAC7D54FFAB7E55FFAA8056FFA98257FFA885
      58FFA88759FFA68B5BFFA58D5BFFA3915DFFA2935EFFD1BDBCFFE6E6E7FFF5F7
      F9FFF7F8F9FFF7F8F9FFF7F8F9FFF7F8F9FFF7F8F9FFF7F8F9FFF7F8F9FFF7F8
      F9FFA06A3CFFA06A3CFFF7F8F9FFFBF9F6FF888481FF000000260000000D8A86
      84F6FCFCFBFFFBF9F6FFC6BABAFFD1BDBCFFD1BDBCFFD1BDBCFFD1BDBCFFD1BD
      BCFFD1BDBCFFD1BDBCFFD1BDBCFFD1BDBCFFD1BDBCFFC6BBBAFFFAFBFCFFFAFB
      FCFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFF7F8F9FFF7F8
      F9FFA06A3CFFA06A3CFFF7F8F9FFFBF9F6FF888481FF000000260000000D8A86
      84F6FBF9F6FFFBF9F6FFFBF9F6FFFBF9F6FFFBF9F6FFFBF9F6FFFBF9F6FFFBF9
      F6FFFBF9F6FFFBF9F6FFFBF9F6FFFBF9F6FFFBF9F6FFFBF9F6FFFBF9F6FFFBF9
      F6FFFBF9F6FFFBF9F6FFFBF9F6FFFBF9F6FFFBF9F6FFFBF9F6FFFBF9F6FFFBF9
      F6FFFBF9F6FFFBF9F6FFFBF9F6FFFBF9F6FF888481FF000000260000000D8B86
      84F6F7F5F3FFF8F9FAFFF7F8F9FFF7F8F9FFF7F8F9FFF7F8F9FFF7F8F9FFF7F8
      F9FFF7F8F9FFF7F8F9FFF7F8F9FFF7F8F9FFF7F8F9FFF7F8F9FFF7F8F9FFF8F8
      F9FFF7F8F9FFF7F8F8FFF7F8F8FFF7F8F8FFF7F8F8FFF7F8F8FFF7F8F9FFF7F8
      F9FFF7F8F9FFF7F8F9FFF8F9FAFFFBF9F6FF888481FF000000260000000D8E8A
      88F6CBC9C7FFCBC9C7FFCBC9C7FFCBC9C7FFCBC9C7FFCBC9C7FFCBC9C7FFCBC9
      C7FFCBC9C7FFCBC9C7FFCBC9C7FFCBC9C7FFCBC9C7FFCBC9C7FFCBC9C7FFCBC9
      C7FFCCCAC9FFCDCBCAFFCDCCCAFFCDCCCAFFCDCBC9FFCCCAC8FFCCCAC8FFCBC9
      C7FFCBC9C7FFCBC9C7FFCBC9C7FFCBC9C7FF888481FF000000230000000B8B89
      87FEE6DED8FFDFD7D1FFDED7D1FFDED7D1FFDED7D1FFDED7D1FFDED7D1FFDED7
      D1FFDED7D1FFDED7D1FFDED7D1FFDED7D1FFDED7D1FFDED7D1FFDED7D1FFDED7
      D1FFDED7D1FFDED7D1FFDED7D1FFDED7D1FFDED7D1FFDED7D1FF917968FFDED7
      D1FF917968FFDED7D1FF917968FFDED7D1FF888481FF0000001600000006918C
      897C888481FF888481FF888481FF888481FF888481FF888481FF888481FF8884
      81FF888481FF888481FF888481FF888481FF888481FF888481FF888481FF8884
      81FF888481FF888481FF888481FF888481FF888481FF888481FF888481FF8884
      81FF888481FF888481FF888481FF888481FF8B86848100000006000000020000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FFFFFFFFFFFF0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFF}
    IconIndex = 0
    OnClick = TrayIconClick
    Left = 182
    Top = 50
  end
  object AppEvents: TApplicationEvents
    Left = 244
    Top = 50
  end
  object Proteus: TProteus
    ProductVers = 0
    ProductName = 'My product'
    RegKeyPath = '\SOFTWARE\Microsoft\Windows\CurrentVersion\Defrag32\'
    Left = 303
    Top = 50
  end
end
