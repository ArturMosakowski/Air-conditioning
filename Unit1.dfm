object Form1: TForm1
  Left = 339
  Top = 349
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Klimatyzacja  w autobusie'
  ClientHeight = 332
  ClientWidth = 519
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Shape2: TShape
    Left = 148
    Top = 8
    Width = 361
    Height = 265
    Brush.Color = clSkyBlue
  end
  object Shape7: TShape
    Left = 12
    Top = 288
    Width = 496
    Height = 38
    Brush.Color = clSkyBlue
  end
  object Shape8: TShape
    Left = 204
    Top = 292
    Width = 177
    Height = 30
  end
  object Shape6: TShape
    Left = 335
    Top = 223
    Width = 54
    Height = 17
  end
  object Shape1: TShape
    Left = 12
    Top = 8
    Width = 83
    Height = 265
    Brush.Color = clSkyBlue
  end
  object Label1: TLabel
    Left = 20
    Top = 240
    Width = 60
    Height = 13
    Caption = 'Temperatura'
    Transparent = True
  end
  object Image1: TImage
    Left = 68
    Top = 16
    Width = 20
    Height = 202
  end
  object Label2: TLabel
    Left = 68
    Top = 224
    Width = 32
    Height = 13
    Caption = 'Label2'
    Transparent = True
  end
  object Label3: TLabel
    Left = 20
    Top = 256
    Width = 57
    Height = 13
    Caption = 'oczekiwana'
    Transparent = True
  end
  object Image2: TImage
    Left = 204
    Top = 16
    Width = 20
    Height = 202
  end
  object Label4: TLabel
    Left = 204
    Top = 224
    Width = 32
    Height = 13
    Caption = 'Label4'
    Transparent = True
  end
  object Label5: TLabel
    Left = 156
    Top = 240
    Width = 60
    Height = 13
    Caption = 'Temperatura'
    Transparent = True
  end
  object Label6: TLabel
    Left = 156
    Top = 256
    Width = 57
    Height = 13
    Caption = 'w autobusie'
    Transparent = True
  end
  object Image3: TImage
    Left = 389
    Top = 16
    Width = 20
    Height = 202
  end
  object Label7: TLabel
    Left = 397
    Top = 224
    Width = 32
    Height = 13
    Caption = 'Label7'
    Transparent = True
  end
  object Label8: TLabel
    Left = 357
    Top = 240
    Width = 21
    Height = 13
    Caption = 'Moc'
    Transparent = True
  end
  object Label9: TLabel
    Left = 341
    Top = 256
    Width = 61
    Height = 13
    Caption = 'klimatyzatora'
    Transparent = True
  end
  object Image4: TImage
    Left = 296
    Top = 16
    Width = 20
    Height = 202
  end
  object Label10: TLabel
    Left = 296
    Top = 224
    Width = 38
    Height = 13
    Caption = 'Label10'
    Transparent = True
  end
  object Label11: TLabel
    Left = 248
    Top = 240
    Width = 60
    Height = 13
    Caption = 'Temperatura'
    Transparent = True
  end
  object Label12: TLabel
    Left = 248
    Top = 256
    Width = 57
    Height = 13
    Caption = 'na zewn'#261'trz'
    Transparent = True
  end
  object Image5: TImage
    Left = 481
    Top = 16
    Width = 20
    Height = 202
  end
  object Label13: TLabel
    Left = 481
    Top = 224
    Width = 38
    Height = 13
    Caption = 'Label13'
    Transparent = True
  end
  object Label14: TLabel
    Left = 441
    Top = 240
    Width = 31
    Height = 13
    Caption = 'Liczba'
    Transparent = True
  end
  object Label15: TLabel
    Left = 441
    Top = 256
    Width = 52
    Height = 13
    Caption = 'Pasa'#380'er'#243'w'
    Transparent = True
  end
  object Label16: TLabel
    Left = 337
    Top = 225
    Width = 38
    Height = 13
    Caption = 'Label16'
    Transparent = True
  end
  object Label17: TLabel
    Left = 208
    Top = 293
    Width = 171
    Height = 29
    Caption = 'PRZYSTANEK'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -23
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    Transparent = True
  end
  object TrackBar1: TTrackBar
    Left = 20
    Top = 16
    Width = 45
    Height = 200
    Max = 0
    Min = -50
    Orientation = trVertical
    TabOrder = 0
    OnChange = TrackBar1Change
  end
  object TrackBar2: TTrackBar
    Left = 156
    Top = 16
    Width = 45
    Height = 200
    Max = 0
    Min = -50
    Orientation = trVertical
    TabOrder = 1
    OnChange = TrackBar2Change
  end
  object TrackBar3: TTrackBar
    Left = 341
    Top = 16
    Width = 45
    Height = 200
    Max = 0
    Min = -5
    Orientation = trVertical
    TabOrder = 2
    OnChange = TrackBar3Change
  end
  object TrackBar4: TTrackBar
    Left = 248
    Top = 16
    Width = 45
    Height = 200
    Max = 0
    Min = -50
    Orientation = trVertical
    TabOrder = 3
    OnChange = TrackBar4Change
  end
  object TrackBar5: TTrackBar
    Left = 433
    Top = 16
    Width = 45
    Height = 200
    Max = 0
    Min = -50
    Orientation = trVertical
    TabOrder = 4
    OnChange = TrackBar5Change
  end
  object Button2: TButton
    Left = 18
    Top = 294
    Width = 75
    Height = 25
    Caption = 'START'
    TabOrder = 5
    OnClick = Button2Click
  end
  object Button1: TButton
    Left = 96
    Top = 294
    Width = 75
    Height = 25
    Caption = 'STOP'
    Enabled = False
    TabOrder = 6
    OnClick = Button1Click
  end
  object Button3: TButton
    Left = 427
    Top = 294
    Width = 75
    Height = 25
    Caption = 'Zamknij'
    TabOrder = 7
    OnClick = Button3Click
  end
  object Timer1: TTimer
    Enabled = False
    Interval = 700
    OnTimer = Timer1Timer
    Left = 104
    Top = 240
  end
end
