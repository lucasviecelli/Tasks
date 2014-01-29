Tasks
=====

Gems que devem ser instaladas:

	gem => gem install amatch
	url => https://github.com/flori/amatch

	gem => gem install sequel 
	url => https://github.com/jeremyevans/sequel

1º - script.rb (Sequel gem)

	Sequel é uma gem para manipulação de dados, com a sintaxe parecida com o active_record. O script que
	fiz demonstra alguns exemplos de utilização sem a necessidade de criação de objetos. A abordagem é 
	interessante pois se trata de um sistema que busca informações bem especificas. O legal é que a sua 
	utilização é muito simples, desde a parte de conexão até a parte de joins, where, groups, retorno.
	Acredito que a sua simplicidade e evitando o processo de gerar objetos do active_record possam pesar a seu favor.

	Pelo que andei estudando, com o active_record também é possível ultilizar ele da maneira como usei o sequel, 
	apenas a parte de conexão e outros fatores são um pouco mais "chatos" (também fiz testes utilizando o active
	record dessa forma), esse foi o motivo de me aprofundar no sequel.


2º - make.rb (active_record)

	Fiz alguns testes utilizando o active_record e foquei mais no sentido de criação dos objetos gerando 
	relacionamentos dinamicamente, afim de serem utilizados no seletor, na classe "make" os relacionamentos 
	estão sendo gerados dinamicamente, em alguns testes tudo ocorreu bem, mas se isso for utilizado deve 
	existir uma forma de o usuário "aprovar" essas sugestões e ou modificar. 

	Gerar os relacionamentos dinamicamente não me parece ser algo tão custoso, mas sempre vai depender da confirmação 
	do Usuário, pois tudo sempre será uma sugestão sem maiores garantias.

	Todos os testes utilizando o relacionamento dinâmico foram testados em bases de dados que utilizam o Rails, e
	observado um ótimo nível de acerto. Algumas melhorias e refatorações se fazem necessário, como fazer a analise combinatória 
	apenas dos fields que tem "_id" assim descartando possíveis falhas. O problema de ter algo assim em produção é que 
	você está sujeito a manutenções futuras, que sempre são custosas.