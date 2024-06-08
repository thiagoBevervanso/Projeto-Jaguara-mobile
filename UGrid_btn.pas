unit UGrid_btn;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.StdCtrls,
  FMX.Layouts, FMX.Controls.Presentation, FMX.TabControl, FMX.ListView.Types,
  FMX.ListView.Appearances, FMX.ListView.Adapters.Base, FMX.ListView,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf,
  FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async,
  FireDAC.Phys, FireDAC.Phys.SQLite, FireDAC.Phys.SQLiteDef,
  FireDAC.Stan.ExprFuncs, FireDAC.Phys.SQLiteWrapper.Stat, FireDAC.FMXUI.Wait,
  Data.DB, FireDAC.Comp.Client, FireDAC.Stan.Param, FireDAC.DatS,
  FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.Comp.DataSet, FMX.Edit,UCadastro;

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
    Layout1: TLayout;
    btn_grid: TButton;
    btn_dashboard: TButton;
    btn_temp: TButton;
    btn_solicitacoes: TButton;
    btn_veiculos: TButton;
    Label4: TLabel;
    StyleBook1: TStyleBook;
    ListView1: TListView;
    btn_cadastrar: TButton;
    FDConnection1: TFDConnection;
    FDQuery1: TFDQuery;
    btn_atualiza_grid: TSpeedButton;
    btn_edita_grid: TSpeedButton;
    procedure FormShow(Sender: TObject);
    procedure btn_voltarClick(Sender: TObject);
    procedure btn_gridClick(Sender: TObject);
    procedure btn_dashboardClick(Sender: TObject);
    procedure btn_tempClick(Sender: TObject);
    procedure btn_solicitacoesClick(Sender: TObject);
    procedure btn_veiculosClick(Sender: TObject);
    procedure btn_cadastrarClick(Sender: TObject);
  private
    { Private declarations }


  public
   usuarioLogado: string;
   senhaLogada: string;
   isAdmin: Boolean;


  end;

var
  frm_btns: Tfrm_btns;


implementation

{$R *.fmx}

{ Tfrm_btns }

procedure Tfrm_btns.btn_cadastrarClick(Sender: TObject);
begin
  frmCadastro.Show;
end;

procedure Tfrm_btns.btn_dashboardClick(Sender: TObject);
begin
  TabControl1.TabIndex := 2;
end;

procedure Tfrm_btns.btn_gridClick(Sender: TObject);
begin
  TabControl1.TabIndex := 1;
end;

procedure Tfrm_btns.btn_solicitacoesClick(Sender: TObject);
begin
TabControl1.TabIndex := 4;
end;

procedure Tfrm_btns.btn_tempClick(Sender: TObject);
begin
  tabcontrol1.TabIndex := 3;
end;

procedure Tfrm_btns.btn_veiculosClick(Sender: TObject);
begin
  TabControl1.TabIndex := 5;
end;

procedure Tfrm_btns.btn_voltarClick(Sender: TObject);
begin
  TabControl1.TabIndex := 0;
end;

procedure Tfrm_btns.FormShow(Sender: TObject);

begin

 ShowMessage('isAdmin em FormShow: ' + BoolToStr(isAdmin, True)); // Log adicional
 isAdmin := false;
          //nao esta puxando admin da main class
  btn_cadastrar.Visible := isAdmin;
end;


end.
