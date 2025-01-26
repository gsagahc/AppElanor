--Nome da procedure sp_retorna_saldoatual
-- Finalidade: Retornar o saldo atual do estoque
SET TERM ^ ;

create or alter procedure sp_retorna_saldoatual(
    iformato varchar(10),
    iproduto integer)
returns (
    osaldoAtual Float)
as
begin
    SELECT TBES_QUANTI

      FROM tb_estoque
      WHERE ID_PRODUTO=:IProduto
       AND TBES_FORMATO=:IFormato
    INTO :osaldoAtual;
  suspend;
end^

SET TERM ; ^

/* Following GRANT statements are generated automatically */

GRANT SELECT ON TB_ESTOQUE TO PROCEDURE sp_retorna_saldoatual;

/* Existing privileges on this procedure */

GRANT EXECUTE ON PROCEDURE sp_retorna_saldoatual TO SYSDBA;

