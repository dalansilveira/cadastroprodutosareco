object FrmSobre: TFrmSobre
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'FrmSobre'
  ClientHeight = 224
  ClientWidth = 444
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object lblSobre: TLabel
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 438
    Height = 218
    Align = alClient
    Alignment = taCenter
    Caption = 
      'Criado por Dalant P'#233'rsio C. Silveira'#13#10'para Areco Sistemas Empres' +
      'ariais'#13#10#13#10'Telefone para contato:'#13#10'(38) 9 9845 - 2624'#13#10#13#10'Clique p' +
      'ara fechar!'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -24
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    WordWrap = True
    OnClick = lblSobreClick
    ExplicitWidth = 416
    ExplicitHeight = 203
  end
end
