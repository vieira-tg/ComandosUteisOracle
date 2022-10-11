create or replace function EXEMPLO_FUNCTION(texto in string)
return string
is
  texto_modificado string(200);
begin
  texto_modificado := LOWER(texto);

  return texto_modificado;

end EXEMPLO_FUNCTION;