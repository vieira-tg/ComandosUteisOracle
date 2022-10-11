create or replace procedure GERANDO_ERRO(
	iMENSAGEM in string)
as begin
	Raise_Application_Error(
	-20999,
	iMENSAGEM
	);
end GERANDO_ERRO;
/