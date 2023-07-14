object frm_input_tip: Tfrm_input_tip
  Left = 286
  Top = 67
  BorderStyle = bsNone
  Caption = 'frm_input_tip'
  ClientHeight = 324
  ClientWidth = 721
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
    Width = 721
    Height = 264
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
      721
      264)
    object gbox: TsGroupBox
      Left = 6
      Top = -1
      Width = 709
      Height = 259
      Anchors = [akLeft, akTop, akRight, akBottom]
      Caption = 'Data Tip Crew'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Calibri'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      SkinData.SkinSection = 'GROUPBOX'
      DesignSize = (
        709
        259)
      object sLabel1: TsLabel
        Left = 330
        Top = 214
        Width = 30
        Height = 18
        Caption = 'Oleh'
        ParentFont = False
        Font.Charset = ANSI_CHARSET
        Font.Color = 4473924
        Font.Height = -15
        Font.Name = 'Calibri'
        Font.Style = []
      end
      object lbl_urut: TsLabel
        Left = 856
        Top = 152
        Width = 63
        Height = 23
        Caption = 'lbl_urut'
        ParentFont = False
        Visible = False
        Font.Charset = ANSI_CHARSET
        Font.Color = 4473924
        Font.Height = -19
        Font.Name = 'Calibri'
        Font.Style = [fsBold]
      end
      object sLabel4: TsLabel
        Left = 40
        Top = 43
        Width = 54
        Height = 18
        Caption = 'Kode Tip'
        ParentFont = False
        Font.Charset = ANSI_CHARSET
        Font.Color = 4473924
        Font.Height = -15
        Font.Name = 'Calibri'
        Font.Style = []
      end
      object lbl_kodee: TsLabel
        Left = 145
        Top = 40
        Width = 73
        Height = 18
        Caption = 'TIP-0000001'
        ParentFont = False
        Font.Charset = ANSI_CHARSET
        Font.Color = 4473924
        Font.Height = -15
        Font.Name = 'Calibri'
        Font.Style = []
      end
      object sLabel5: TsLabel
        Left = 40
        Top = 144
        Width = 53
        Height = 18
        Caption = 'Nominal'
        ParentFont = False
        Font.Charset = ANSI_CHARSET
        Font.Color = 4473924
        Font.Height = -15
        Font.Name = 'Calibri'
        Font.Style = []
      end
      object sLabel6: TsLabel
        Left = 40
        Top = 77
        Width = 91
        Height = 18
        Caption = 'Kode Transaksi'
        ParentFont = False
        Font.Charset = ANSI_CHARSET
        Font.Color = 4473924
        Font.Height = -15
        Font.Name = 'Calibri'
        Font.Style = []
      end
      object lbl_tgl: TsLabel
        Left = 145
        Top = 110
        Width = 5
        Height = 18
        Caption = '-'
        ParentFont = False
        Font.Charset = ANSI_CHARSET
        Font.Color = 4473924
        Font.Height = -15
        Font.Name = 'Calibri'
        Font.Style = []
      end
      object sLabel3: TsLabel
        Left = 40
        Top = 112
        Width = 76
        Height = 18
        Caption = 'Tgl Transaksi'
        ParentFont = False
        Font.Charset = ANSI_CHARSET
        Font.Color = 4473924
        Font.Height = -15
        Font.Name = 'Calibri'
        Font.Style = []
      end
      object lbl_tgl_sekarang: TsLabel
        Left = 628
        Top = 18
        Width = 68
        Height = 18
        Alignment = taRightJustify
        Caption = '17/07/2021'
        ParentFont = False
        Font.Charset = ANSI_CHARSET
        Font.Color = 4473924
        Font.Height = -15
        Font.Name = 'Calibri'
        Font.Style = []
      end
      object lbl_totalkess: TsLabel
        Left = 603
        Top = 208
        Width = 92
        Height = 19
        Alignment = taRightJustify
        Caption = 'Total : Rp0,00'
        ParentFont = False
        Font.Charset = ANSI_CHARSET
        Font.Color = 4473924
        Font.Height = -16
        Font.Name = 'Calibri'
        Font.Style = [fsBold]
      end
      object lbl_totalkes: TsLabel
        Left = 694
        Top = 244
        Width = 7
        Height = 18
        Caption = '0'
        ParentFont = False
        Visible = False
        Font.Charset = ANSI_CHARSET
        Font.Color = 4473924
        Font.Height = -15
        Font.Name = 'Calibri'
        Font.Style = []
      end
      object lbl_metode: TsLabel
        Left = 536
        Top = 16
        Width = 76
        Height = 18
        Caption = 'Tgl Transaksi'
        ParentFont = False
        Visible = False
        Font.Charset = ANSI_CHARSET
        Font.Color = 4473924
        Font.Height = -15
        Font.Name = 'Calibri'
        Font.Style = []
      end
      object edt_nominal: TsEdit
        Left = 145
        Top = 142
        Width = 167
        Height = 26
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = 4473924
        Font.Height = -15
        Font.Name = 'Calibri'
        Font.Style = []
        MaxLength = 15
        ParentFont = False
        ReadOnly = True
        TabOrder = 1
        OnKeyPress = edt_nominalKeyPress
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
      object cmb_kodtransk: TsComboBox
        Left = 145
        Top = 75
        Width = 167
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
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = 4473924
        Font.Height = -15
        Font.Name = 'Calibri'
        Font.Style = []
        ItemHeight = 20
        ItemIndex = -1
        ParentFont = False
        TabOrder = 0
        OnClick = cmb_kodtranskClick
        OnKeyPress = cmb_kodtranskKeyPress
        Items.Strings = (
          'Kepala Marketing'
          'Kepala Operasional'
          'Kru'
          'Purchasing')
      end
      object edt_oleh: TsEdit
        Left = 365
        Top = 211
        Width = 156
        Height = 26
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = 4473924
        Font.Height = -15
        Font.Name = 'Calibri'
        Font.Style = []
        MaxLength = 15
        ParentFont = False
        TabOrder = 2
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
      object sGroupBox1: TsGroupBox
        Left = 40
        Top = 180
        Width = 211
        Height = 62
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 3
        SkinData.SkinSection = 'GROUPBOX'
        DesignSize = (
          211
          62)
        object btn_tambah: TsSpeedButton
          Left = 5
          Top = 16
          Width = 202
          Height = 43
          Anchors = [akLeft, akTop, akRight]
          Caption = '&Tambah'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'Calibri'
          Font.Style = [fsBold]
          ParentFont = False
          OnClick = btn_tambahClick
          SkinData.SkinSection = 'SPEEDBUTTON'
          ImageIndex = 9
          Images = frm_koneksi.sAlphaImageList1
        end
      end
      object DBGrid1: TDBGrid
        Left = 330
        Top = 40
        Width = 367
        Height = 165
        Cursor = crHandPoint
        Align = alCustom
        Anchors = []
        DataSource = DataSource1
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Calibri'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 4
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -15
        TitleFont.Name = 'Calibri'
        TitleFont.Style = [fsBold]
        OnCellClick = DBGrid1CellClick
        Columns = <
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'KODE_TRANSAKSI'
            Title.Alignment = taCenter
            Title.Caption = 'Kode Transaksi'
            Width = 100
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'TGL_TRANSAKSI'
            Title.Alignment = taCenter
            Title.Caption = 'Tgl Transaksi'
            Width = 100
            Visible = True
          end
          item
            Alignment = taRightJustify
            Expanded = False
            FieldName = 'RP_NOMINAL'
            Title.Alignment = taCenter
            Title.Caption = 'Nominal'
            Width = 120
            Visible = True
          end>
      end
      object sGroupBox3: TsGroupBox
        Left = 264
        Top = 180
        Width = 47
        Height = 62
        Anchors = []
        TabOrder = 5
        SkinData.SkinSection = 'GROUPBOX'
        DesignSize = (
          47
          62)
        object btn_hapus: TsSpeedButton
          Left = 1
          Top = 14
          Width = 45
          Height = 45
          Anchors = []
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'Calibri'
          Font.Style = [fsBold]
          ParentFont = False
          OnClick = btn_hapusClick
          SkinData.SkinSection = 'SPEEDBUTTON'
          ImageIndex = 3
          Images = frm_koneksi.sAlphaImageList1
        end
      end
    end
  end
  object sPanel2: TsPanel
    Left = 0
    Top = 264
    Width = 721
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
      721
      60)
    object sGroupBox2: TsGroupBox
      Left = 5
      Top = -7
      Width = 711
      Height = 62
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 0
      SkinData.SkinSection = 'GROUPBOX'
      DesignSize = (
        711
        62)
      object btn_batal: TsSpeedButton
        Left = 357
        Top = 13
        Width = 350
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
        Left = 7
        Top = 13
        Width = 350
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
  object DataSource1: TDataSource
    DataSet = frm_koneksi.qr_tip_temp
    Left = 494
    Top = 6
  end
end
