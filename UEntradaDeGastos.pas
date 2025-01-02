unit UEntradaDeGastos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, IBQuery, DB, IBCustomDataSet, IBTable, Buttons, ExtCtrls,
  pngextra, IBSQL, IBUpdateSQL, StdCtrls, Mask, DBCtrls, Grids, DBGrids,
  ComCtrls, DBClient;

type
  TFrmCadGastos = class(TForm)
    PnlBottom: TPanel;
    PnlBotoes: TPanel;
    PNGButton2: TPNGButton;
    PNGButton3: TPNGButton;
    PNGButton4: TPNGButton;
    PNGBSalvar: TPNGButton;
    PNGButton6: TPNGButton;
    PNGButton7: TPNGButton;
    IBUSQLGastos: TIBUpdateSQL;
    IBQGastos: TIBQuery;
    IBTbGastos: TIBTable;
    IBSQLGastos: TIBSQL;
    DSGastos: TDataSource;
    PNGButton1: TPNGButton;
    PnlMain: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    DBEdit5: TDBEdit;
    DBEdit6: TDBEdit;
    DBEdit7: TDBEdit;
    DTPData: TDateTimePicker;
    IBTbGastosTBG_VALOR: TIBBCDField;
    IBTbGastosTBG_DATA: TDateField;
    IBTbGastosID_FORNECEDOR: TIntegerField;
    DBLookupComboBox1: TDBLookupComboBox;
    IBTbFornecedor: TIBTable;
    IBTbFornecedorID_FORNECEDOR: TIntegerField;
    IBTbFornecedorTBFOR_NOME: TIBStringField;
    DsFornecedor: TDataSource;
    DBLookupListBox1: TDBLookupListBox;
    IBTbGastosTBG_DESCRICAO: TIBStringField;
    IBTbGastosID_GASTO: TIntegerField;
    IBTbGastosTBG_EMISSAO: TDateField;
    IBTbGastosTBG_NUMNOTA: TIBStringField;
    Label3: TLabel;
    Label4: TLabel;
    DTPEmissao: TDateTimePicker;
    DBLookupComboBox2: TDBLookupComboBox;
    Label7: TLabel;
    IBTbGastosID_CADDESPESAS: TIntegerField;
    IBTbCadDespesa: TIBTable;
    DSCadDespesas: TDataSource;
    IBTbCadDespesaID_CADDESPESAS: TIntegerField;
    IBTbCadDespesaTBCADDESP_NOME: TIBStringField;
    DBLookupListBox2: TDBLookupListBox;
    procedure PNGBSalvarClick(Sender: TObject);
    procedure PNGButton3Click(Sender: TObject);
    procedure PNGButton4Click(Sender: TObject);
    procedure PNGButton2Click(Sender: TObject);
    procedure StatusBotoes ;
    procedure PNGButton1Click(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure PNGButton7Click(Sender: TObject);
    procedure PNGButton6Click(Sender: TObject);
  private
    { Private declarations }
  public

    { Public declarations }
  end;

var
  FrmCadGastos: TFrmCadGastos;

implementation
Uses uMensagens, Math, UPrincipal, ULocalizarGastos;

{$R *.dfm}

procedure TFrmCadGastos.PNGBSalvarClick(Sender: TObject);
begin
  If (IBTbGastos.State in [dsEdit, dsInsert]) Then
  Begin
    IBTbGastosTBG_DATA.AsDateTime    := DTPData.Date;
    IBTbGastosTBG_EMISSAO.AsDateTime := DTPEmissao.Date;
    IBTbGastos.Post;
    FrmPrincipal.IBTMain.Commit;
    StatusBotoes;
  End;
end;

procedure TFrmCadGastos.PNGButton3Click(Sender: TObject);
begin
  if (tFrmMensagens.Mensagem('Deleja deletar o item mostrado?','Q',[mbSim, mbNao])) then
     IBTbGastos.Delete;
      FrmPrincipal.IBTMain.Commit;
  
  StatusBotoes;
end;

procedure TFrmCadGastos.PNGButton4Click(Sender: TObject);
begin
  IBTbGastos.Cancel;
  IBTbGastos.Close;
  StatusBotoes;
end;

procedure TFrmCadGastos.PNGButton2Click(Sender: TObject);
begin
  Close;
end;

procedure TFrmCadGastos.StatusBotoes;
Var Botao: TPNGButton;
    i:Integer;
begin
   For i:=0 To Self.ComponentCount -1 do
     Begin
       If (Self.Components[i] is TPNGButton) Then
         Begin
           Botao:=(Self.Components[i] as TPNGButton);
           Botao.Enabled := not Botao.Enabled;
         End;
     End;
end;

procedure TFrmCadGastos.PNGButton1Click(Sender: TObject);
begin
  If  not IBTbGastos.Active then
    IBTbGastos.Open;
  If  not IBTbFornecedor.Active then
     IBTbFornecedor.Open;   
  IBTbGastos.edit;
  
end;

procedure TFrmCadGastos.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
    if not (ActiveControl is TDBGrid) then
    begin
      Key := #0;
      Perform(WM_NEXTDLGCTL, 0, 0);
    end
    else if (ActiveControl is TDBGrid) then
      with TDBGrid(ActiveControl) do
        if selectedindex < (fieldcount -1) then
          selectedindex := selectedindex +1
        else
          selectedindex := 0;

end;

procedure TFrmCadGastos.FormShow(Sender: TObject);
begin
  DTPData.Date    := Now();
  DTPEmissao.Date :=Now()
end;

procedure TFrmCadGastos.PNGButton7Click(Sender: TObject);
begin
  try
    if not FrmPrincipal.IBTMain.Active Then
      FrmPrincipal.IBTMain.StartTransaction;
    If  not IBTbGastos.Active then
      IBTbGastos.Open;
    If  not IBTbFornecedor.Active then
      IBTbFornecedor.Open;
    If  not IBTbCadDespesa.Active then
     IBTbCadDespesa.Open;

    IBTbGastos.Insert;
    DTPData.SetFocus;
    StatusBotoes;

  Except;

  end;
end;

procedure TFrmCadGastos.PNGButton6Click(Sender: TObject);
begin
  Application.CreateForm(TFrmBuscarGastos, FrmBuscarGastos);
  FrmBuscarGastos.ShowModal;
  If  not IBTbGastos.Active then
      IBTbGastos.Open;
  If  not IBTbFornecedor.Active then
     IBTbFornecedor.Open;
  If IBTbGastos.Locate('ID_GASTO', FrmBuscarGastos.IBQGastosID_GASTO.AsString, [loPartialKey]) then
  begin
    DTPData.Date   :=IBTbGastosTBG_DATA.AsDateTime;
    DTPEmissao.Date:=IBTbGastosTBG_EMISSAO.AsDateTime;
    StatusBotoes;
  End;
  FreeAndNil(FrmBuscarGastos);


end;

end.
