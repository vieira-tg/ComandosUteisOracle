create or replace procedure EXEMPLO_PROCEDURE_ALTERAR_STATUS(
  iPEDIDO_ID in number,
  iNOVO_STATUS in string
)as

  x_status_atual           PEDIDO.STATUS%type;
  x_mensagem_erro          VARCHAR2(200);
  x_qtd                    number;


begin

  if iNOVO_STATUS not in ('ABERTO', 'FATURANDO', 'FINALIZADO', 'CANCELADO') then
    GERAR_ERRO('O valor do parâmetro "iNOVO_STATUS" é inválido. Status: ' || iNOVO_STATUS || '.');
  end if;

  begin
    select
      STATUS
    into
      x_status_atual
    from
      PEDIDO
    where PEDIDO_ID = iPEDIDO_ID;
  exception
    when others then
      GERAR_ERRO('Pedido não encontrado! Pedido: ' || iPEDIDO_ID || '.');
  end;

  if iNOVO_STATUS = x_status_atual then
    GERAR_ERRO('Pedido já está neste status!');
  end if;

  if iNOVO_STATUS = 'ABERTO' then

    update PEDIDO set
      STATUS = iNOVO_STATUS,      
      DATA_FECHAMENTO = null      
    where PEDIDO_ID = iPEDIDO_ID;
  end if;

end EXEMPLO_PROCEDURE_ALTERAR_STATUS;
