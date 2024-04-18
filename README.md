# Banco Dados ActiveRecord

Aluno: 
* Matheus Yuji Morishita - GRR20205104

## Como executar

Para criar as tabelas e preenchê-las execute o scrpit:

```bash
bash ./script.sh
```

Para interagir com o programa e executar comandos:

```bash
ruby main.rb
```

## Comandos

Operações:
* alteracao
* exclusao
* insercao
* lista

Tabelas:
* carteirinhas
* disciplinas
* docentes
* estudantes
* disciplinas_estudantes

Exemplos de Comandos:

* alteracao carteirinhas id=1 numero=222
* alteracao disciplinas id=1 codigo="C222"
* alteracao docentes id=1 nome="Matheus"
* alteracao estudantes id=1 nome="alterado" dataNascimento="00/00/2000"

* exclusao carteirinhas id=2
* exclusao disciplinas id=2
* exclusao docentes nome="Matheus"
* exclusao estudantes

* inclusao carteirinhas numero="111" estudante_id=1
* inclusao disciplinas docente_id=1 nomeDisciplina="nome" codigo="C11" horario="00:00"
* inclusao docentes nome="nomedocente"
* inclusao estudantes nome="nome" dataNascimento="10/10/2010"

* lista carteirinhas
* lista disciplinas
* lista docentes
* lista estudantes
* pode adicionar o atributo que queira ver