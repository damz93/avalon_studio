object frm_lap_pengeluaran_berdasarkan: Tfrm_lap_pengeluaran_berdasarkan
  Left = -38
  Top = 34
  BorderStyle = bsNone
  Caption = 'frm_lap_pengeluaran_berdasarkan'
  ClientHeight = 194
  ClientWidth = 519
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
    Top = 143
    Width = 519
    Height = 51
    Align = alBottom
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Calibri'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    SkinData.SkinSection = 'PANEL'
    DesignSize = (
      519
      51)
    object sGroupBox1: TsGroupBox
      Left = 6
      Top = -4
      Width = 509
      Height = 51
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 0
      SkinData.SkinSection = 'GROUPBOX'
      DesignSize = (
        509
        51)
      object btn_keluar: TsSpeedButton
        Left = 5
        Top = 11
        Width = 501
        Height = 40
        Cursor = crArrow
        Anchors = [akLeft, akTop, akBottom]
        Caption = '&Tutup'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Calibri'
        Font.Style = [fsBold]
        ParentFont = False
        OnClick = btn_keluarClick
        SkinData.SkinSection = 'SPEEDBUTTON'
        ImageIndex = 1
        Images = frm_koneksi.sAlphaImageList1
      end
    end
  end
  object sPanel2: TsPanel
    Left = 0
    Top = 0
    Width = 519
    Height = 143
    Align = alClient
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Calibri'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    SkinData.SkinSection = 'PANEL'
    DesignSize = (
      519
      143)
    object rdg_berdasarkan_kl: TsRadioGroup
      Left = 5
      Top = 1
      Width = 190
      Height = 135
      Anchors = [akLeft, akTop, akBottom]
      Caption = 'Pilih Berdasarkan'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Calibri'
      Font.Style = []
      ParentBackground = False
      ParentFont = False
      TabOrder = 0
      OnClick = rdg_berdasarkan_klClick
      SkinData.SkinSection = 'GROUPBOX'
      Items.Strings = (
        'Tgl Transaksi'
        'Periode')
    end
    object sGroupBox2: TsGroupBox
      Left = 488
      Top = 104
      Width = 17
      Height = 1
      Caption = 'sGroupBox2'
      TabOrder = 1
      SkinData.SkinSection = 'GROUPBOX'
    end
    object sGroupBox3: TsGroupBox
      Left = 205
      Top = 7
      Width = 302
      Height = 77
      TabOrder = 2
      SkinData.SkinSection = 'GROUPBOX'
      object lbl_berdasark: TsLabel
        Left = 114
        Top = 32
        Width = 88
        Height = 19
        Caption = 'lbl_berdasark'
        ParentFont = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 4473924
        Font.Height = -16
        Font.Name = 'Calibri'
        Font.Style = []
      end
      object lbl_sampai: TsLabel
        Left = 134
        Top = 34
        Width = 41
        Height = 15
        Caption = 'Sampai'
        ParentFont = False
        Font.Charset = ANSI_CHARSET
        Font.Color = 4473924
        Font.Height = -13
        Font.Name = 'Calibri'
        Font.Style = []
      end
      object cmb_berdasar: TsComboBox
        Left = 8
        Top = 30
        Width = 280
        Height = 23
        Alignment = taLeftJustify
        BoundLabel.Indent = 0
        BoundLabel.Font.Charset = DEFAULT_CHARSET
        BoundLabel.Font.Color = clWindowText
        BoundLabel.Font.Height = -11
        BoundLabel.Font.Name = 'MS Sans Serif'
        BoundLabel.Font.Style = []
        BoundLabel.Layout = sclLeft
        BoundLabel.MaxWidth = 0
        BoundLabel.UseSkinColor = True
        SkinData.SkinSection = 'COMBOBOX'
        Style = csDropDownList
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 4473924
        Font.Height = -13
        Font.Name = 'Calibri'
        Font.Style = []
        ItemHeight = 17
        ItemIndex = -1
        ParentFont = False
        TabOrder = 0
        OnClick = cmb_berdasarClick
      end
      object tgl_awal: TsDateEdit
        Left = 16
        Top = 30
        Width = 114
        Height = 23
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
        TabOrder = 1
        Text = '  /  /    '
        OnClick = tgl_awalClick
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
      object tgl_akhir: TsDateEdit
        Left = 175
        Top = 30
        Width = 114
        Height = 23
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
        TabOrder = 2
        Text = '  /  /    '
        OnClick = tgl_akhirClick
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
    object gbox_periode: TsGroupBox
      Left = 205
      Top = 7
      Width = 302
      Height = 77
      TabOrder = 3
      SkinData.SkinSection = 'GROUPBOX'
      object cmb_periode: TsComboBox
        Left = 6
        Top = 14
        Width = 291
        Height = 26
        Alignment = taLeftJustify
        BoundLabel.Indent = 0
        BoundLabel.Font.Charset = DEFAULT_CHARSET
        BoundLabel.Font.Color = clWindowText
        BoundLabel.Font.Height = -11
        BoundLabel.Font.Name = 'MS Sans Serif'
        BoundLabel.Font.Style = []
        BoundLabel.Layout = sclLeft
        BoundLabel.MaxWidth = 0
        BoundLabel.UseSkinColor = True
        SkinData.SkinSection = 'COMBOBOX'
        Style = csDropDownList
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 4473924
        Font.Height = -15
        Font.Name = 'Calibri'
        Font.Style = []
        ItemHeight = 20
        ItemIndex = -1
        ParentFont = False
        TabOrder = 0
        OnClick = cmb_periodeClick
        Items.Strings = (
          'Tahunan'
          'Bulanan'
          'Harian')
      end
      object cmb_tahunan: TsComboBox
        Left = 7
        Top = 46
        Width = 84
        Height = 26
        Alignment = taLeftJustify
        BoundLabel.Indent = 0
        BoundLabel.Font.Charset = DEFAULT_CHARSET
        BoundLabel.Font.Color = clWindowText
        BoundLabel.Font.Height = -11
        BoundLabel.Font.Name = 'MS Sans Serif'
        BoundLabel.Font.Style = []
        BoundLabel.Layout = sclLeft
        BoundLabel.MaxWidth = 0
        BoundLabel.UseSkinColor = True
        SkinData.SkinSection = 'COMBOBOX'
        Style = csDropDownList
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 4473924
        Font.Height = -15
        Font.Name = 'Calibri'
        Font.Style = []
        ItemHeight = 20
        ItemIndex = -1
        ParentFont = False
        TabOrder = 1
        OnClick = cmb_berdasarClick
        Items.Strings = (
          '2017'
          '2018'
          '2019'
          '2020'
          '2021'
          '2022'
          '2023'
          '2024'
          '2025'
          '2026'
          '2027'
          '2028'
          '2029'
          '2030')
      end
      object cmb_bulanan: TsComboBox
        Left = 100
        Top = 46
        Width = 84
        Height = 26
        Alignment = taLeftJustify
        BoundLabel.Indent = 0
        BoundLabel.Font.Charset = DEFAULT_CHARSET
        BoundLabel.Font.Color = clWindowText
        BoundLabel.Font.Height = -11
        BoundLabel.Font.Name = 'MS Sans Serif'
        BoundLabel.Font.Style = []
        BoundLabel.Layout = sclLeft
        BoundLabel.MaxWidth = 0
        BoundLabel.UseSkinColor = True
        SkinData.SkinSection = 'COMBOBOX'
        Style = csDropDownList
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 4473924
        Font.Height = -15
        Font.Name = 'Calibri'
        Font.Style = []
        ItemHeight = 20
        ItemIndex = -1
        ParentFont = False
        TabOrder = 2
        OnClick = cmb_berdasarClick
        Items.Strings = (
          '1'
          '2'
          '3'
          '4'
          '5'
          '6'
          '7'
          '8'
          '9'
          '10'
          '11'
          '12')
      end
      object cmb_harian: TsDateEdit
        Left = 192
        Top = 45
        Width = 103
        Height = 26
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
        TabOrder = 3
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
    object sGroupBox4: TsGroupBox
      Left = 205
      Top = 85
      Width = 303
      Height = 54
      TabOrder = 4
      SkinData.SkinSection = 'GROUPBOX'
      object btn_tampil: TsSpeedButton
        Left = 4
        Top = 11
        Width = 294
        Height = 38
        Cursor = crArrow
        Caption = '&Tampil'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Calibri'
        Font.Style = [fsBold]
        ParentFont = False
        OnClick = btn_tampilClick
        SkinData.SkinSection = 'SPEEDBUTTON'
        ImageIndex = 10
        Images = frm_koneksi.sAlphaImageList1
      end
    end
  end
end
