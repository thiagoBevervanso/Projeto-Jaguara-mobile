unit UGrid_btn;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.StdCtrls,
  FMX.Layouts, FMX.Controls.Presentation, FMX.TabControl;

type
  Tfrm_btns = class(TForm)
    Panel1: TPanel;
    btn_voltar: TSpeedButton;
    TabControl1: TTabControl;
    Tab_grid: TTabItem;
    Tab_botoes: TTabItem;
    Tab_dashboard: TTabItem;
    Tab_temp: TTabItem;
    Tab_veiculos: TTabItem;
    Tab_solicitacoes: TTabItem;
    Layout1: TLayout;
    btn_grid: TButton;
    btn_dashboard: TButton;
    btn_temp: TButton;
    btn_solicitacoes: TButton;
    btn_veiculos: TButton;
    Label4: TLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_btns: Tfrm_btns;

implementation

{$R *.fmx}

end.
