object frmSplash: TfrmSplash
  Left = 0
  Top = 0
  BorderIcons = []
  BorderStyle = bsToolWindow
  Caption = 'Splash'
  ClientHeight = 490
  ClientWidth = 650
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  Visible = True
  OnCreate = FormCreate
  OnPaint = FormPaint
  PixelsPerInch = 96
  TextHeight = 13
  object pnlFundo: TPanel
    Left = 0
    Top = 0
    Width = 650
    Height = 490
    Align = alClient
    BevelOuter = bvNone
    Color = clWhite
    ParentBackground = False
    TabOrder = 0
    inline frmLogo: TfrmLogo
      Left = 232
      Top = 144
      Width = 200
      Height = 200
      Color = clWhite
      ParentBackground = False
      ParentColor = False
      TabOrder = 0
      ExplicitLeft = 232
      ExplicitTop = 144
      inherited pnlFundo: TPanel
        inherited lblTitulo: TLabel
          Width = 200
        end
      end
    end
  end
  object tmrSplash: TTimer
    Interval = 2000
    OnTimer = tmrSplashTimer
    Left = 512
    Top = 192
  end
end
