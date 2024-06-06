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
  FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.Comp.DataSet, FMX.Edit;

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
    StyleBook1: TStyleBook;
    ListView1: TListView;
    btn_cadastrar: TButton;
    FDConnection1: TFDConnection;
    FDQuery1: TFDQuery;
    tab_cadastro: TTabItem;
    Layout2: TLayout;
    Layout3: TLayout;
    Label1: TLabel;
    Label2: TLabel;
    Edit1: TEdit;
    Label3: TLabel;
    Edit2: TEdit;
    Label5: TLabel;
    Edit3: TEdit;
    Label6: TLabel;
    Edit4: TEdit;
    Tab_cadastroCarga: TTabItem;
    Layout4: TLayout;
    Label7: TLabel;
    Label8: TLabel;
    Edit5: TEdit;
    Label9: TLabel;
    Edit6: TEdit;
    Label10: TLabel;
    Edit7: TEdit;
    Label11: TLabel;
    Edit8: TEdit;
    Label12: TLabel;
    Edit9: TEdit;
    Label13: TLabel;
    Edit10: TEdit;
    TabItem1: TTabItem;
    Layout5: TLayout;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    procedure FormShow(Sender: TObject);
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

procedure Tfrm_btns.FormShow(Sender: TObject);
begin
  btn_cadastrar.Visible := isAdmin;
end;

end.
