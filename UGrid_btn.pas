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
  FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.Comp.DataSet, FMX.Edit,UCadastro,
  FMX.ListBox, System.ImageList, FMX.ImgList, FMX.Objects;

type


  Tfrm_btns = class(TForm)
    Panel1: TPanel;
    btn_voltar: TSpeedButton;
    TabControl1: TTabControl;
    Tab_grid: TTabItem;
    Tab_botoes: TTabItem;
    Tab_temp: TTabItem;
    Tab_veiculos: TTabItem;
    Layout1: TLayout;
    btn_grid: TButton;
    btn_temp: TButton;
    btn_solicitacoes: TButton;
    btn_veiculos: TButton;
    Label4: TLabel;
    StyleBook1: TStyleBook;
    btn_cadastrar: TButton;
    FDConnection1: TFDConnection;
    FDQuery1: TFDQuery;
    tab_solicitacoes: TTabItem;
    ListView2: TListView;
    btn_atualiza_soli: TSpeedButton;
    ImageList1: TImageList;
    ListView1: TListView;
    Label1: TLabel;
    img_yes: TImage;
    img_danger: TImage;
    btn_att: TSpeedButton;
    Label3: TLabel;
    ListView4: TListView;
    ListView3: TListView;
    btn_att_temp: TSpeedButton;
    Label2: TLabel;
    btn_att_veiculo: TSpeedButton;
    Label5: TLabel;
    Tab_graficos: TTabItem;
    Image1: TImage;
    Label6: TLabel;
    Label7: TLabel;
    btn_grafico: TButton;
    procedure btn_voltarClick(Sender: TObject);
    procedure btn_gridClick(Sender: TObject);

    procedure btn_tempClick(Sender: TObject);
    procedure btn_solicitacoesClick(Sender: TObject);
    procedure btn_veiculosClick(Sender: TObject);
    procedure btn_cadastrarClick(Sender: TObject);
    procedure insereLista_grid();
    procedure insereLista_temp();
    procedure btn_attClick(Sender: TObject);
    procedure btn_att_tempClick(Sender: TObject);
    procedure insereSolicitacao();
    procedure btn_atualiza_soliClick(Sender: TObject);
    procedure insereVeiculos();
    procedure btn_att_veiculoClick(Sender: TObject);
    procedure btn_graficoClick(Sender: TObject);
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




procedure Tfrm_btns.btn_attClick(Sender: TObject);
begin
insereLista_grid;
end;

procedure Tfrm_btns.btn_att_tempClick(Sender: TObject);
begin
insereLista_temp;
end;

procedure Tfrm_btns.btn_att_veiculoClick(Sender: TObject);
begin
insereVeiculos;
end;

procedure Tfrm_btns.btn_atualiza_soliClick(Sender: TObject);
begin
insereSolicitacao;
end;

procedure Tfrm_btns.btn_cadastrarClick(Sender: TObject);
begin
  frmCadastro.Show;
end;


procedure Tfrm_btns.btn_graficoClick(Sender: TObject);
begin
TabControl1.TabIndex := 5;
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
  tabcontrol1.TabIndex := 2;
end;

procedure Tfrm_btns.btn_veiculosClick(Sender: TObject);
begin
  TabControl1.TabIndex := 3;
end;

procedure Tfrm_btns.btn_voltarClick(Sender: TObject);
begin
  TabControl1.TabIndex := 0;
end;

procedure Tfrm_btns.insereLista_grid;
var
  ListItem: TListViewItem;
begin
  ListView1.Items.Clear;

  ListItem := ListView1.Items.Add;
  TListItemText(ListItem.Objects.FindDrawable('txtplaca')).Text := 'T23J21';
  TListItemText(ListItem.Objects.FindDrawable('txtcidade')).Text := 'Cascavel - PR';
  TListItemText(ListItem.Objects.FindDrawable('txtsm')).Text := 'SM NO ATRASO';
  TListItemText(ListItem.Objects.FindDrawable('txtcarga')).Text := 'Carga nao perecivel';

  ListItem := ListView1.Items.Add;
  TListItemText(ListItem.Objects.FindDrawable('txtplaca')).Text := 'U6P34T';
  TListItemText(ListItem.Objects.FindDrawable('txtsm')).Text := 'SM VAZIO';
  TListItemText(ListItem.Objects.FindDrawable('txtcarga')).Text := 'Sem carga';

  ListItem := ListView1.Items.Add;
  TListItemText(ListItem.Objects.FindDrawable('txtplaca')).Text := 'PT45CD';
  TListItemText(ListItem.Objects.FindDrawable('txtcidade')).Text := 'Sao Paulo - SP';
  TListItemText(ListItem.Objects.FindDrawable('txtsm')).Text := 'SM NO DESTINO';
  TListItemText(ListItem.Objects.FindDrawable('txtcarga')).Text := 'Carga nao perecivel';

  ListItem := ListView1.Items.Add;
  TListItemText(ListItem.Objects.FindDrawable('txtplaca')).Text := 'CUF0F0I';
  TListItemText(ListItem.Objects.FindDrawable('txtcidade')).Text := 'Natal - RN';
  TListItemText(ListItem.Objects.FindDrawable('txtsm')).Text := 'SM CARREGADO';
  TListItemText(ListItem.Objects.FindDrawable('txtcarga')).Text := 'Carga perecivel';

  ListItem := ListView1.Items.Add;
  TListItemText(ListItem.Objects.FindDrawable('txtplaca')).Text := 'X0Z0Ta';
  TListItemText(ListItem.Objects.FindDrawable('txtcidade')).Text := 'Sinop - MT';
  TListItemText(ListItem.Objects.FindDrawable('txtsm')).Text := 'SM NO DESTINO';
  TListItemText(ListItem.Objects.FindDrawable('txtcarga')).Text := 'Carga perecivel';

  ListItem := ListView1.Items.Add;
  TListItemText(ListItem.Objects.FindDrawable('txtplaca')).Text := 'J34C1O';
  TListItemText(ListItem.Objects.FindDrawable('txtcidade')).Text := 'Bombinhas - SC';
  TListItemText(ListItem.Objects.FindDrawable('txtsm')).Text := 'SM VAZIO';
  TListItemText(ListItem.Objects.FindDrawable('txtcarga')).Text := 'Sem carga';

  ListItem := ListView1.Items.Add;
  TListItemText(ListItem.Objects.FindDrawable('txtplaca')).Text := 'PO12CR1';
  TListItemText(ListItem.Objects.FindDrawable('txtcidade')).Text := 'Cascavel - PR';
  TListItemText(ListItem.Objects.FindDrawable('txtsm')).Text := 'SM COM ATRASO';
  TListItemText(ListItem.Objects.FindDrawable('txtcarga')).Text := 'Carga nao perecivel';

  ListItem := ListView1.Items.Add;
  TListItemText(ListItem.Objects.FindDrawable('txtplaca')).Text := '12AD78';
  TListItemText(ListItem.Objects.FindDrawable('txtcidade')).Text := 'Rio de Janeiro - RJ';
  TListItemText(ListItem.Objects.FindDrawable('txtsm')).Text := 'SM CARREGADO';
  TListItemText(ListItem.Objects.FindDrawable('txtcarga')).Text := 'Carga nao perecivel';

  ListItem := ListView1.Items.Add;
  TListItemText(ListItem.Objects.FindDrawable('txtplaca')).Text := 'ASFG321';
  TListItemText(ListItem.Objects.FindDrawable('txtcidade')).Text := 'Laranjeiras - PR';
  TListItemText(ListItem.Objects.FindDrawable('txtsm')).Text := 'SM VAZIO';
  TListItemText(ListItem.Objects.FindDrawable('txtcarga')).Text := 'Sem carga';
end;

procedure Tfrm_btns.insereLista_temp;
 var listitems : TListViewItem;
begin
      ListView3.Items.Clear;


  listitems := ListView3.Items.Add;
  TListItemText(listitems.Objects.FindDrawable('txtviagem')).Text := 'Viagem: 165345';
  TListItemText(listitems.Objects.FindDrawable('txtveiculo')).Text := 'Veiculo: T23J21';
  TListItemText(listitems.Objects.FindDrawable('txttemp')).Text := '25,1 ºC ';
  TListItemText(listitems.Objects.FindDrawable('txtstatus')).Text := 'Ausencia de temperatura';
  TListItemText(listitems.Objects.FindDrawable('txttemptxt')).Text := 'ultima temperatura: ';

  listitems := ListView3.Items.Add;
  TListItemText(listitems.Objects.FindDrawable('txtviagem')).Text := 'Viagem: 99853';
  TListItemText(listitems.Objects.FindDrawable('txtveiculo')).Text := 'Veiculo: U6P34T';
  TListItemText(listitems.Objects.FindDrawable('txttemp')).Text := '-19,1 ºC ';
  TListItemText(listitems.Objects.FindDrawable('txtstatus')).Text := 'Temperatura na faixa';
  TListItemText(listitems.Objects.FindDrawable('txttemptxt')).Text := 'ultima temperatura: ';

  listitems := ListView3.Items.Add;
  TListItemText(listitems.Objects.FindDrawable('txtviagem')).Text := 'Viagem: 223532';
  TListItemText(listitems.Objects.FindDrawable('txtveiculo')).Text := 'Veiculo: PT45CD';
  TListItemText(listitems.Objects.FindDrawable('txttemp')).Text := '15,4 ºC ';
  TListItemText(listitems.Objects.FindDrawable('txtstatus')).Text := 'Temperatura na faixa';
  TListItemText(listitems.Objects.FindDrawable('txttemptxt')).Text := 'ultima temperatura: ';

  listitems := ListView3.Items.Add;
  TListItemText(listitems.Objects.FindDrawable('txtviagem')).Text := 'Viagem: 11953';
  TListItemText(listitems.Objects.FindDrawable('txtveiculo')).Text := 'Veiculo: CUF0F0I';
  TListItemText(listitems.Objects.FindDrawable('txttemp')).Text := '21,8 ºC ';
  TListItemText(listitems.Objects.FindDrawable('txtstatus')).Text := 'Ausencia de temperatura';
  TListItemText(listitems.Objects.FindDrawable('txttemptxt')).Text := 'ultima temperatura: ';

  listitems := ListView3.Items.Add;
  TListItemText(listitems.Objects.FindDrawable('txtviagem')).Text := 'Viagem: 93785';
  TListItemText(listitems.Objects.FindDrawable('txtveiculo')).Text := 'Veiculo: X0Z0Ta';
  TListItemText(listitems.Objects.FindDrawable('txttemp')).Text := '31,2 ºC ';
  TListItemText(listitems.Objects.FindDrawable('txtstatus')).Text := 'Ausencia de temperatura';
  TListItemText(listitems.Objects.FindDrawable('txttemptxt')).Text := 'ultima temperatura: ';

  listitems := ListView3.Items.Add;
  TListItemText(listitems.Objects.FindDrawable('txtviagem')).Text := 'Viagem: 55683';
  TListItemText(listitems.Objects.FindDrawable('txtveiculo')).Text := 'Veiculo: J34C1O';
  TListItemText(listitems.Objects.FindDrawable('txttemp')).Text := '12,9 ºC ';
  TListItemText(listitems.Objects.FindDrawable('txtstatus')).Text := 'Temperatura na faixa';
  TListItemText(listitems.Objects.FindDrawable('txttemptxt')).Text := 'ultima temperatura: ';

  listitems := ListView3.Items.Add;
  TListItemText(listitems.Objects.FindDrawable('txtviagem')).Text := 'Viagem: 25865';
  TListItemText(listitems.Objects.FindDrawable('txtveiculo')).Text := 'Veiculo: PO12CR1';
  TListItemText(listitems.Objects.FindDrawable('txttemp')).Text := '-12,3 ºC ';
  TListItemText(listitems.Objects.FindDrawable('txtstatus')).Text := 'Ausencia de temperatura';
  TListItemText(listitems.Objects.FindDrawable('txttemptxt')).Text := 'ultima temperatura: ';

  listitems := ListView3.Items.Add;
  TListItemText(listitems.Objects.FindDrawable('txtviagem')).Text := 'Viagem: 99845';
  TListItemText(listitems.Objects.FindDrawable('txtveiculo')).Text := 'Veiculo: 12AD78';
  TListItemText(listitems.Objects.FindDrawable('txttemp')).Text := '-01,6 ºC ';
  TListItemText(listitems.Objects.FindDrawable('txtstatus')).Text := 'Temperatura na faixa';
  TListItemText(listitems.Objects.FindDrawable('txttemptxt')).Text := 'ultima temperatura: ';

  listitems := ListView3.Items.Add;
  TListItemText(listitems.Objects.FindDrawable('txtviagem')).Text := 'Viagem: 33648';
  TListItemText(listitems.Objects.FindDrawable('txtveiculo')).Text := 'Veiculo: ASFG321';
  TListItemText(listitems.Objects.FindDrawable('txttemp')).Text := '22,6 ºC ';
  TListItemText(listitems.Objects.FindDrawable('txtstatus')).Text := 'Ausencia de temperatura';
  TListItemText(listitems.Objects.FindDrawable('txttemptxt')).Text := 'ultima temperatura: ';


end;



procedure Tfrm_btns.insereSolicitacao;
var listitems : TListViewItem;
begin
  ListView2.Items.Clear;

  listitems := ListView2.Items.Add;
  TListItemText(listitems.Objects.FindDrawable('txtnum')).Text := '34567';
  TListItemText(listitems.Objects.FindDrawable('txtsoli')).Text := ' veículo Mercedes Actros'+#13+' já percorreu 150 km '+#13+' com temperatura interna'+#13+'de 18°C e risco baixo.';

   listitems := ListView2.Items.Add;
  TListItemText(listitems.Objects.FindDrawable('txtnum')).Text := '56789';
  TListItemText(listitems.Objects.FindDrawable('txtsoli')).Text := 'veículo Volvo FH16'+#13+' já percorreu 430 '+#13+'km com '+#13+'temperatura interna '+#13+'de 21°C e risco médio.';

   listitems := ListView2.Items.Add;
  TListItemText(listitems.Objects.FindDrawable('txtnum')).Text := '78901';
  TListItemText(listitems.Objects.FindDrawable('txtsoli')).Text := 'veículo MAN TGX já percorreu 290 km '+#13+'com temperatura interna de 19°C'+#13+' e risco alto.';

   listitems := ListView2.Items.Add;
  TListItemText(listitems.Objects.FindDrawable('txtnum')).Text := '12345';
  TListItemText(listitems.Objects.FindDrawable('txtsoli')).Text := 'veículo Iveco Stralis já percorreu 370 km '+#13+'com temperatura interna de 22°C'+#13+' e risco baixo.';

   listitems := ListView2.Items.Add;
  TListItemText(listitems.Objects.FindDrawable('txtnum')).Text := '23456';
  TListItemText(listitems.Objects.FindDrawable('txtsoli')).Text := 'veículo Renault T já percorreu 520 km '+#13+'com temperatura interna de 20°C '+#13+'e risco médio.';

   listitems := ListView2.Items.Add;
  TListItemText(listitems.Objects.FindDrawable('txtnum')).Text := '67890';
  TListItemText(listitems.Objects.FindDrawable('txtsoli')).Text := 'veículo Volvo VNL já percorreu 280 km '+#13+'com temperatura interna de 16°C '+#13+'e risco alto.';


end;



procedure Tfrm_btns.insereVeiculos;
var listItems : TListViewItem;
begin
  ListView4.Items.Clear;

  listItems := ListView4.Items.Add;
  TListItemText(listItems.Objects.FindDrawable('txtplacav')).Text := 'T23J21';
  TListItemText(listItems.Objects.FindDrawable('txtmodelo')).Text := 'Modelo: Mercedes Actros';
  TListItemText(listItems.Objects.FindDrawable('txtcarga')).Text := 'Carga: Frutas e Vegetais Frescos';

  listItems := ListView4.Items.Add;
  TListItemText(listItems.Objects.FindDrawable('txtplacav')).Text := 'CUF0F0I';
  TListItemText(listItems.Objects.FindDrawable('txtmodelo')).Text := 'Modelo: Volvo FH16';
  TListItemText(listItems.Objects.FindDrawable('txtcarga')).Text := 'Carga: Produtos Lácteos';

  listItems := ListView4.Items.Add;
  TListItemText(listItems.Objects.FindDrawable('txtplacav')).Text := 'PT45CD';
  TListItemText(listItems.Objects.FindDrawable('txtmodelo')).Text := 'Modelo: MAN TGX';
  TListItemText(listItems.Objects.FindDrawable('txtcarga')).Text := 'Carga: Eletrônicos';

  listItems := ListView4.Items.Add;
  TListItemText(listItems.Objects.FindDrawable('txtplacav')).Text := 'ASFG321';
  TListItemText(listItems.Objects.FindDrawable('txtmodelo')).Text := 'Modelo: Iveco Stralis';
  TListItemText(listItems.Objects.FindDrawable('txtcarga')).Text := 'Carga: Materiais de Construção';

  listItems := ListView4.Items.Add;
  TListItemText(listItems.Objects.FindDrawable('txtplacav')).Text := 'X0Z0Ta';
  TListItemText(listItems.Objects.FindDrawable('txtmodelo')).Text := 'Modelo: Scania R450';
  TListItemText(listItems.Objects.FindDrawable('txtcarga')).Text := 'Carga: Produtos Congelados';




end;

end.

