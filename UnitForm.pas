unit UnitForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls;

type
  TStrArr = array[0..1000] of string;
  TWordInStr = array[0..100] of string;

  TOperators = record
    item : string;
    Num : Integer;
  end;

  TOperands = record
    item : string;
    Num : Integer;
  end;

  TOperatorsArray = array[0..100] of TOperators;
  TOperandsArray = array[0..200] of TOperands;

  TFrmView = class(TForm)
    btnLoadFile: TButton;
    dlgOpen: TOpenDialog;
    mmoView: TMemo;
    btnParc: TButton;
    lvOperators: TListView;
    lvOperands: TListView;
    EditSummaSpen: TEdit;
    Label2: TLabel;
    lvP: TListView;
    lvPuts: TListView;
    lvT: TListView;
    lvM: TListView;
    lvT_2: TListView;
    lvC_2: TListView;
    lvM_2: TListView;
    lvP_2: TListView;
    Label1: TLabel;
    EditChepin_1: TEdit;
    Label3: TLabel;
    Edit2: TEdit;
    procedure btnLoadFileClick(Sender: TObject);
    procedure btnParcClick(Sender: TObject);
  private
    { Private declarations }
  public
    procedure ReadFromFile(var text : TStrArr; var Size : Integer);
    procedure ShowInTables;
    procedure ShowC;
    procedure ShowP;
    procedure ShowPuts;
    procedure ReadDefault(var operators : TStrArr; var Size : Integer);
    procedure ReadDefault2(var operators : TStrArr; var Size : Integer);
    procedure Parcing(TextSize : Integer; Text : TStrArr);
    procedure SortOperands(var Operands : TOperandsArray);
    procedure SortOperators(var Operators : TOperatorsArray);
    procedure AddOperator(Operator : string);
    procedure AddOperand(Operand : string);
    procedure ShowInMemo(text : TStrArr; Size : Integer);
    procedure TabDelete(var Text : TStrArr);
    procedure StringLiteralSearch(var Text : TStrArr);
    procedure SearchDefaultOperators(var Text : TStrArr);
    procedure ClearDefault(var Text : TStrArr);
    procedure CheckOnDef(var Text : TStrArr);
    procedure FindBrackets(var Text : TStrArr);
    procedure FindMethods(var Text : TStrArr);
    procedure FindOperans(var Text : TStrArr);
    procedure CleningText(var Text : TStrArr);
    function ifEmpty(str : string) : Boolean;
    procedure DeleteCommentaries(var Text : TStrArr);
    procedure SearchDefaultOperatorsC(var Text: TStrArr);
    procedure Parcing2(TextSize: Integer; Text: TStrArr);
    procedure AddC(C: string);
    procedure AddP(P: string);
    procedure AddT(T: string);
    procedure AddM(M: string);
    procedure AddPuts(P: string);
    procedure SearchP(var Text: TStrArr);
    procedure SearchPuts(var Text: TStrArr);
    //procedure ShowInTablesC;
  end;

var
  FrmView: TFrmView;

implementation

var
  Operators : TOperatorsArray;
  Operands : TOperandsArray;
  IdC :  TOperatorsArray;
  IdCNum:  Integer = 0;
  IdT :  TOperatorsArray;
  IdTNum:  Integer = 0;
  IdM :  TOperatorsArray;
  IdMNum:  Integer = 0;
  IdP :  TOperatorsArray;
  IdPNum:  Integer = 0;
  IdPuts :  TOperatorsArray;
  IdPutsNum:  Integer = 0;
  OperatorsNum : Integer = 0;
  OperandsNum : Integer = 0;
  IshText : TStrArr;
  IshTextSize : Integer;
  IshText2 : TStrArr;
  IshTextSize2 : Integer;
  DefaultOperators : TStrArr;
  DefaultOperatorsSize : Integer = 0;
  DefaultOperatorsC : TStrArr;
  DefaultOperatorsSizeC : Integer = 0;
  SummaSpen: integer = 0;
  Q1: real;

{$R *.dfm}
//���������� ��������
procedure TFrmView.AddOperand(Operand: string);
var
  I: Integer;
  FlUniq: Boolean;
begin
  FlUniq := true;
  I := 0;
  While (I <= OperandsNum-1) and (FlUniq) do
  begin
    If Operand = Operands[I].item then
    begin
      FlUniq := false;
      Inc(Operands[I].Num);
    end;
    inc(i);
  end;
  If FlUniq then
  begin
    Operands[OperandsNum].item := Operand;
    Operands[OperandsNum].Num := 1;
    Inc(OperandsNum);
  end;
end;

procedure TFrmView.AddPuts(P: string);
var
  I: Integer;
  FlUniq: Boolean;
begin
  FlUniq := true;
  I := 0;
  While (I <= IdPutsNum-1) and (FlUniq) do
  begin
    If P = IdPuts[I].item then
    begin
      FlUniq := false;
      Inc(IdPuts[I].Num);
    end;
    inc(i);
  end;
  If FlUniq then
  begin
    IdPuts[IdPutsNum].item := P;
    IdPuts[IdPutsNum].Num := 1;
    Inc(IdPutsNum);
  end;
end;

procedure TFrmView.AddP(P: string);
var
  I: Integer;
  FlUniq: Boolean;
begin
  FlUniq := true;
  I := 0;
  While (I <= IdPNum-1) and (FlUniq) do
  begin
    If P = IdP[I].item then
    begin
      FlUniq := false;
      Inc(IdP[I].Num);
    end;
    inc(i);
  end;
  If FlUniq then
  begin
    IdP[IdPNum].item := P;
    IdP[IdPNum].Num := 1;
    Inc(IdPNum);
  end;
end;

procedure TFrmView.AddT(T: string);
var
  I: Integer;
  FlUniq: Boolean;
begin
  FlUniq := true;
  I := 0;
  While (I <= IdTNum-1) and (FlUniq) do
  begin
    If T = IdT[I].item then
    begin
      FlUniq := false;
      Inc(IdT[I].Num);
    end;
    inc(i);
  end;
  If FlUniq then
  begin
    IdT[IdTNum].item := T;
    IdT[IdTNum].Num := 1;
    Inc(IdTNum);
  end;
end;

procedure TFrmView.AddC(C: string);
var
  I: Integer;
  FlUniq: Boolean;
begin
  FlUniq := true;
  I := 0;
  While (I <= IdCNum-1) and (FlUniq) do
  begin
    If C = IdC[I].item then
    begin
      FlUniq := false;
      Inc(IdC[I].Num);
    end;
    inc(i);
  end;
  If FlUniq then
  begin
    IdC[IdCNum].item := C;
    IdC[IdCNum].Num := 1;
    Inc(IdCNum);
  end;
end;

procedure TFrmView.AddM(M: string);
var
  I: Integer;
  FlUniq: Boolean;
begin
  FlUniq := true;
  I := 0;
  While (I <= IdMNum-1) and (FlUniq) do
  begin
    If M = IdM[I].item then
    begin
      FlUniq := false;
      Inc(IdM[I].Num);
    end;
    inc(i);
  end;
  If FlUniq then
  begin
    IdM[IdMNum].item := M;
    IdM[IdMNum].Num := 1;
    inc(IdMNum);
  end;
end;

//���������� ���������
procedure TFrmView.AddOperator(Operator: string);
var
  I: Integer;
  FlUniq: Boolean;
begin
  FlUniq := true;
  I := 0;
  While (I <= OperatorsNum-1) and (FlUniq) do
  begin
    If Operator = Operators[I].item then
    begin
      FlUniq := false;
      Inc(Operators[I].Num);
    end;
    inc(i);
  end;
  If FlUniq then
  begin
    Operators[OperatorsNum].item := Operator;
    Operators[OperatorsNum].Num := 1;
    Inc(OperatorsNum);
  end;
end;

//�������� ����
procedure TFrmView.btnLoadFileClick(Sender: TObject);
var i :integer;
begin
  IshTextSize := 0;
  IshTextSize2 := 0;
  CleningText(IshText);
  CleningText(IshText2);              //������������� (������� �������)
  ReadFromFile(IshText,IshTextSize);  //���������� ���� � ������ �����
  for i:=0 to IshTextSize do
    IshText2[i]:=IshText[i];
  ShowInMemo(IshText,IshTextSize);     //����� ��������� ���� �� �����
end;

function TFrmView.ifEmpty(str: string): Boolean;
begin
  Result := False;
  If str = '' then
    Result := true;
end;

//������� ������
procedure TFrmView.Parcing(TextSize: Integer; Text: TStrArr);
begin
  lvOperators.Clear;      //������� ListView
  lvOperands.Clear;       //������� ListView
  lvT.Clear;
  lvM.Clear;
  lvM_2.Clear;
  lvP_2.Clear;
  lvC_2.Clear;
  lvT_2.Clear;
  OperatorsNum := 0;
  OperandsNum := 0;
  DefaultOperatorsSize := 0;
  ReadDefault(DefaultOperators,DefaultOperatorsSize);   //������ �����, integer
  TabDelete(Text);               //�������� ������ ����������
  DeleteCommentaries(Text);      //�������� ������������
  StringLiteralSearch(Text);     //����� � ���������� �������� ��������� � ��������
  CheckOnDef(Text);              //����� �������
  SearchDefaultOperators(Text);  //����� ���������� � ������
  ClearDefault(Text);            //�������� ���� �� ����
  FindBrackets(Text);            //����� ������
  FindMethods(Text);
  FindOperans(Text);
  SortOperands(Operands);
  SortOperators(Operators);
  ShowInTables;                  //��������� ���������� � ��������� � �������
end;

procedure TFrmView.Parcing2(TextSize: Integer; Text: TStrArr);
var i,j,k:integer;
checkP,checkC,check_C2,check_P2:boolean;
begin
  
  lvOperators.Clear;      //������� ListView
  //lvOperands.Clear;       //������� ListView
  IdCNum := 0;
  IdPNum := 0;
  DefaultOperatorsSize := 0;
  TabDelete(Text);               //�������� ������ ����������
  DeleteCommentaries(Text);      //�������� ������������
  StringLiteralSearch(Text);     //����� � ���������� �������� ��������� � ��������
  CheckOnDef(Text);
  ReadDefault2(DefaultOperatorsC,DefaultOperatorsSizeC);
  SearchDefaultOperatorsC(Text);
  ShowC;
  SearchP(Text);
  ShowP;
  SearchPuts(Text);
  ShowPuts;
  //   �
  i:=0; k:=0; checkP:=true; checkC:=true;
  while i <= OperandsNum-2 do
  begin
    for j := 0 to IdPNum-1 do
    begin
      if (Operands[i+1].item) = IdP[j].item then
        checkP:=false;
    end;
    for j := 0 to IdCNum-1 do
    begin
      if (Operands[i+1].item) = IdC[j].item then
        checkC:=false;
    end;
    if ((Operands[i+1].Num) <> 100)and(checkP)and(checkC) then
    begin
      lvM.Items.Add.Caption := IntToStr(k+1);
      with lvM.Items[k].SubItems do
      begin
        Add(Operands[i+1].item);
        AddM(Operands[i+1].item);
      end;
      inc(k);
    end;
    inc(i); checkP:=true; checkC:=true;
  end;
  //   �_2
  i:=0; k:=0; check_C2:=false;check_P2:=false;
  while i <= IdCNum-2 do
  begin
    for j := 0 to IdPutsNum-1 do
    begin
      if (IdC[i+1].item) = IdPuts[j].item then
        check_C2:=true;
    end;
    for j := 0 to IdPNum-1 do
    begin
      if (IdC[i+1].item) = IdP[j].item then
        check_P2:=true;
    end;
    if (check_C2)or(check_P2) then
    begin
      lvC_2.Items.Add.Caption := IntToStr(k+1);
      with lvC_2.Items[k].SubItems do
      begin
        Add(IdC[i+1].item);
      end;
      inc(k);
    end;
    inc(i); check_C2:=false; check_P2:=false;
  end;
  //   T_2
  i:=0; k:=0; check_C2:=false;check_P2:=false;
  while i <= IdTNum-2 do
  begin
    for j := 0 to IdPutsNum-1 do
    begin
      if (IdT[i+1].item) = IdPuts[j].item then
        check_C2:=true;
    end;
    for j := 0 to IdPNum-1 do
    begin
      if (IdC[i+1].item) = IdP[j].item then
        check_P2:=true;
    end;
    if (check_C2)or(check_P2) then
    begin
      lvT_2.Items.Add.Caption := IntToStr(k+1);
      with lvT_2.Items[k].SubItems do
      begin
        Add(IdT[i+1].item);
      end;
      inc(k);
    end;
    inc(i); check_C2:=false;check_P2:=false;
  end;
  //   M_2
  i:=0; k:=0; check_C2:=false;check_P2:=false;
  while i <= IdMNum-2 do
  begin
    for j := 0 to IdPutsNum-1 do
    begin
      if (IdM[i+1].item) = IdPuts[j].item then
        check_C2:=true;
    end;
    for j := 0 to IdPNum-1 do
    begin
      if (IdM[i+1].item) = IdP[j].item then
        check_P2:=true;
    end;
    if (check_C2)or(check_P2) then
    begin
      lvM_2.Items.Add.Caption := IntToStr(k+1);
      with lvM_2.Items[k].SubItems do
      begin
        Add(IdM[i+1].item);
      end;
      inc(k);
    end;
    inc(i); check_C2:=false;check_P2:=false;
  end;
  //������� ������
  Q1:=(IdPNum) + (2*IdMNum) + (3*IdCNum) + (IdTNum/2);
  EditChepin_1.Text:=FloatToStr(Q1);
end;

//���������
procedure TFrmView.ReadDefault(var operators: TStrArr; var Size: Integer);
var
  F : TextFile;
  i : Integer;
begin
  AssignFile(F,'DefaultOperators.txt');
  i:=0;
  Reset(F);
  while not Eof(F) do
  begin
    readln(F,operators[i]);
    inc(i);
  end;

  Size := i-1;
  CloseFile(F);
end;
procedure TFrmView.ReadDefault2(var operators: TStrArr; var Size: Integer);
var
  F : TextFile;
  i : Integer;
begin
  AssignFile(F,'OperatorsC.txt');
  i:=0;
  Reset(F);
  while not Eof(F) do
  begin
    readln(F,operators[i]);
    inc(i);
  end;

  Size := i-1;
  CloseFile(F);
end;
//���������� ���� � ������ �����
procedure TFrmView.ReadFromFile(var text: TStrArr; var Size: Integer);
var
  F : TextFile;
  i : Integer;
begin
  if dlgOpen.Execute then
    AssignFile(F,dlgOpen.FileName)
  else
    AssignFile(F,'empt.txt');

  Reset(F);
  i := 0;
  while not Eof(F) do
  begin
    Readln(F,Text[i]);
    inc(i);
  end;

  Size := i-1;
  CloseFile(F);
end;
//����� ��������� ���� �� �����
procedure TFrmView.ShowInMemo(text: TStrArr; Size : integer);
var
  i : Integer;
begin
  mmoView.Clear;
  i := 0;
  while i<=Size do
  begin
    mmoView.Lines.Add(Text[i]);
    inc(i);
  end;
end;

procedure TFrmView.ShowP;
var
  i,j : Integer;
begin
  lvP.Clear;

  i:=0;
  while i <= IdPNum-1 do
  begin
    lvP.Items.Add.Caption := IntToStr(i+1);
    with LvP.Items[I].SubItems do
    begin
      Add(IdP[i].item);
      Add(IntToStr(IdP[i].Num));
    end;
    lvP_2.Items.Add.Caption := IntToStr(i+1);
    with LvP_2.Items[I].SubItems do
    begin
      Add(IdP[i].item);
      Add(IntToStr(IdP[i].Num));
    end;
    inc(i);
  end;
end;

procedure TFrmView.ShowPuts;
var
  i,j : Integer;
begin
  lvPuts.Clear;

  i:=0;
  while i <= IdPutsNum-1 do
  begin
    lvPuts.Items.Add.Caption := IntToStr(i+1);
    with LvPuts.Items[I].SubItems do
    begin
      Add(IdPuts[i].item);
      Add(IntToStr(IdPuts[i].Num));
    end;
    inc(i);
  end;
end;

procedure TFrmView.ShowC;
var
  i,j : Integer;
begin
  lvOperators.Clear;

  i:=0;
  while i <= IdCNum-1 do
  begin
    lvOperators.Items.Add.Caption := IntToStr(i+1);
    with LvOperators.Items[I].SubItems do
    begin
      Add(IdC[i].item);
      Add(IntToStr(IdC[i].Num));
    end;
    inc(i);
  end;
end;

//��������� ���������� � ��������� � �������
procedure TFrmView.ShowInTables;
var
  i,j,k : Integer;
begin
  lvOperators.Clear;
  lvOperands.Clear;

  i:=0;
  while i <= OperatorsNum-1 do
  begin
    lvOperators.Items.Add.Caption := IntToStr(i+1);
    with LvOperators.Items[I].SubItems do
    begin
      Add(Operators[i].item);
      Add(IntToStr(Operators[i].Num));
    end;
    inc(i);
  end;

  SummaSpen:=0;
  for j:=1 to OperandsNum-1 do
    SummaSpen:=SummaSpen+Operands[j].Num-1;

  i:=0;
  while i <= OperandsNum-2 do
  begin
    lvOperands.Items.Add.Caption := IntToStr(i+1);
    with LvOperands.Items[I].SubItems do
    begin
      Add(Operands[i+1].item);
      Add(IntToStr(Operands[i+1].Num-1));
                                         ///////////////////////////// -1
    end;
    inc(i);
  end;

  i:=0; k:=0;
  while i <= OperandsNum-2 do
  begin
    if (Operands[i+1].Num-1) = 0 then
    begin
      lvT.Items.Add.Caption := IntToStr(k+1);
      with lvT.Items[k].SubItems do
      begin
        Add(Operands[i+1].item);
        AddT(Operands[i+1].item);
        Operands[i+1].Num:=100;
      end;
      inc(k);
    end;
    inc(i);
  end;

  EditSummaSpen.Text:=IntToStr(SummaSpen);
end;

procedure TFrmView.SortOperands(var Operands: TOperandsArray);
var
  I, J, CurrMax: Integer;
  SwapVar: TOperands;
begin
  For I := 0 to OperandsNum-1 do
  begin
    CurrMax := I;
    For J := I+1 to OperandsNum-1 do
    begin
      If Operands[J].Num > Operands[CurrMax].Num then
        CurrMax := J;
    end;
    SwapVar := Operands[I];
    Operands[I] := Operands[CurrMax];
    Operands[CurrMax] := SwapVar;
  end;
end;

procedure TFrmView.SortOperators(var Operators: TOperatorsArray);
var
  I, J, CurrMax: Integer;
  SwapVar: TOperators;
begin
  For I := 0 to OperatorsNum-1 do
  begin
    CurrMax := I;
    For J := I+1 to OperatorsNum-1 do
    begin
      If Operators[J].Num > Operators[CurrMax].Num then
        CurrMax := J;
    end;
    SwapVar := Operators[I];
    Operators[I] := Operators[CurrMax];
    Operators[CurrMax] := SwapVar;
  end;
end;

//�������� ������ ����������
procedure TFrmView.TabDelete(var Text: TStrArr);
var
  I: Integer;
begin
  For I := 0 to IshTextSize do
  begin
    if Text[i] <> '' then
      While Text[I][1] = ' ' do     //�������� ������� ���������
      begin
        Delete(Text[I],1,1);
        if Length(Text[i]) = 0 then
          Break;
      end;
  end;
end;
//�������� ������������
procedure TFrmView.DeleteCommentaries(var Text: TStrArr);
var
  i,j : Integer;
  NeedToDelete : Boolean;
begin
  i:=0;
  while i <= IshTextSize do
  begin
    if Pos('=begin',Text[i]) > 0 then
    begin
      while Pos('=end',Text[i]) = 0 do
      begin
        Delete(Text[i],1,Length(Text[i]));
        inc(i);
      end;
      Delete(Text[i],1,Length(Text[i]));
      inc(i);
      Continue;
    end;
    j:=1;
    NeedToDelete := TRUE;
    while j<= Length(Text[i]) do
    begin
      if Text[i][j] = '"' then
        NeedToDelete := not NeedToDelete;
      if (Text[i][j] = '#') and NeedToDelete then
        Delete(Text[i],j,Length(Text[i])+1);
      Inc(j);
    end;
    Inc(i);
  end;
end;
//����� �������� ������
procedure TFrmView.btnParcClick(Sender: TObject);
begin
  Parcing(IshTextSize,IshText);
  Parcing2(IshTextSize2,IshText2);
end;
//����� � ���������� �������� ��������� � ��������
procedure TFrmView.StringLiteralSearch(var Text : TStrArr);
var
  i,j,k,jpos : integer;
  TempString : string;
  TempTempString : string;
begin
  i:=0;
  while i<=IshTextSize do
  begin
    j:=1;
    while j <= Length(Text[i]) do
    begin
      TempString := '';
      if Text[i][j] = '"' then                 //�� ������ ��������(������ ")
      begin
        jpos := j;
        TempString := TempString + Text[i][j];
        inc(j);
        while Text[i][j] <> '"' do             //�� ����� ��������(������ ")
        begin
          TempString := TempString + Text[i][j];
          inc(j);
        end;

        TempString := TempString + Text[i][j];
        Inc(j);
        //AddOperand(TempString);                //�������� � ��������

        if (Pos('#{',TempString) <> 0) and (Pos('}',TempString)>Pos('#{',TempString)) then
        begin
          k:=Pos('#{',TempString) + 2;
          TempTempString := '';
          while TempString[k] <> '}' do
          begin
            TempTempString:=TempTempString + TempString[k];
            inc(k);
          end;
         //AddOperand(TempTempString);          //�������� � ��������
        end;

        Delete(Text[i],jpos,Length(TempString));
        j:=jpos;
      end;

      Inc(j);
    end;

    inc(i);
  end;
end;
//����� ���������� � ������
procedure TFrmView.SearchDefaultOperators(var Text: TStrArr);
var
  i,j : Integer;
begin
  i:=0;
  while i <= IshTextSize do
  begin
    j:=0;
    while j <= DefaultOperatorsSize do
    begin
      while Pos(DefaultOperators[j],Text[i]) <> 0 do
      begin
        AddOperator(DefaultOperators[j]);    //���������� ��������� � ������
        Delete(Text[i],Pos(DefaultOperators[j],Text[i]),Length(DefaultOperators[j]));//��������
      end;
      Inc(j);
    end;
    inc(i);
  end;
end;
//�������� ���� �� ����
procedure TFrmView.ClearDefault(var Text: TStrArr);
const
  Mass : array[1..8] of string = ('then','when','else','end','elseif','begin','do','in');
var
  i,j : Integer;
begin
  i:=0;
  while i <= IshTextSize do
  begin
    j:=1;
    while j <= 8 do
    begin
      if Pos(Mass[j],Text[i]) > 0 then
        Delete(Text[i],Pos(Mass[j],Text[i]),Length(Mass[j]));
      inc(j);
    end;

    while Pos(',',Text[i]) > 0 do
      Text[i][Pos(',',Text[i])] := ' ';

    inc(i);
  end;
end;
//����� �������
procedure TFrmView.CheckOnDef(var Text: TStrArr);
var
  i,j : Integer;
  begtmp : Integer;
  tempstr : string;
begin
  i := 0;
  while i <= IshTextSize do
  begin
    if Pos('def',Text[i]) > 0 then
    begin
      j := Pos('def',Text[i])+3;    //���, ��� ����� def

      while Text[i][j] = ' ' do     //����� ������ ���������� �����
        inc(j);

      begtmp := j;
      tempstr := '';
      while (Text[i][j] <> ' ') and (Text[i][j] <> '(') do //���� ����� �� �����������
      begin
        tempstr := tempstr + Text[i][j];    //���������� � �����
        inc(j);
      end;

      inc(DefaultOperatorsSize);
      DefaultOperators[DefaultOperatorsSize] := tempstr;  //� ������ ����������
      Delete(Text[i],begtmp,Length(tempstr));      //������� �� ����
    end;

    inc(i);
  end;
end;
//����� ������
procedure TFrmView.FindBrackets(var Text: TStrArr);
var
  i, j : Integer;
begin
  i:=0;
  while i <= IshTextSize do
  begin
    while (Pos('(',Text[i])>0) do
    begin
      Text[i][Pos('(',Text[i])] := ' ';
      Text[i][Pos(')',Text[i])] := ' ';
      AddOperator('()');     //���������� � ���������
    end;

    while (Pos('[',Text[i]) > 0) do
    begin
      Text[i][Pos('[',Text[i])] := ' ';
      Text[i][Pos(']',Text[i])] := ' ';
      AddOperator('[]');     //���������� � ���������
      
    end;
    inc(i);
  end;
end;

procedure TFrmView.FindMethods(var Text: TStrArr);
var
  i, j,begtmp : Integer;
  tempstr : string;
begin
  i := 0;
  while i <= IshTextSize do
  begin
    while pos('.',Text[i]) > 0 do
    begin
      while  (Text[i][1+pos('.',Text[i])] >= '0') and (Text[i][1+pos('.',Text[i])] <= '9') and (pos('.',Text[i])<>0) do
      begin
        tempstr := '';
        j := pos('.',Text[i]) - 1;
        while (Text[i][j] <> ' ') and (j <> 0)  do
          dec(j);
        j := j+1;
        begtmp := j;
        while (Text[i][j] <> ' ') and (j <= length(Text[i])) do
        begin
          tempstr := tempstr + Text[i][j];
          inc(j);
        end;
        AddOperand(tempstr);
        Delete(Text[i],begtmp,length(tempstr));
      end;

      while ((Text[i][1+pos('.',Text[i])] < '0') or (Text[i][1+pos('.',Text[i])] > '9')) and (pos('.',Text[i]) <> 0)  do
      begin
        tempstr := '';
        j := pos('.',Text[i]) + 1;
        begtmp := j-1;
        while (Text[i][j] <> ' ') and (j <= length(Text[i])) do
        begin
          tempstr := tempstr + Text[i][j];
          inc(j)
        end;
        AddOperator(tempstr);
        Delete(Text[i],begtmp,length(tempstr)+1);
        AddOperator('.');

      end;
    end;
    inc(i);
  end;
end;

procedure TFrmView.FindOperans(var Text: TStrArr);
var
  i,j : Integer;
  tempstring : string;
  Mn: set of char;
begin
  Mn:=['0','1','2','3','4','5','6','7','8','9'];
  i:=0;
  while i <= IshTextSize do
  begin
    if ifEmpty(Text[i]) then
    begin
      inc(i);
      Continue;
    end;

    j:=1;
    while j <= Length(Text[i]) do
    begin
      tempstring := '';
      while (Text[i][j] = ' ') and (j<=Length(Text[i])) do
        Inc(j);

      while (Text[i][j] <> ' ') and (j<=Length(Text[i])) do
      begin
        tempstring := tempstring + Text[i][j];
        inc(j);
      end;
      if (tempstring <> '')and(not(tempstring[1] in Mn)) then
        AddOperand(tempstring);
    end;
    inc(i);
  end;
end;
//������������� (������� �������)
procedure TFrmView.CleningText(var Text: TStrArr);
var
  i : Integer;
begin
  for i:=0 to 1000 do
    Text[i] := '';
end;

procedure TFrmView.SearchDefaultOperatorsC(var Text: TStrArr);
var
  i,j,h : Integer;
  temp:string;
begin
  i:=0;
  while i <= IshTextSize do
  begin
    j:=0;
    while j <= DefaultOperatorsSizeC do
    begin
      while Pos(DefaultOperatorsC[j],Text[i]) <> 0 do
      begin
        temp:='';
       // AddOperator(DefaultOperatorsC[j]);    //���������� ��������� � ������
        //Delete(Text[i],Pos(DefaultOperatorsC[j],Text[i]),Length(DefaultOperatorsC[j]));//��������
        h := Pos(DefaultOperatorsC[j],Text[i]) + Length(DefaultOperatorsC[j])+1;

        while (h <= length(Text[i])) and (Text[i][h] <> ' ') and (Text[i][h] <> '=') and (Text[i][h] <> '>') and (Text[i][h] <> '<') and (not (Text[i,h] in ['0'..'9'])) and (Text[i,h] <> '[') and (Text[i,h] <> '.' ) do
        begin
          temp := temp + Text[i][h];
          //ShowMessage(temp);
          inc(h);
        end;
        if temp <> '' then
          AddC(temp);
        Delete(Text[i],Pos(DefaultOperatorsC[j],Text[i]),Length(DefaultOperatorsC[j]));
      end;
      Inc(j);
    end;
    inc(i);
  end;
end;

procedure TFrmView.SearchP(var Text: TStrArr);
var
  i,j,h : Integer;
  temp:string;
  gets, str : string;
begin                            
  i:=0;
  while i <= IshTextSize do
  begin
    gets := 'gets';
      while Pos(gets,Text[i]) <> 0 do
      begin
        temp:='';
        str:='';
       // AddOperator(DefaultOperatorsC[j]);    //���������� ��������� � ������
        //Delete(Text[i],Pos(DefaultOperatorsC[j],Text[i]),Length(DefaultOperatorsC[j]));//��������
        h := Pos(gets,Text[i]) - 4;

        while (h > 0) and (Text[i, h]<>' ') do
        begin
          temp := temp + Text[i][h];
          //ShowMessage(temp);
          dec(h);
        end;
        if temp <> '' then
        begin
          for j:= length(temp) downto 1 do
            str := str + temp[j];
          AddP(str);
        end;
        Delete(Text[i],Pos(gets,Text[i]),Length(gets));
      end;
    inc(i);
  end;
end;

procedure TFrmView.SearchPuts(var Text: TStrArr);
var
  i,j,h : Integer;
  temp:string;
  puts, str : string;
begin                            
  i:=0;
  while i <= IshTextSize do
  begin
    puts := 'puts';
      while Pos(puts,Text[i]) <> 0 do
      begin
        temp:='';
        str:='';
       // AddOperator(DefaultOperatorsC[j]);    //���������� ��������� � ������
        //Delete(Text[i],Pos(DefaultOperatorsC[j],Text[i]),Length(DefaultOperatorsC[j]));//��������
        h := Pos(puts,Text[i])+Length(Puts)+1;

        while (h <= length(Text[i])) and (Text[i, h]<>' ') and (Text[i][h] <> '>') and (Text[i,h] <> '"' )  do
        begin
          temp := temp + Text[i][h];
          //ShowMessage(temp);
          inc(h);
        end;
        if temp <> '' then
          AddPuts(temp);
        Delete(Text[i],Pos(puts,Text[i]),Length(puts));
      end;
    inc(i);
  end;
end;

end.
