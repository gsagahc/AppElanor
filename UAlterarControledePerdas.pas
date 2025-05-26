unit UAlterarControledePerdas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFrmControlePerdas, IBCustomDataSet, IBUpdateSQL, IBSQL, DB,
  IBQuery, DBClient, IBTable, StdCtrls, NumEdit, ComCtrls, pngextra, Grids,
  DBGrids, ExtCtrls, DBCtrls, Provider;

type
  TFrmAlterarControlePerdas = class(TFrmControlePerdas)
    IBQConsultarLancamentos: TIBQuery;
    PanelMsg: TPanel;
    procedure DTPDataExit(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure EditSegundaExit(Sender: TObject);
    procedure EditQuantidadeRCExit(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure CDSPerdasAfterScroll(DataSet: TDataSet);
    procedure PNGButton1Click(Sender: TObject);
  private

    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmAlterarControlePerdas: TFrmAlterarControlePerdas;

implementation

uses UImpressaoPerdas, UPrincipal,uMensagens,UReimpressaoAlterarPerdas;

{$R *.dfm}

procedure TFrmAlterarControlePerdas.DTPDataExit(Sender: TObject);
begin
  CDSPerdas.EmptyDataSet;
  IBQConsultarLancamentos.Close;
  IBQConsultarLancamentos.SQL.Clear;
  IBQConsultarLancamentos.SQL.Add(' SELECT TBCP_MAQUINA, '+
                                  '        TBCP_DATA, '+
                                  '        TBCP_ELASTICO, '+
                                  '        TBCP_COMPRIMENTO, '+
                                  '        TBCP_PESOB, '+
                                  '        TBCP_QUANTIDADERC, '+
                                  '        TBCP_QUANTIDADE, '+
                                  '        TBCP_PRIMEIRA, '+
                                  '        TBCP_SEGUNDA, '+
                                  '        TBCP_PERCENTUAL, '+
                                  '        TB_PRODUTOS.TBPRD_NOME NOME, '+
                                  '        E.ID_ENROLADOR,     '+
                                  '        E.NOME NOME_ENROL,     '+
                                  '        ID_CONTROLEPERDAS    '+
                                  ' FROM TB_CONTROLE_PERDAS  '+
                                  ' INNER JOIN TB_PRODUTOS   '+
                                  ' ON TB_PRODUTOS.ID_PRODUTO=TB_CONTROLE_PERDAS.TBCP_ELASTICO '+
                                  ' INNER JOIN TB_ENROLADORES E  '+
                                  ' ON E.ID_ENROLADOR = TB_CONTROLE_PERDAS.ID_ENROLADOR '+
                                  ' WHERE TB_CONTROLE_PERDAS.TBCP_DATA =:PDATA');
  IBQConsultarLancamentos.ParamByName('PDATA').AsString :=FormatdateTime('dd/mm/yyyy', DTPData.Date);
  IBQConsultarLancamentos.Open;
  if not IBQConsultarLancamentos.IsEmpty then
  begin
    IBQConsultarLancamentos.First;
    while not IBQConsultarLancamentos.Eof do
      begin
        CDSPerdas.Append;
        CDSPerdasData.AsDateTime       := IBQConsultarLancamentos.FieldByname('TBCP_DATA').AsDateTime;
        CDSPerdasMaquina.AsInteger     := IBQConsultarLancamentos.FieldByname('TBCP_MAQUINA').AsInteger;
        CDSPerdasElastico.AsString     := IBQConsultarLancamentos.FieldByname('TBCP_ELASTICO').AsString;
        CDSPerdasComprimento.AsInteger := IBQConsultarLancamentos.FieldByname('TBCP_COMPRIMENTO').AsInteger;
        CDSPerdasPrimeira.AsString     := FormatFloat('00.###',IBQConsultarLancamentos.FieldByname('TBCP_PRIMEIRA').AsFloat);
        CDSPerdasPesoB.AsString        := FormatFloat('00.###',IBQConsultarLancamentos.FieldByname('TBCP_PESOB').AsFloat);
        CDSPerdasQuantidadeRC.AsString := IBQConsultarLancamentos.FieldByname('TBCP_QUANTIDADERC').AsString;
        CDSPerdasPercentual.AsString   := FormatFloat('00.###',IBQConsultarLancamentos.FieldByname('TBCP_PERCENTUAL').AsFloat);
        CDSPerdasNomeElastico.AsString := IBQConsultarLancamentos.FieldByname('NOME').AsString;
        CDSPerdasCBoxIndex.AsInteger   := ComboBoxElastico.Items.IndexOf(IBQConsultarLancamentos.FieldByname('NOME').AsString);
        CDSPerdasQuantidade.AsInteger  := IBQConsultarLancamentos.FieldByname('TBCP_QUANTIDADE').AsInteger;
        CDSPerdasSegunda.AsString      := FormatFloat('00.###',IBQConsultarLancamentos.FieldByname('TBCP_SEGUNDA').AsFloat);
        CDSPerdasEnrolador.AsInteger   := IBQConsultarLancamentos.FieldByname('ID_ENROLADOR').AsInteger;
        CDSPerdasNomeEnrolador.AsString:= IBQConsultarLancamentos.FieldByname('NOME_ENROL').AsString;
        CDSPerdasId.AsInteger          := IBQConsultarLancamentos.FieldByName('ID_CONTROLEPERDAS').AsInteger;
        CDSPerdas.Post;
        IBQConsultarLancamentos.Next;

      end;
      PanelMsg.Visible:=True;
  end
  else
    PanelMsg.Visible:=False;
 
end;

procedure TFrmAlterarControlePerdas.FormShow(Sender: TObject);
begin
  inherited;
 // DTPData.Date:=Now;
//  DTPData.SetFocus;
End;

procedure TFrmAlterarControlePerdas.EditSegundaExit(Sender: TObject);
begin
  inherited;
//  if EditSegunda.Text <> EmptyStr then
//  try
//    EditPercentual.Text := FormatFloat( '#,###.00' ,(StrToFloat(EditSegunda.Text)*100/StrToFloat(EditPrimeira.Text)));
//  except
//   on E: Exception do
//    begin
//
//    end;
//
//  end;
end;

procedure TFrmAlterarControlePerdas.EditQuantidadeRCExit(Sender: TObject);
begin
  inherited;
  If EditQuantidadeRC.Text = EmptyStr then
    EditQuantidadeRC.SetFocus
  else
  Begin
    EditQuantidade.Text := IntToStr(StrToInt(EditQuantidadeRC.Text)* StrToInt(EditComprimento.Text));
    EditPrimeira.Text   := FloatToStr(StrToFloat(EditPesoBruto.Text)*StrToInt(EditQuantidadeRC.Text));
  End;
end;



procedure TFrmAlterarControlePerdas.FormKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  case key of
   vk_f4:begin
            PNGBNovoClick(self);
         end;
    vk_f5:PNGBSalvarClick(Self);
    vk_f6:PNGImprimirClick(Self);
  end;
end;

procedure TFrmAlterarControlePerdas.CDSPerdasAfterScroll(
  DataSet: TDataSet);
begin
  inherited;
  ComboBoxEnroladores.ItemIndex:=ComboBoxEnroladores.Items.IndexOf(CDSPerdasNomeEnrolador.AsString);
end;

procedure TFrmAlterarControlePerdas.PNGButton1Click(Sender: TObject);
begin
  if tFrmMensagens.Mensagem('Deseja excluir os dados selecionados?','Q',[mbSIM, mbNAO]) then
  begin
    if not FrmPrincipal.IBTMain.Active then
      FrmPrincipal.IBTMain.StartTransaction;

    IBQConsultarLancamentos.SQL.Clear;
    IBQConsultarLancamentos.SQL.Add(' DELETE FROM TB_CONTROLE_PERDAS '+
                                  ' WHERE TB_CONTROLE_PERDAS.TBCP_DATA =:PDATA');
    IBQConsultarLancamentos.ParamByName('PDATA').AsDateTime :=CDSPerdasData.AsDateTime;
    IBQConsultarLancamentos.ExecSQL;
    FrmPrincipal.IBTMain.Commit;
    FrmPrincipal.IBDMain.CloseDataSets;
   
    Close;
  end;


end;

end.
