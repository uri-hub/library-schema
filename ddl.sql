-- Exclui as tabelas existentes no banco
DROP TABLE IF EXISTS autores;

DROP TABLE IF EXISTS editoras;

DROP TABLE IF EXISTS categoria;

DROP TABLE IF EXISTS livros;

DROP TABLE IF EXISTS autor_livro;

DROP TABLE IF EXISTS exemplares;

DROP TABLE IF EXISTS emprestimos;

DROP TABLE IF EXISTS leitores;

DROP TABLE IF EXISTS enderecos;

-- Cria a tabela categorias
CREATE TABLE
  categorias (
    categoria_id INT PRIMARY KEY IDENTITY (1, 1),
    categoria NVARCHAR (50) NOT NULL,
  );

-- Cria a tabela autores
CREATE TABLE
  autores (
    autor_id INT PRIMARY KEY IDENTITY (1, 1),
    autor NVARCHAR (150) NOT NULL,
  );

-- Cria a tabela editoras
CREATE TABLE
  editoras (
    editora_id INT PRIMARY KEY IDENTITY (1, 1),
    editora NVARCHAR (50) NOT NULL,
    edicao INT NOT NULL
  );

-- Cria a tabela livros
CREATE TABLE
  livros (
    livro_id INT PRIMARY KEY IDENTITY (1, 1),
    titulo NVARCHAR (200) NOT NULL,
    ISBN CHAR(13) UNIQUE NOT NULL,
    paginas INT NOT NULL,
    fk_editora INT REFERENCES editoras (editora_id),
    fk_categoria INT REFERENCES categorias (categoria_id)
  );

-- Cria tabela de associação para representação de relacionamento N:N entre as tabelas autores e livros
CREATE TABLE
  autor_livro (
    fk_autor INT REFERENCES autores (autor_id),
    fk_livro INT REFERENCES livros (livro_id),
    PRIMARY KEY (fk_autor, fk_livro)
  );

-- cria a tabela leitores 1:1 enderecos e leitores 1:N emprestimos
CREATE TABLE
  leitores (
    leitor_id INT PRIMARY KEY IDENTITY (1, 1),
    nome NVARCHAR (150) NOT NULL,
    cpf CHAR(11) UNIQUE NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    telefone CHAR(11) NOT NULL, -- ddd + 9 digitos (xxxxxxxxxxx)
    situacao VARCHAR(7) DEFAULT 'ativo' NOT NULL, -- define o status de ativo ou inativo
    data_cadastro DATE NOT NULL
  );

-- cria a tabela enderecos 1:1 leitores
CREATE TABLE
  enderecos (
    endereco_id INT PRIMARY KEY IDENTITY (1, 1),
    cidade NVARCHAR (20) NOT NULL,
    uf CHAR(2) NOT NULL,
    bairro NVARCHAR (30) NOT NULL,
    logradouro NVARCHAR (50) NOT NULL,
    numero INT NOT NULL, -- armazena o número da residência
    complemento NVARCHAR (30), -- letras após o número devem ser armazenadas neste campo
    cep CHAR(9) NOT NULL, -- considera o hífen como parte do formato xxxxx-xxx
    fk_leitor INT REFERENCES leitores (leitor_id)
  );

CREATE TABLE
  exemplares (
    exemplar_id INT PRIMARY KEY IDENTITY (1, 1),
    quantidade INT NOT NULL,
    fk_livro INT REFERENCES livros (livro_id)
  );

CREATE TABLE
  emprestimos (
    emprestimo_id INT PRIMARY KEY IDENTITY (1, 1),
    data_emprestimo DATE NOT NULL,
    data_devolucao DATE NOT NULL,
    dias_atraso INT NOT NULL DEFAULT 0,
    multa_atraso DECIMAL(2, 2) NOT NULL,
    fk_leitor INT REFERENCES leitores (leitor_id)
  );

CREATE TABLE
  exemplar_emprestimo (
    fk_emprestimo INT REFERENCES emprestimos (emprestimo_id),
    fk_exemplar INT REFERENCES exemplares (exemplar_id),
    PRIMARY KEY (fk_emprestimo, fk_exemplar)
  );