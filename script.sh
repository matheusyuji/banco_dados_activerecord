#!/bin/bash

arquivo="Escola.sqlite3"

if [ ! -e "$arquivo" ]; then
  echo "Criando tabela estudantes ..."
  ruby banco/criaEstudantes.rb

  echo "Criando tabela carteirinhas ..."
  ruby banco/criaCarteirinhas.rb

  echo "Criando tabela docentes ..."
  ruby banco/criaDocentes.rb

  echo "Criando tabela disciplinas ..."
  ruby banco/criaDisciplinas.rb

  echo "Populando tabela estudantes ..."
  ruby banco/populaEstudantes.rb

  echo "Populando tabela carteirinhas ..."
  ruby banco/populaCarteirinhas.rb

  echo "Populando tabela docentes ..."
  ruby banco/populaDocentes.rb

  echo "Populando tabela disciplinas ..."
  ruby banco/populaDisciplinas.rb

else 
  echo "Já existe um arquivo sqlite3."
fi