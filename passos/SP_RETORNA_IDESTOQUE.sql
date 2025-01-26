--Nome da procedure sp_retorna_saldoatual
-- Finalidade: Retornar o id do estoque
SET TERM ^ ;

create or alter procedure sp_retorna_idestoque (
    iformato varchar(10),
    iproduto integer)
returns (
    oidestoque integer)
as
begin
    SELECT ID_ESTOQUE

      FROM tb_estoque
      WHERE ID_PRODUTO=:IProduto
       AND TBES_FORMATO=:IFormato
    INTO :oidestoque;
  suspend;
end^

SET TERM ; ^

/* Following GRANT statements are generated automatically */

GRANT SELECT ON TB_ESTOQUE TO PROCEDURE SP_RETORNA_IDESTOQUE;

/* Existing privileges on this procedure */

GRANT EXECUTE ON PROCEDURE SP_RETORNA_IDESTOQUE TO SYSDBA;

