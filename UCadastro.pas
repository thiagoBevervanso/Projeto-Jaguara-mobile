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
      username, password : string;
      is_adm : Boolean;
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
    edt_codigo_user: TEdit;
    Label15: TLabel;
    edt_nome_user: TEdit;
    Label16: TLabel;
    edt_senha_user: TEdit;
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
    Image_delete: TImage;
    tab_edt_cliente: TTabItem;
    Layout7: TLayout;
    Layout8: TLayout;
    Label13: TLabel;
    Label18: TLabel;
    btn_deletaCliente: TSpeedButton;
    tab_edt_usuarios: TTabItem;
    tab_view_usuarios: TTabItem;
    Label26: TLabel;
    Label27: TLabel;
    edt_edita_user_cod: TEdit;
    Label28: TLabel;
    Edt_edita_user_name: TEdit;
    Label29: TLabel;
    edt_edita_user_senha: TEdit;
    Label30: TLabel;
    check_edita_adm: TCheckBox;
    btn_salvar_edit_usuario: TButton;
    btn_deletar_usuario: TSpeedButton;
    lvUser: TListView;
    ImageControl1: TImageControl;
    btn_atualiza_user: TSpeedButton;
    btn_edita_user: TSpeedButton;
    edit_edita_cliente_nome: TEdit;
    edit_edita_cliente_cod: TEdit;
    Label19: TLabel;
    Label24: TLabel;
    edit_edita_cliente_email: TEdit;
    Label25: TLabel;
    edit_edita_cliente_cnpj: TEdit;
    btn_salvar_edit_cliente: TButton;
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


    function buscarClienteBD(id_cliente : integer) : TCliente;
    procedure atualizaClientesBD();
    procedure btn_atualiza_clienteClick(Sender: TObject);
    procedure btn_salvar_edit_clienteClick(Sender: TObject);
    procedure editaClienteBanco(cliente : TCliente);
    procedure btn_deletaClienteClick(Sender: TObject);
    procedure deleta_clientes(id_cliente : integer);

    procedure insereUsuarioBanco(user : TUser);
    procedure insereUsuarioLista(user : Tuser);
    function buscarUsuarioBanco(id_usuario : integer) : Tuser;
    procedure atualizaUsuariosBanco();
    procedure btn_deletar_usuarioClick(Sender: TObject);
    procedure btn_salvar_edit_usuarioClick(Sender: TObject);
    procedure btn_salvar_cad_userClick(Sender: TObject);
    procedure editaUsuarioBanco(usuario : TUser);
    procedure btn_atualiza_userClick(Sender: TObject);
    procedure btn_edita_userClick(Sender: TObject);

     procedure lvUserItemClickEx(const Sender: TObject; ItemIndex: Integer;
      const LocalClickPos: TPointF; const ItemObject: TListItemDrawable);

      procedure ListView1ItemClickEx(const Sender: TObject; ItemIndex: Integer;

    const LocalClickPos: TPointF; const ItemObject: TListItemDrawable);
    procedure deleta_usuarios(id_usuario: integer);

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

function TfrmCadastro.buscarUsuarioBanco(id_usuario: integer): Tuser;
var vUser : Tuser;
begin
  FDQuery1.Close;
  FDQuery1.SQL.Clear;
  FDQuery1.SQL.Add('select * from usuarios');
  FDQuery1.SQL.Add('where codigo = :codigo');
  FDQuery1.ParamByName('codigo').AsInteger := id_usuario;

  FDQuery1.Open();

  vUser.codigo := id_usuario;
  vUser.username :=FDQuery1.FieldByName('username').AsString;
  vUser.password :=FDQuery1.FieldByName('password').AsString;
  //vUser.is_adm :=FDQuery1.FieldByName('is_adm').AsBoolean;

  Result := vUser;
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

procedure TfrmCadastro.deleta_clientes(id_cliente: integer);
begin
    FDQuery1.Close;
    FDQuery1.SQL.Clear;
    FDQuery1.SQL.Add('DELETE FROM cliente');
    FDQuery1.SQL.Add('where codigo = :codigo');
    FDQuery1.ParamByName('codigo').AsInteger := id_cliente;

    FDQuery1.ExecSQL;
end;

procedure TfrmCadastro.deleta_usuarios(id_usuario : integer);
begin
  FDQuery1.Close;
    FDQuery1.SQL.Clear;
    FDQuery1.SQL.Add('DELETE FROM usuarios');
    FDQuery1.SQL.Add('where codigo = :codigo');
    FDQuery1.ParamByName('codigo').AsInteger := id_usuario;

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

procedure TfrmCadastro.atualizaUsuariosBanco;
var vUser : TUser;
vTeste : string;
begin
  FDQuery1.Close;
  FDQuery1.SQL.Clear;
  FDQuery1.SQL.Add('select * from usuarios');

  FDQuery1.Open();
  FDQuery1.First;

  lvUser.Items.Clear;

  while not FDQuery1.Eof do
  begin
    vUser.codigo := FDQuery1.FieldByName('codigo').AsInteger;
    vUser.username := FDQuery1.FieldByName('username').AsString;
    vUser.password := FDQuery1.FieldByName('password').AsString;
    //vUser.is_adm := FDQuery1.FieldByName('is_adm').AsBoolean;

    insereUsuarioLista(vUser);

    FDQuery1.Next;
  end;

end;

procedure TfrmCadastro.btn_atualiza_clienteClick(Sender: TObject);
begin
  atualizaClientesBD;
end;

procedure TfrmCadastro.btn_atualiza_userClick(Sender: TObject);
begin
atualizaUsuariosBanco;
end;

procedure TfrmCadastro.btn_deletaClienteClick(Sender: TObject);
var id_cliente : integer;
begin
  id_cliente := StrToInt(Edit_edita_cliente_cod.Text);
  deleta_clientes(id_cliente);
  ShowMessage('Cliente deletado!');
  TabControl1.TabIndex := 0;
  atualizaClientesBD ;
end;

procedure TfrmCadastro.btn_deletar_usuarioClick(Sender: TObject);
  var id_user : integer;
begin
  id_user := StrToInt(edt_edita_user_cod.Text);
  deleta_usuarios(id_user);
  ShowMessage('Uusario deletado!');
  TabControl1.TabIndex := 0;
  atualizaUsuariosBanco;
end;

procedure TfrmCadastro.btn_edita_userClick(Sender: TObject);
begin
TabControl1.TabIndex := 8;
end;

procedure TfrmCadastro.btn_salvar_cad_userClick(Sender: TObject);
var vUser : TUser;
begin
  vUser.codigo := StrToInt(edt_codigo_user.Text);
  vUser.username := edt_nome_user.Text;
  vUser.password := edt_senha_user.Text;
  //vUser.is_adm := Check_adm.IsChecked;
  TabControl1.TabIndex := 0;

  insereUsuarioBanco(vUser);
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

  procedure TfrmCadastro.btn_salvar_edit_clienteClick(Sender: TObject);
  var vCliente : TCliente;
   begin
    vCliente.codigo := StrToInt(Edit_edita_cliente_cod.Text);
    vCliente.nome := Edit_edita_cliente_nome.Text;
    vCliente.email := Edit_edita_cliente_email.Text;
    vCliente.cnpj := Edit_edita_cliente_cnpj.Text;

    editaClienteBanco(vCliente);

    TabControl1.TabIndex := 0;
    atualizaClientesBD;

   end;

procedure TfrmCadastro.btn_salvar_edit_usuarioClick(Sender: TObject);
  var vUser : Tuser;
begin
  vUser.codigo := StrToInt(edt_edita_user_cod.Text);
  vUser.username := Edt_edita_user_name.Text;
  vUser.password := edt_edita_user_senha.Text;
  //vUser.is_adm := check_edita_adm.IsChecked;

  editaUsuarioBanco(vUser);

  ShowMessage('Usuario editado!');
  TabControl1.TabIndex := 0;
  atualizaUsuariosBanco;


end;

procedure TfrmCadastro.editaClienteBanco(cliente: TCliente);
begin
    FDQuery1.Close;
    FDQuery1.SQL.Clear;
    FDQuery1.SQL.Add('UPDATE CLIENTE set ');
    FDQuery1.SQL.Add('    nome = :nome, ');
    FDQuery1.SQL.Add('    email = :email, ');
    FDQuery1.SQL.Add(' cnpj = :cnpj ');
    FDQuery1.SQL.Add(' where codigo = :codigo ');

    FDQuery1.ParamByName('codigo').AsInteger := cliente.codigo;
    FDQuery1.ParamByName('nome').AsString := cliente.nome;
    FDQuery1.ParamByName('email').AsString := cliente.email;
    FDQuery1.ParamByName('cnpj').AsString := cliente.cnpj;
    FDQuery1.ExecSQL;
end;

procedure TfrmCadastro.editaUsuarioBanco(usuario: TUser);
begin

FDQuery1.Close;
FDQuery1.SQL.Clear;
FDQuery1.SQL.Add('UPDATE usuarios set');
FDQuery1.SQL.Add(' username  :username,');
FDQuery1.SQL.Add('password :password');
//FDQuery1.SQL.Add('is_adm :is_adm');
FDQuery1.SQL.Add('where codigo = :codigo');

FDQuery1.ParamByName('codigo').AsInteger := usuario.codigo;
FDQuery1.ParamByName('username').AsString := usuario.username;
FDQuery1.ParamByName('password').AsString := usuario.password;
//FDQuery1.ParamByName('is_adm').AsBoolean := usuario.is_adm;

FDQuery1.ExecSQL;
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

procedure TfrmCadastro.insereUsuarioBanco(user: TUser);
begin

  FDQuery1.Close;
  FDQuery1.SQL.Clear;
  FDQuery1.SQL.Add('INSERT INTO USUARIOS (codigo, username, password ');
  FDQuery1.SQL.Add('VALUES (:codigo, :username, :password)');
  FDQuery1.ParamByName('codigo').AsInteger := user.codigo;
  FDQuery1.ParamByName('username').AsString := user.username;
  FDQuery1.ParamByName('password').AsString := user.password;
  //FDQuery1.ParamByName('is_adm').AsBoolean := user.is_adm;
  FDQuery1.ExecSQL;
end;

procedure TfrmCadastro.insereUsuarioLista(user: Tuser);
begin

  with lvUser.Items.Add do
  begin
    TListItemText(Objects.FindDrawable('txtid')).Text := IntToStr(user.codigo);
    TListItemText(Objects.FindDrawable('txtusername')).Text := user.username;
    TListItemText(Objects.FindDrawable('txtsenha')).Text := user.password;

    TListItemImage(Objects.FindDrawable('imgedt_user')).Bitmap := Image_edt.Bitmap;

  end;
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
  if ItemObject <> nil then

   if ItemObject.Name = 'imgedt' then
   begin

     id_cliente := StrToInt(TListItemText(ListView1.Items[ItemIndex].Objects.FindDrawable('txtcodigo')).Text);

     vCliente :=  buscarClienteBD(id_cliente);

     Edit_edita_cliente_cod.Text := IntToStr(vCliente.codigo);
     Edit_edita_cliente_nome.Text := vCliente.nome;
     Edit_edita_cliente_email.Text := vCliente.email;
     Edit_edita_cliente_cnpj.Text := vCliente.cnpj;

       TabControl1.TabIndex := 6;
   end;

end;

procedure TfrmCadastro.lvUserItemClickEx(const Sender: TObject;
  ItemIndex: Integer; const LocalClickPos: TPointF;
  const ItemObject: TListItemDrawable);
  var vUser : TUser;
  id_user : integer;
begin
   if ItemObject.Name = 'imgedt_user' then
   begin
     id_user := StrToInt(TListItemText(lvUser.Items[ItemIndex].Objects.FindDrawable('txtid')).Text);

     vUser := buscarUsuarioBanco(id_user);

     edt_edita_user_cod.Text := IntToStr(vUser.codigo);
     Edt_edita_user_name.Text := vUser.username;
     edt_edita_user_senha.Text := vUser.password;
     //check_edita_adm.Text := BoolToStr(vUser.is_adm);


       TabControl1.TabIndex := 7;
   end;

end;

procedure TfrmCadastro.SpeedButton1Click(Sender: TObject);
begin
TabControl1.TabIndex := 0;
end;

end.
