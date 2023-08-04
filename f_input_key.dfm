object frm_input_key: Tfrm_input_key
  Left = 14
  Top = 34
  BorderStyle = bsNone
  Caption = 'frm_input_key'
  ClientHeight = 219
  ClientWidth = 352
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object sPanel1: TsPanel
    Left = 0
    Top = 0
    Width = 352
    Height = 159
    Align = alClient
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Calibri'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    SkinData.SkinSection = 'PANEL'
    DesignSize = (
      352
      159)
    object gbox: TsGroupBox
      Left = 6
      Top = 0
      Width = 338
      Height = 153
      Anchors = [akLeft, akTop, akBottom]
      Caption = 'Data Key'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Calibri'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      SkinData.SkinSection = 'GROUPBOX'
      object sLabel1: TsLabel
        Left = 20
        Top = 38
        Width = 32
        Height = 18
        Caption = 'Kode'
        ParentFont = False
        Font.Charset = ANSI_CHARSET
        Font.Color = 4473924
        Font.Height = -15
        Font.Name = 'Calibri'
        Font.Style = []
      end
      object sLabel2: TsLabel
        Left = 20
        Top = 75
        Width = 38
        Height = 18
        Caption = 'Status'
        ParentFont = False
        Font.Charset = ANSI_CHARSET
        Font.Color = 4473924
        Font.Height = -15
        Font.Name = 'Calibri'
        Font.Style = []
      end
      object sLabel3: TsLabel
        Left = 20
        Top = 110
        Width = 77
        Height = 18
        Caption = 'Tanggal Buat'
        ParentFont = False
        Font.Charset = ANSI_CHARSET
        Font.Color = 4473924
        Font.Height = -15
        Font.Name = 'Calibri'
        Font.Style = []
      end
      object edt_key: TsEdit
        Left = 125
        Top = 38
        Width = 190
        Height = 26
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = 4473924
        Font.Height = -15
        Font.Name = 'Calibri'
        Font.Style = []
        MaxLength = 50
        ParentFont = False
        TabOrder = 0
        OnChange = edt_keyChange
        OnExit = edt_keyExit
        SkinData.SkinSection = 'EDIT'
        BoundLabel.Indent = 0
        BoundLabel.Font.Charset = DEFAULT_CHARSET
        BoundLabel.Font.Color = clWindowText
        BoundLabel.Font.Height = -11
        BoundLabel.Font.Name = 'MS Sans Serif'
        BoundLabel.Font.Style = []
        BoundLabel.Layout = sclLeft
        BoundLabel.MaxWidth = 0
        BoundLabel.UseSkinColor = True
      end
      object chk_status: TsCheckBox
        Left = 125
        Top = 75
        Width = 55
        Height = 24
        Caption = 'Aktif'
        Checked = True
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Calibri'
        Font.Style = []
        ParentFont = False
        State = cbChecked
        TabOrder = 1
        SkinData.SkinSection = 'CHECKBOX'
        ImgChecked = 0
        ImgUnchecked = 0
      end
      object tgl_buatz: TsDateEdit
        Left = 125
        Top = 110
        Width = 132
        Height = 22
        AutoSize = False
        Color = clWhite
        EditMask = '!99/99/9999;1; '
        Font.Charset = ANSI_CHARSET
        Font.Color = 4473924
        Font.Height = -15
        Font.Name = 'Calibri'
        Font.Style = []
        MaxLength = 10
        ParentFont = False
        ReadOnly = True
        TabOrder = 2
        Text = '  /  /    '
        BoundLabel.Indent = 0
        BoundLabel.Font.Charset = DEFAULT_CHARSET
        BoundLabel.Font.Color = clWindowText
        BoundLabel.Font.Height = -11
        BoundLabel.Font.Name = 'MS Sans Serif'
        BoundLabel.Font.Style = []
        BoundLabel.Layout = sclLeft
        BoundLabel.MaxWidth = 0
        BoundLabel.UseSkinColor = True
        SkinData.SkinSection = 'EDIT'
        GlyphMode.Blend = 0
        GlyphMode.Grayed = False
      end
    end
  end
  object sPanel2: TsPanel
    Left = 0
    Top = 159
    Width = 352
    Height = 60
    Align = alBottom
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Calibri'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    SkinData.SkinSection = 'PANEL'
    DesignSize = (
      352
      60)
    object sGroupBox2: TsGroupBox
      Left = 7
      Top = -7
      Width = 340
      Height = 62
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 0
      SkinData.SkinSection = 'GROUPBOX'
      DesignSize = (
        340
        62)
      object btn_batal: TsSpeedButton
        Left = 161
        Top = 14
        Width = 170
        Height = 45
        Anchors = [akTop, akRight]
        Caption = '&Tutup'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Calibri'
        Font.Style = [fsBold]
        ParentFont = False
        OnClick = btn_batalClick
        SkinData.SkinSection = 'SPEEDBUTTON'
        ImageIndex = 2
        Images = frm_koneksi.sAlphaImageList1
      end
      object btn_simpbar: TsSpeedButton
        Left = 4
        Top = 14
        Width = 170
        Height = 45
        Anchors = [akLeft, akTop, akRight]
        Caption = '&Simpan'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Calibri'
        Font.Style = [fsBold]
        ParentFont = False
        OnClick = btn_simpbarClick
        SkinData.SkinSection = 'SPEEDBUTTON'
        ImageIndex = 6
        Images = frm_koneksi.sAlphaImageList1
      end
    end
  end
end
