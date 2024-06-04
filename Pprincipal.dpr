program Pprincipal;

uses
  System.StartUpCopy,
  FMX.Forms,
  Uprincipal in 'Uprincipal.pas' {frmLogin},
  UGrid_btns in 'UGrid_btns.pas' {frmGrid};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfrmLogin, frmLogin);
  Application.CreateForm(TfrmGrid, frmGrid);
  Application.Run;
end.
