create or replace package PACOTE_GLOBAL as
  NOME_TERMINAL VARCHAR2(20) default '';

  type VETOR table of NUMBER index by binary_integer;	
end PACOTE_GLOBAL;