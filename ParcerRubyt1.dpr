program ParcerRubyt1;

uses
  Forms,
  UnitForm in 'UnitForm.pas' {FrmView};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFrmView, FrmView);
  Application.Run;
end.
