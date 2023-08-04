object frm_lihat_user: Tfrm_lihat_user
  Left = 310
  Top = 127
  Anchors = []
  BorderStyle = bsNone
  Caption = 'frm_lihat_user'
  ClientHeight = 362
  ClientWidth = 1058
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
    Width = 1058
    Height = 306
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
      1058
      306)
    object sGroupBox1: TsGroupBox
      Left = 6
      Top = 6
      Width = 1044
      Height = 293
      Anchors = [akLeft, akTop, akRight, akBottom]
      Caption = 'Data User'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Calibri'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      SkinData.SkinSection = 'GROUPBOX'
      DesignSize = (
        1044
        293)
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
        Width = 1012
        Height = 212
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
            FieldName = 'USERNAME'
            Title.Alignment = taCenter
            Title.Caption = 'Username'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -15
            Title.Font.Name = 'Calibri'
            Title.Font.Style = [fsBold]
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NAMA_LENGKAP'
            Title.Alignment = taCenter
            Title.Caption = 'Nama Lengkap'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -15
            Title.Font.Name = 'Calibri'
            Title.Font.Style = [fsBold]
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'PHONE'
            Title.Alignment = taCenter
            Title.Caption = 'Phone'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -15
            Title.Font.Name = 'Calibri'
            Title.Font.Style = [fsBold]
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'LEVEL'
            Title.Alignment = taCenter
            Title.Caption = 'Level'
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
          'Username'
          'Nama Lengkap'
          'Phone'
          'Level')
      end
      object edit_cari: TsEdit
        Left = 478
        Top = 27
        Width = 660
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
    Top = 306
    Width = 1058
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
      1058
      56)
    object btn_tambah: TsSpeedButton
      Left = 9
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
      Left = 223
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
      Left = 455
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
      Left = 882
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
      Left = 692
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
    DataSet = frm_koneksi.qr_user
    Left = 222
    Top = 46
  end
end
