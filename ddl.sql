-- Exclui as tabelas existentes no banco
DROP TABLE IF EXISTS exemplar_emprestimo;

DROP TABLE IF EXISTS emprestimos;

DROP TABLE IF EXISTS exemplares;

DROP TABLE IF EXISTS autor_livro;

DROP TABLE IF EXISTS livros;

DROP TABLE IF EXISTS categorias;

DROP TABLE IF EXISTS autores;

DROP TABLE IF EXISTS editoras;

DROP TABLE IF EXISTS leitores;

DROP TABLE IF EXISTS enderecos;

-- Cria a tabela categorias
CREATE TABLE
  categorias (
    categoria_id INT PRIMARY KEY IDENTITY (1, 1),
    categoria NVARCHAR (50) NOT NULL
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
    editora NVARCHAR (50) NOT NULL
  );

-- Cria a tabela livros
CREATE TABLE
  livros (
    livro_id INT PRIMARY KEY IDENTITY (1, 1),
    titulo NVARCHAR (200) NOT NULL,
    ISBN CHAR(13) UNIQUE NOT NULL,
    paginas INT NOT NULL,
    edicao INT NOT NULL,
    fk_editora INT NOT NULL REFERENCES editoras (editora_id) ON DELETE CASCADE,
    fk_categoria INT NOT NULL REFERENCES categorias (categoria_id) ON DELETE CASCADE
  );

-- Tabela de associação entre livros e autores (N:N)
CREATE TABLE
  autor_livro (
    fk_autor INT NOT NULL REFERENCES autores (autor_id) ON DELETE CASCADE,
    fk_livro INT NOT NULL REFERENCES livros (livro_id) ON DELETE CASCADE,
    PRIMARY KEY (fk_autor, fk_livro)
  );

-- Cria a tabela leitores
CREATE TABLE
  leitores (
    leitor_id INT PRIMARY KEY IDENTITY (1, 1),
    nome NVARCHAR (150) NOT NULL,
    cpf CHAR(11) UNIQUE NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    telefone CHAR(11) NOT NULL, -- ddd + 9 digitos 
    situacao VARCHAR(7) DEFAULT 'ativo' NOT NULL, -- 'ativo' ou 'inativo'
    data_cadastro DATE NOT NULL
  );

-- Cria a tabela enderecos 
CREATE TABLE
  enderecos (
    endereco_id INT PRIMARY KEY IDENTITY (1, 1),
    cidade NVARCHAR (20) NOT NULL,
    uf CHAR(2) NOT NULL,
    bairro NVARCHAR (30) NOT NULL,
    logradouro NVARCHAR (50) NOT NULL,
    numero INT NOT NULL,
    complemento NVARCHAR (30),
    cep CHAR(8) NOT NULL,
    fk_leitor INT NOT NULL REFERENCES leitores (leitor_id) ON DELETE CASCADE
  );

-- Cria a tabela exemplares
CREATE TABLE
  exemplares (
    exemplar_id INT PRIMARY KEY IDENTITY (1, 1),
    situacao VARCHAR(15) DEFAULT 'disponível' NOT NULL, -- 'disponível', 'emprestado', 'danificado' ou 'perdido'
    fk_livro INT NOT NULL REFERENCES livros (livro_id) ON DELETE CASCADE
  );

-- Cria a tabela de empréstimos
CREATE TABLE
  emprestimos (
    emprestimo_id INT PRIMARY KEY IDENTITY (1, 1),
    data_emprestimo DATE NOT NULL,
    prazo_devolucao INT NOT NULL,
    data_devolucao DATE DEFAULT NULL,
    dias_atraso INT NOT NULL DEFAULT 0,
    multa_atraso DECIMAL(6, 2) NOT NULL,
    fk_leitor INT NOT NULL REFERENCES leitores (leitor_id) ON DELETE CASCADE
  );

-- Tabela de relação entre empréstimos e exemplares (N:N)
CREATE TABLE
  exemplar_emprestimo (
    fk_emprestimo INT NOT NULL REFERENCES emprestimos (emprestimo_id) ON DELETE CASCADE,
    fk_exemplar INT NOT NULL REFERENCES exemplares (exemplar_id) ON DELETE CASCADE,
    PRIMARY KEY (fk_emprestimo, fk_exemplar)
  );