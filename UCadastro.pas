unit UCadastro;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.ListView.Types, FMX.ListView.Appearances, FMX.ListView.Adapters.Base,
  FMX.Edit, FMX.ListView, FMX.StdCtrls, FMX.Layouts, FMX.TabControl,
  FMX.Controls.Presentation, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.SQLite,
  FireDAC.Phys.SQLiteDef, FireDAC.Stan.ExprFuncs,
  FireDAC.Phys.SQLiteWrapper.Stat, FireDAC.FMXUI.Wait, FireDAC.Stan.Param,
  FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, FMX.Objects;

type
    Tcliente = record
      codigo: integer;
      nome,cnpj,email: string;
    end;
    Tuser = record
      codigo : integer;
      username, senha : string;
    end;

  TfrmCadastro = class(TForm)
    Panel1: TPanel;
    btn_voltar: TSpeedButton;
    TabControl1: TTabControl;
    tab_cadastro_cliente: TTabItem;
    Layout2: TLayout;
    Layout3: TLayout;
    Label1: TLabel;
    Label2: TLabel;
    edt_nome_cliente: TEdit;
    Label3: TLabel;
    edt_cod_cliente: TEdit;
    Label5: TLabel;
    edt_email_cliente: TEdit;
    Label6: TLabel;
    edt_cnpj_cliente: TEdit;
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
    Tab_cadastros: TTabItem;
    Layout5: TLayout;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Tab_cadastro_user: TTabItem;
    tab_cadastro_veiculo: TTabItem;
    Layout1: TLayout;
    Label4: TLabel;
    Label14: TLabel;
    Edit11: TEdit;
    Label15: TLabel;
    Edit12: TEdit;
    Label16: TLabel;
    Edit13: TEdit;
    Label17: TLabel;
    Layout6: TLayout;
    Label20: TLabel;
    Label21: TLabel;
    Edit17: TEdit;
    Label22: TLabel;
    Edit18: TEdit;
    Label23: TLabel;
    Edit19: TEdit;
    Check_adm: TCheckBox;
    btn_salvar_cad_user: TButton;
    btn_salvar_cliente: TButton;
    Button6: TButton;
    Button7: TButton;
    SpeedButton1: TSpeedButton;
    FDConnection1: TFDConnection;
    FDQuery1: TFDQuery;
    edt_cliente: TSpeedButton;
    tab_view_clientes: TTabItem;
    ListView1: TListView;
    Image_edt: TImage;
    btn_atualiza_cliente: TSpeedButton;
    procedure Button1Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure btn_salvar_clienteClick(Sender: TObject);
    procedure btn_voltarClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure insereClienteBanco(cliente : TCliente);
    procedure edt_clienteClick(Sender: TObject);
    procedure insere_cliente_lista(cliente : TCliente);
    procedure ListView1ItemClickEx(const Sender: TObject; ItemIndex: Integer;

    const LocalClickPos: TPointF; const ItemObject: TListItemDrawable);

    function buscarClienteBD(id_cliente : integer) : TCliente;
    procedure atualizaClientesBD();
    procedure btn_atualiza_clienteClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadastro: TfrmCadastro;

implementation

{$R *.fmx}

procedure TfrmCadastro.btn_voltarClick(Sender: TObject);
begin
   Self.Close;
end;

function TfrmCadastro.buscarClienteBD(id_cliente: integer): TCliente;
 var vCliente : TCliente;
begin
  FDQuery1.Close;
  FDQuery1.SQL.Clear;
  FDQuery1.SQL.Add('select * from cliente');
  FDQuery1.SQL.Add('where codigo = :codigo');
  FDQuery1.ParamByName('codigo').AsInteger := id_cliente;

  FDQuery1.Open();

  vCliente.codigo := id_cliente;
  vCliente.nome  := FDQuery1.FieldByName('nome').AsString;
  vCliente.email  := FDQuery1.FieldByName('email').AsString;
  vCliente.cnpj  := FDQuery1.FieldByName('cnpj').AsString;

  Result := vCliente;
end;

procedure TfrmCadastro.Button1Click(Sender: TObject);
begin
TabControl1.TabIndex := 1;
end;

procedure TfrmCadastro.Button2Click(Sender: TObject);
begin
TabControl1.TabIndex := 3;
end;

procedure TfrmCadastro.Button3Click(Sender: TObject);
begin
TabControl1.TabIndex := 2;
end;

procedure TfrmCadastro.Button4Click(Sender: TObject);
begin
TabControl1.TabIndex := 4;
end;

procedure TfrmCadastro.atualizaClientesBD;
var vCliente : TCliente;
vTeste : string;
begin
  FDQuery1.Close;
  FDQuery1.SQL.Clear;
  FDQuery1.SQL.Add('select * from cliente ');
  FDQuery1.Open();
  FDQuery1.First;

  ListView1.Items.Clear;

  while not FDQuery1.Eof do
  begin
    vCliente.codigo := FDQuery1.FieldByName('codigo').AsInteger;
    vCliente.nome := FDQuery1.FieldByName('nome').AsString;
    vCliente.email := FDQuery1.FieldByName('email').AsString;
    vCliente.cnpj := FDQuery1.FieldByName('cnpj').AsString;

    insere_cliente_lista(vCliente);

    FDQuery1.Next;
  end;

end;

procedure TfrmCadastro.btn_atualiza_clienteClick(Sender: TObject);
begin
  atualizaClientesBD;
end;

procedure TfrmCadastro.btn_salvar_clienteClick(Sender: TObject);
 var Vcliente : Tcliente;
begin
   Vcliente.codigo := StrToInt(edt_cod_cliente.Text);
   Vcliente.nome := edt_nome_cliente.Text;
   Vcliente.email := edt_email_cliente.Text;
   Vcliente.cnpj := edt_cnpj_cliente.Text;
   TabControl1.TabIndex := 0;
    insereClienteBanco(Vcliente);
end;

procedure TfrmCadastro.edt_clienteClick(Sender: TObject);
begin
TabControl1.TabIndex := 5;
end;

procedure TfrmCadastro.insereClienteBanco(cliente: TCliente);
begin
  FDQuery1.Close;
  FDQuery1.SQL.Clear;
  FDQuery1.SQL.Add('INSERT INTO CLIENTE (codigo, nome, email, cnpj)');
  FDQuery1.SQL.Add('VALUES (:codigo, :nome, :email, :cnpj )');
  FDQuery1.ParamByName('codigo').AsInteger := cliente.codigo;
  FDQuery1.ParamByName('nome').AsString := cliente.nome;
  FDQuery1.ParamByName('email').AsString := cliente.email;
  FDQuery1.ParamByName('cnpj').AsString := cliente.cnpj;
  FDQuery1.ExecSQL;

end;

procedure TfrmCadastro.insere_cliente_lista(cliente: TCliente);
begin

  with ListView1.Items.Add do
  begin
    TListItemText(Objects.FindDrawable('txtcodigo')).Text := IntToStr(cliente.codigo);
    TListItemText(Objects.FindDrawable('txtnome')).Text := cliente.nome;
    TListItemText(Objects.FindDrawable('txtemail')).Text := cliente.email;
    TListItemText(Objects.FindDrawable('txtcnpj')).Text := cliente.cnpj;

    TListItemImage(Objects.FindDrawable('imgedt')).Bitmap := Image_edt.Bitmap;
  end;
end;

procedure TfrmCadastro.ListView1ItemClickEx(const Sender: TObject;
  ItemIndex: Integer; const LocalClickPos: TPointF;
  const ItemObject: TListItemDrawable);
  var vCliente : TCliente;
  id_cliente : integer;
begin
   if (ItemObject.Name = 'imgedt') then
   begin
     id_cliente := StrToInt(TListItemText(ListView1.Items[ItemIndex].Objects.FindDrawable('txtcodigo')).Text);

     vCliente :=  buscarClienteBD(id_cliente);

     /////////////////////////////////////////////////////
     ///   edt_Codigo_edicao.Text := IntToStr(vCLiente.codigo);
    //edt_nome_edicao.Text := vCLiente.nome;
    //edt_endereco_edicao.Text := vCLiente.endereco;

    //TabControl1.TabIndex := 2;
   end;

end;

procedure TfrmCadastro.SpeedButton1Click(Sender: TObject);
begin
TabControl1.TabIndex := 0;
end;

end.
