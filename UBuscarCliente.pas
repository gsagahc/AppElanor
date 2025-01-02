unit UBuscarCliente;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, ExtCtrls, pngextra, StdCtrls, DB,
  IBCustomDataSet, IBQuery;

type
  TCliente=class
   IdCliente:Integer;
   NomeCliente:String;
   Endereco:string;
   Bairro:string;
   Cidade:String;
   Cep:string;
   Id_Prazo:Integer;
   Estado:string;
   Boleto:string;
   Lote: string;
end;
type
  TFrmBuscarCliente = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    DBGrid1: TDBGrid;
    EditNome: TEdit;
    EditCNPJ: TEdit;
    PNGButton2: TPNGButton;
    PNGButton6: TPNGButton;
    IBQCliente: TIBQuery;
    DSCliente: TDataSource;
    Label1: TLabel;
    Label2: TLabel;
    TimerBusca: TTimer;
    procedure PNGButton2Click(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure PNGButton6Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure CriarCliente;
    procedure TimerBuscaTimer(Sender: TObject);
    procedure EditNomeChange(Sender: TObject);
    procedure EditCNPJChange(Sender: TObject);
  private
    { Private declarations }
  public
    Cliente:TCliente;
    { Public declarations }
  end;

var
  FrmBuscarCliente: TFrmBuscarCliente;

implementation
Uses UPrincipal, UMensagens, UCadCli, Math;

{$R *.dfm}

procedure TFrmBuscarCliente.PNGButton2Click(Sender: TObject);
begin
  Close;
end;

procedure TFrmBuscarCliente.DBGrid1DblClick(Sender: TObject);
begin
  CriarCliente;
end;

procedure TFrmBuscarCliente.PNGButton6Click(Sender: TObject);
Var StrSql:string;
begin
  if (Trim(EditNome.Text)<>EmptyStr) Or (Trim(EditCNPJ.Text)<>EmptyStr) Then
  Begin
   If Trim(EditNome.Text)<>EmptyStr Then
     begin
       StrSQL:= 'TBCLI_NOME LIKE :PNOME ';
       If Trim(EditCNPJ.Text)<> EmptyStr Then
          StrSQL:=StrSQL+ ' AND TBCLI_CNPJ LIKE :PCNPJ';
     end
     Else
       If Trim(EditCNPJ.Text)<> EmptyStr Then
         StrSQL:='TBCLI_CNPJ LIKE :PCNPJ';
    IBQCliente.Close;
    IBQCliente.SQL.Clear;
    IBQCliente.SQL.Add('SELECT ID_CLIENTE, '+
                             ' TBCLI_NOME, '+
                             ' TBCLI_CNPJ, '+
                             ' TBCLI_BAIRRO, '+
                             ' TBCLI_CIDADE, '+
                             ' TBCLI_ENDERECO, '+
                             ' TBCLI_ESTADO, '+
                             ' TBCLI_BOLETO, '+
                             ' ID_PRAZO, '+
                             ' CEP, '+
                             ' TBCLI_SNLOTE '+
                        '  FROM TB_CLIENTES '+
                        'WHERE '+ StrSQL +
                        ' ORDER BY TBCLI_NOME ');

     If Trim(EditNome.Text)<>EmptyStr Then
       IBQCliente.ParamByName('PNOME').AsString:=EditNome.Text+'%';
     If Trim(EditCNPJ.Text)<> EmptyStr Then
       IBQCliente.ParamByName('PCNPJ').AsString:=EditCNPJ.Text+'%';

    IBQCliente.Open;
  End;

end;

procedure TFrmBuscarCliente.FormShow(Sender: TObject);
begin
  If not IBQCliente.Active Then
    IBQCliente.Open;
  EditNome.SetFocus;  

end;

procedure TFrmBuscarCliente.FormKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 Case Key of
   113: PNGButton6Click(Self);
   114:Begin
         PNGButton2Click(Self);
         CriarCliente;
       end;   
 end;
end;

procedure TFrmBuscarCliente.CriarCliente;
begin
   if not IBQCliente.IsEmpty Then
   begin
     Cliente:=TCliente.Create;
     Cliente.IdCliente    :=IBQCliente.FieldByName('ID_CLIENTE').AsInteger;
     Cliente.NomeCliente  :=IBQCliente.FieldByName('TBCLI_NOME').AsString ;
     Cliente.Endereco     :=IBQCliente.FieldByName('TBCLI_ENDERECO').AsString;
     Cliente.Bairro       :=IBQCliente.FieldByName('TBCLI_BAIRRO').AsString;
     Cliente.Cidade       :=IBQCliente.FieldByName('TBCLI_CIDADE').AsString  ;
     Cliente.Id_Prazo     :=IBQCliente.FieldByName('ID_PRAZO').AsInteger;
     Cliente.Cep          :=IBQCliente.FieldByName('CEP').AsString;
     Cliente.Estado       :=IBQCliente.FieldByName('TBCLI_ESTADO').AsString;
     Cliente.Boleto       :=IBQCliente.FieldByName('TBCLI_BOLETO').AsString;
     Cliente.Lote         :=IBQCliente.FieldByName('TBCLI_SNLOTE').AsString;
   end;
    Close;
end;

procedure TFrmBuscarCliente.TimerBuscaTimer(Sender: TObject);
begin
  PNGButton6Click(Self);
  TimerBusca.Enabled :=False;
end;

procedure TFrmBuscarCliente.EditNomeChange(Sender: TObject);
begin
  TimerBusca.Enabled := True;

end;

procedure TFrmBuscarCliente.EditCNPJChange(Sender: TObject);
begin
  TimerBusca.Enabled :=True;  
end;

end.
