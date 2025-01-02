unit UBuscarCheque;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, ExtCtrls, pngextra, StdCtrls, DB,
  IBCustomDataSet, IBQuery, ComCtrls, DBClient;

type
  TFrmBuscarCheques = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    DBGrid1: TDBGrid;
    EditCheque: TEdit;
    EditPedido: TEdit;
    PNGButton2: TPNGButton;
    PNGButton6: TPNGButton;
    Label1: TLabel;
    Label2: TLabel;
    IBQCheque: TIBQuery;
    DSCheque: TDataSource;
    IBQChequeID_CHEQUE: TIntegerField;
    IBQChequeTBCH_NUMCH: TIBStringField;
    IBQChequeTBCH_VALCH: TIBBCDField;
    IBQChequeTBCH_NUMPED: TIBStringField;
    IBQChequeTBCH_BOMPARA: TDateField;
    RbCheque: TRadioButton;
    RbPedido: TRadioButton;
    CheckBoxObs: TCheckBox;
    DTPicker: TDateTimePicker;
    RBData: TRadioButton;
    CDSCheque: TClientDataSet;
    CDSChequeNumero: TStringField;
    CDSChequeid_Cheque: TIntegerField;
    CDSChequePedido: TStringField;
    CDSChequeValor: TCurrencyField;
    CDSChequeBomPara: TDateField;
    CDSChequeOBS: TStringField;
    Label3: TLabel;
    IBQChequeTBCH_OBS: TMemoField;
    procedure PNGButton2Click(Sender: TObject);
    procedure PNGButton6Click(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure RbChequeClick(Sender: TObject);
    procedure RbPedidoClick(Sender: TObject);
    procedure RBDataClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure AlimentarCDS;
    procedure EditPedidoClick(Sender: TObject);
    procedure DTPickerClick(Sender: TObject);
    procedure EditChequeClick(Sender: TObject);
  private

    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmBuscarCheques: TFrmBuscarCheques;

implementation
Uses UPrincipal, UMensagens,UcadCheque, Math;

{$R *.dfm}

procedure TFrmBuscarCheques.PNGButton2Click(Sender: TObject);
begin
  Close;
end;

procedure TFrmBuscarCheques.PNGButton6Click(Sender: TObject);
Var sObs:String;
begin
  CDSCheque.Open;
  CDSCheque.EmptyDataSet;

  If  RbCheque.Checked Then
  Begin
     RbChequeClick(Self);
     IBQCheque.ParamByName('pNumCheque').ASString:=EditCheque.Text;
  End;
  If RbPedido.Checked Then
  Begin
     RbPedidoClick(Self);
     IBQCheque.ParamByName('pNumPed').ASString   :=EditPedido.Text;
  End;
  If RBData.Checked Then
  Begin
     RBDataClick(Self);
     IBQCheque.ParamByName('pData').ASString      :=FormatDateTime('dd/mm/yyyy',   DTPicker.Date);
  End;
  IBQCheque.Open;
  AlimentarCDS;
  If CheckBoxObs.Checked Then
  Begin
    If (Trim(EditCheque.Text)<>EmptyStr) Or (trim(EditPedido.Text)<>EmptyStr) Then
    Begin
      IBQCheque.Close;
      IBQCheque.SQL.Clear;
      IBQCheque.SQL.Add('SELECT  ID_CHEQUE, '+
                                'TBCH_NUMCH, '+
                               ' TBCH_VALCH, '+
                               ' TBCH_NUMPED, '+
                               ' TBCH_BOMPARA, '+
                               ' TBCH_OBS   '+
                               ' FROM  TB_CHEQUES '+
                               ' WHERE TBCH_OBS like :pObs');

      If  RbCheque.Checked Then
        sObs:='%'+EditCheque.Text +'%';
      If RbPedido.Checked Then
        sObs:='%'+EditPedido.Text +'%';
      IBQCheque.ParamByName('pObs').AsString :=sObs;
      IBQCheque.Open;
      AlimentarCDS;
    end
    Else
      tFrmMensagens.Mensagem('Favor digitar número do cheque ou pedido','E',[mbOK]);
  End;


end;

procedure TFrmBuscarCheques.DBGrid1DblClick(Sender: TObject);
begin
  If Not CDSCheque.IsEmpty Then
  begin
    FrmPrincipal.IdCheque :=CDSChequeid_Cheque.AsInteger;
    If FrmCadCheque<> Nil Then
      Close;
  End;
end;

procedure TFrmBuscarCheques.RbChequeClick(Sender: TObject);
begin
  RbPedido.Checked :=False;
  RBData.Checked   := False;
  RbCheque.Checked :=True;
  EditPedido.Clear;
  IBQCheque.Close;
  IBQCheque.SQL.Clear;
  IBQCheque.SQL.Add('SELECT  ID_CHEQUE, '+
                            'TBCH_NUMCH, '+
                           ' TBCH_VALCH, '+
                           ' TBCH_NUMPED, '+
                           ' TBCH_BOMPARA, '+
                           ' TBCH_OBS   '+
                           ' FROM  TB_CHEQUES '+
                           ' WHERE TBCH_NUMCH=:pNumCheque ');



end;

procedure TFrmBuscarCheques.RbPedidoClick(Sender: TObject);
begin
  RbCheque.Checked:=False;
  RBData.Checked :=False;
  RbPedido.Checked :=True; 
  EditCheque.Clear;
  IBQCheque.Close;
  IBQCheque.SQL.Clear;
  IBQCheque.SQL.Add('SELECT  ID_CHEQUE, '+
                            'TBCH_NUMCH, '+
                           ' TBCH_VALCH, '+
                           ' TBCH_NUMPED, '+
                           ' TBCH_BOMPARA, '+
                           ' TBCH_OBS   '+
                           ' FROM  TB_CHEQUES '+
                           ' WHERE TBCH_NUMPED=:pNumPed ');


end;

procedure TFrmBuscarCheques.RBDataClick(Sender: TObject);
begin
   RbCheque.Checked :=False;
   RbPedido.Checked :=False;
   RBData.Checked   :=True;
   IBQCheque.Close;
   IBQCheque.SQL.Clear;
   IBQCheque.SQL.Add('SELECT  ID_CHEQUE, '+
                            'TBCH_NUMCH, '+
                           ' TBCH_VALCH, '+
                           ' TBCH_NUMPED, '+
                           ' TBCH_BOMPARA, '+
                           ' TBCH_OBS   '+
                           ' FROM  TB_CHEQUES '+
                           ' WHERE TBCH_BOMPARA=:pData ');



end;

procedure TFrmBuscarCheques.FormShow(Sender: TObject);
begin
  CDSCheque.CreateDataSet;
  DTPicker.Date :=Now;
end;

procedure TFrmBuscarCheques.AlimentarCDS;
begin
  If not IBQCheque.IsEmpty Then
  Begin
    While Not IBQCheque.Eof do
    Begin
      CDSCheque.Append;
      CDSChequeNumero.AsString     :=IBQChequeTBCH_NUMCH.AsString;
      CDSChequeid_Cheque.AsInteger :=IBQChequeID_CHEQUE.AsInteger;
      CDSChequePedido.AsString     :=IBQChequeTBCH_NUMPED.AsString;
      CDSChequeValor.AsCurrency    :=IBQChequeTBCH_VALCH.AsCurrency;
      CDSChequeBomPara.AsString    :=IBQChequeTBCH_BOMPARA.AsString;
      CDSChequeOBS.AsString        :=IBQChequeTBCH_OBS.AsString;

      CDSCheque.Post;
      IBQCheque.Next
    End;
  End;
end;

procedure TFrmBuscarCheques.EditPedidoClick(Sender: TObject);
begin
  RbPedidoClick(Self);  
end;

procedure TFrmBuscarCheques.DTPickerClick(Sender: TObject);
begin
  RBDataClick(Self); 
end;

procedure TFrmBuscarCheques.EditChequeClick(Sender: TObject);
begin
   RbChequeClick(Self); 
end;

end.
