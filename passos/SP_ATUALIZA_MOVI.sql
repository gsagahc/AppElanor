--Nome da procedure sp_atualiza_movi
-- Finalidade: Atualizar as movimentações do estoque na tabela tb_moveestoque
SET TERM ^ ;

create or alter procedure sp_atualiza_movi (
                                            iproduto integer,
                                            iusuario integer,
                                            itipo char(1),
                                            iformato varchar(10),
                                            ipedido integer,
                                            itamanho float,
                                            iquant float)
as
declare  variable videstoque integer;
declare  variable vsaldoanterior float;
declare variable vSaldoAtual float;
declare variable vSomaSaldo float;
declare variable vData Date;
declare variable vHora Time;
begin
 SELECT OIDESTOQUE FROM sp_retorna_idestoque(:iformato,:iproduto) INTO videstoque;
 SELECT osaldoAtual FROM SP_RETORNA_SALDOATUAL(:iformato,:iproduto) INTO vSaldoAtual;
 vData =  current_date;
 vHora = current_time;
 --venda de produto
 IF (:ITIPO = 'S') THEN
 begin
   vsaldoanterior = :vSaldoAtual + :iquant;
 

  insert INTO tb_movestoque(TBMOVE_DATA,
                            TBMOVE_HORA,
                            TBMOVE_TIPO,
                            ID_ESTOQUE,
                            ID_USUARIO,
                            ID_PEDIDO,
                            ID_PRODUTO,
                            TBMOVE_FORMATO,
                            TBMOVE_SALDOANT,
                            TBMOVE_SOMA,
                            TBMOVE_TAMANHO,
                            TBMOVE_QUANT)
                 values (:vData,
                         :vHora,
                         :itipo,
                         :videstoque,
                         :iusuario,
                         :ipedido,
                         :iproduto,
                         :iformato,
                         :vsaldoanterior,
                         :vSaldoAtual,
                         :itamanho,
                         :iquant);
 end
 -- Ajuste manual do estoque
 IF (:ITIPO = 'A') THEN  
 BEGIN
   iquant=:iquant - :vSaldoAtual ;
   vSomaSaldo = ABS(:iQuant) + vSaldoAtual;
   insert INTO tb_movestoque(TBMOVE_DATA,
                            TBMOVE_HORA,
                            TBMOVE_TIPO,
                            ID_ESTOQUE,
                            ID_USUARIO,
                            ID_PEDIDO,
                            ID_PRODUTO,
                            TBMOVE_FORMATO,
                            TBMOVE_SALDOANT,
                            TBMOVE_SOMA,
                            TBMOVE_TAMANHO,
                            TBMOVE_QUANT)
                 values (:vData,
                         :vHora,
                         :itipo,
                         :videstoque,
                         :iusuario,
                         :ipedido,
                         :iproduto,
                         :iformato,
                         :vSaldoAtual,
                         :vSomaSaldo,
                         :itamanho,
                         :iquant);
 END
  -- Lancamento de producao dos enroladores
 IF (:ITIPO = 'E') THEN  
 BEGIN
    vSomaSaldo = ABS(:iQuant) + vSaldoAtual;
   insert INTO tb_movestoque(TBMOVE_DATA,
                            TBMOVE_HORA,
                            TBMOVE_TIPO,
                            ID_ESTOQUE,
                            ID_USUARIO,
                            ID_PEDIDO,
                            ID_PRODUTO,
                            TBMOVE_FORMATO,
                            TBMOVE_SALDOANT,
                            TBMOVE_SOMA,
                            TBMOVE_TAMANHO,
                            TBMOVE_QUANT)
                 values (:vData,
                         :vHora,
                         :itipo,
                         :videstoque,
                         :iusuario,
                         :ipedido,
                         :iproduto,
                         :iformato,
                         :vSaldoAtual,
                         :vSomaSaldo,
                         :itamanho,
                         :iquant);
 END                        
    

end^

SET TERM ; ^
COMMIT;
/* Following GRANT statements are generated automatically */

GRANT INSERT ON TB_MOVESTOQUE TO PROCEDURE SP_ATUALIZA_MOVI;

/* Existing privileges on this procedure */

GRANT EXECUTE ON PROCEDURE SP_ATUALIZA_MOVI TO SYSDBA;

