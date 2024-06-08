program Pprincipal;

uses
  System.StartUpCopy,
  FMX.Forms,
  Uprincipal in 'Uprincipal.pas' {frmLogin},
  UGrid_btn in 'UGrid_btn.pas' {frm_btns},
  UCadastro in 'UCadastro.pas' {frmCadastro};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfrmLogin, frmLogin);
  Application.CreateForm(Tfrm_btns, frm_btns);
  Application.CreateForm(TfrmCadastro, frmCadastro);
  Application.Run;

end.

