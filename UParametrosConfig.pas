unit UParametrosConfig;

interface
uses  IBCustomDataSet, IBUpdateSQL, DB, IBQuery, DBGrids,
      IBTable, DBClient, Classes, Controls,SysUtils, Variants, Provider;


type
  TParametros= Class
  public
    function returnValParametro(sNomeParametro:String):String;
    procedure saveValParametro(sNomeParametro,sValor:string);

  end;
implementation
uses uMensagens, uPrincipal, Math ;

function TParametros.returnValParametro(sNomeParametro:String):String;
var QueryResult:TIBQuery;

begin
  try
    QueryResult:=TIBQuery.Create(nil);
    QueryResult.Database:=FrmPrincipal.IBDMain;
    QueryResult.Transaction:=FrmPrincipal.IBTMain;
    QueryResult.Close;
    QueryResult.SQL.Clear;
    QueryResult.SQL.add('SELECT VAL_PARAMETRO FROM TB_CONFIG WHERE PARAMETRO='''+sNomeParametro+'''');

    QueryResult.Open;
    Result:=Trim(QueryResult.FieldByName('VAL_PARAMETRO').AsString);
  except
    on E: EDatabaseError do
    begin
      tFrmMensagens.Mensagem('Erro ao retornar configuração ' +'returnValParametro '+ E.message,'E',[mbOK]);

    end;

  end;

end;

procedure TParametros.saveValParametro(sNomeParametro, sValor: string);
var QueryResult:TIBQuery;
begin
  try
    QueryResult:=TIBQuery.Create(nil);
    QueryResult.Database:=FrmPrincipal.IBDMain;
    QueryResult.Transaction:=FrmPrincipal.IBTMain;
    QueryResult.Close;
    QueryResult.SQL.Clear;
    QueryResult.SQL.add('UPDATE TB_CONFIG SET VAL_PARAMETRO='''+sValor+''' WHERE PARAMETRO='''+sNomeParametro+'''');

    QueryResult.ExecSQL;
    If Assigned(QueryResult) then
      FreeAndNil(QueryResult);
  except
    on E: EDatabaseError do
    begin
      tFrmMensagens.Mensagem('Erro ao salvar configuração ' +'returnValParametro '+ E.message,'E',[mbOK]);
    end;

  end;
end;

end.
 