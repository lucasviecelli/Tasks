Tasks
=====

Gems que devem ser instaladas:

	gem => gem install amatch
	url => https://github.com/flori/amatch

	gem => gem install sequel 
	url => https://github.com/jeremyevans/sequel

1º - script.rb (Sequel gem)

	Sequel é uma gem para manipulação de dados, com a sintaxe parecida com o active_record. O script que fiz demonstra <br>algumas exemplos de utilização sem a necessidade de criação de objetos. A abordagem é interessante pois se tratando <br>de um sistema que busca informações especificas talvez seja a melhor forma de conseguir buscar e manipular os dados.<br><br>


2º - make.rb (active_record)

	Fiz alguns testes utilizando o active_record e foquei mais no sentido de criação dos objetos dinamicamente, afim de serem<br> utilizados no seletor, na classe "make" os relacionamentos estão sendo gerados dinamicamente, em alguns testes tudo<br> ocorreu bem, mas se isso for ser utilizado deve existir uma forma de o usuário "aprovar" essas sugestões e modificar. <br>

	Gerar os relacionamentos dinamicamente não me parece ser algo tão custoso, mas sempre vai depender da confirmação do <br>usuário, pois tudo sempre será uma sugestão sem maiores garantias.<br><br>

	Todos os testes utilizando o relacionamento dinâmico foram testados em base de dados que utilizam o Rails e observado um <br>ótimo nível de acerto. Podendo ter algumas melhorias e refatorações como fazer a analise combinatória apenas nos fields <br>que tem "_id" assim descartando possíveis falhas. O problema de ter algo assim em produção é que você está sujeito a <br>futura manutenções que sempre são custosas.<br>
