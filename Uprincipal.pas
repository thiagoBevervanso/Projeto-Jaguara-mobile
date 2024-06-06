unit Uprincipal;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.Layouts, FMX.Objects, FMX.Edit, UGrid_btn,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf,
  FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async,
  FireDAC.Phys, FireDAC.Phys.SQLite, FireDAC.Phys.SQLiteDef,
  FireDAC.Stan.ExprFuncs, FireDAC.Phys.SQLiteWrapper.Stat, FireDAC.FMXUI.Wait,
  Data.DB, FireDAC.Comp.Client, FireDAC.Stan.Param, FireDAC.DatS,
  FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.Comp.DataSet;

type
  TfrmLogin = class(TForm)
    Layout1: TLayout;
    StyleBook1: TStyleBook;
    Panel1: TPanel;
    Layout2: TLayout;
    Layout3: TLayout;
    Label1: TLabel;
    Layout4: TLayout;
    Label2: TLabel;
    edt_usuario: TEdit;
    edt_senha: TEdit;
    Label3: TLabel;
    Label4: TLabel;
    btn_login: TButton;
    Image1: TImage;
    FDConnection1: TFDConnection;
    FDQuery1: TFDQuery;
    procedure btn_loginClick(Sender: TObject);
  private
    { Private declarations }
    function authenticadorUsuario(username, password: string): Boolean;
    procedure navigateToMainForm;
  public
    { Public declarations }
    usuarioLogado: string;
    senhaLogada: string;
    isAdmin: Boolean  ;
  end;

var
  frmLogin: TfrmLogin;



implementation

{$R *.fmx}

procedure TfrmLogin.btn_loginClick(Sender: TObject);
begin
   if authenticadorUsuario(edt_usuario.Text, edt_senha.Text) then
   begin
    navigateToMainForm;
   end
   else
   begin
     ShowMessage('Login ou senha invalidos');
   end;

end;

procedure TfrmLogin.navigateToMainForm;
begin
  Application.CreateForm(Tfrm_btns, frm_btns);
  frm_btns.usuarioLogado := usuarioLogado;
  frm_btns.senhaLogada := senhaLogada;
  frm_btns.isAdmin := isAdmin;
  frm_btns.Show;
  Self.Close;
end;

function TfrmLogin.authenticadorUsuario(username, password: string): Boolean;
  var

    SQLQuery : TFDQuery;

  begin


    Result := False;
    SQLQuery := TFDQuery.Create(nil);

    try
    SQLQuery.SQL.Text := 'SELECT is_adm FROM usuarios WHERE username = :username AND password = :password';
    SQLQuery.Params.ParamByName('username').AsString := username;
    SQLQuery.Params.ParamByName('password').AsString := password;
    SQLQuery.Open;
    if not SQLQuery.Eof then
      begin
        isAdmin := SQLQuery.FieldByName('is_adm').AsBoolean;
        Result := True;
        usuarioLogado :=username;
        senhaLogada := password;
      end;

    finally
    SQLQuery.Free;

    end;
  end;




end.
