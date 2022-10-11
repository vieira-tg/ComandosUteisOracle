create or replace trigger PEDIDO_TRIGGER
before insert or update
on PEDIDO
for each row
begin
  if inserting then
    :new.DATA_CADASTRO := trunc(sysdate);    
  else
    :new.DATA_ALTERACAO := sysdate;
  end if;
end PEDIDO_TRIGGER;
/
