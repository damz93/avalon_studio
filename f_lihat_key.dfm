object frm_lihat_key: Tfrm_lihat_key
  Left = 272
  Top = 94
  BorderStyle = bsNone
  Caption = 'frm_lihat_key'
  ClientHeight = 441
  ClientWidth = 912
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object sPanel1: TsPanel
    Left = 0
    Top = 0
    Width = 912
    Height = 385
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
      912
      385)
    object sGroupBox1: TsGroupBox
      Left = 6
      Top = 6
      Width = 898
      Height = 372
      Anchors = [akLeft, akTop, akRight, akBottom]
      Caption = 'Data Key'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Calibri'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      SkinData.SkinSection = 'GROUPBOX'
      DesignSize = (
        898
        372)
      object sLabel1: TsLabel
        Left = 19
        Top = 31
        Width = 103
        Height = 18
        Caption = 'Cari Berdasarkan'
        ParentFont = False
        Font.Charset = ANSI_CHARSET
        Font.Color = 4473924
        Font.Height = -15
        Font.Name = 'Calibri'
        Font.Style = []
      end
      object DBGrid1: TDBGrid
        Left = 21
        Top = 67
        Width = 866
        Height = 291
        Cursor = crHandPoint
        Align = alCustom
        Anchors = [akLeft, akTop, akRight, akBottom]
        DataSource = DataSource1
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Calibri'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -15
        TitleFont.Name = 'Verdana'
        TitleFont.Style = []
        OnCellClick = DBGrid1CellClick
        Columns = <
          item
            Expanded = False
            FieldName = 'KODE'
            Title.Alignment = taCenter
            Title.Caption = 'Kode'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -15
            Title.Font.Name = 'Calibri'
            Title.Font.Style = [fsBold]
            Width = 100
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'TGL_BUAT'
            Title.Alignment = taCenter
            Title.Caption = 'Tgl Buat'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -15
            Title.Font.Name = 'Calibri'
            Title.Font.Style = [fsBold]
            Width = 100
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'TGL_UPDATE'
            Title.Alignment = taCenter
            Title.Caption = 'Tgl Update'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -15
            Title.Font.Name = 'Calibri'
            Title.Font.Style = [fsBold]
            Width = 100
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'STATUS'
            Title.Alignment = taCenter
            Title.Caption = 'Status'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -15
            Title.Font.Name = 'Calibri'
            Title.Font.Style = [fsBold]
            Width = 100
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'KETERANGAN'
            Title.Alignment = taCenter
            Title.Caption = 'Keterangan'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -15
            Title.Font.Name = 'Calibri'
            Title.Font.Style = [fsBold]
            Visible = True
          end>
      end
      object cmb_cari: TsComboBox
        Left = 152
        Top = 27
        Width = 321
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
        Font.Charset = ANSI_CHARSET
        Font.Color = 4473924
        Font.Height = -15
        Font.Name = 'Calibri'
        Font.Style = []
        ItemHeight = 20
        ItemIndex = -1
        ParentFont = False
        TabOrder = 1
        OnClick = cmb_cariClick
        Items.Strings = (
          'Kode'
          'Tgl Buat'
          'Tgl Update'
          'Status')
      end
      object edit_cari: TsEdit
        Left = 478
        Top = 27
        Width = 514
        Height = 26
        Anchors = [akLeft, akTop, akRight]
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = 4473924
        Font.Height = -15
        Font.Name = 'Calibri'
        Font.Style = []
        ParentFont = False
        TabOrder = 2
        OnChange = edit_cariChange
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
    end
  end
  object pnl_bawah: TsPanel
    Left = 0
    Top = 385
    Width = 912
    Height = 56
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
      912
      56)
    object btn_tambah: TsSpeedButton
      Left = -3
      Top = 7
      Width = 150
      Height = 44
      Anchors = []
      Caption = '&Tambah'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Calibri'
      Font.Style = [fsBold]
      ParentFont = False
      OnClick = btn_tambahClick
      SkinData.SkinSection = 'SPEEDBUTTON'
      ImageIndex = 0
      Images = frm_koneksi.sAlphaImageList1
    end
    object btn_edit: TsSpeedButton
      Left = 182
      Top = 7
      Width = 150
      Height = 44
      Anchors = []
      Caption = '&Edit'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Calibri'
      Font.Style = [fsBold]
      ParentFont = False
      OnClick = btn_editClick
      SkinData.SkinSection = 'SPEEDBUTTON'
      ImageIndex = 4
      Images = frm_koneksi.sAlphaImageList1
    end
    object btn_hapus: TsSpeedButton
      Left = 382
      Top = 7
      Width = 150
      Height = 44
      Anchors = []
      Caption = '&Hapus'
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
    object btn_tutup: TsSpeedButton
      Left = 750
      Top = 7
      Width = 150
      Height = 44
      Anchors = []
      Caption = '&Tutup'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Calibri'
      Font.Style = [fsBold]
      ParentFont = False
      OnClick = btn_tutupClick
      SkinData.SkinSection = 'SPEEDBUTTON'
      ImageIndex = 2
      Images = frm_koneksi.sAlphaImageList1
    end
    object btn_batal: TsSpeedButton
      Left = 586
      Top = 7
      Width = 150
      Height = 44
      Anchors = []
      Caption = '&Batal'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Calibri'
      Font.Style = [fsBold]
      ParentFont = False
      OnClick = btn_batalClick
      SkinData.SkinSection = 'SPEEDBUTTON'
      ImageIndex = 1
      Images = frm_koneksi.sAlphaImageList1
    end
  end
  object DataSource1: TDataSource
    DataSet = frm_koneksi.qr_key
    Left = 222
    Top = 46
  end
end
