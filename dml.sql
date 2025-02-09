INSERT INTO
  autores
VALUES
  ('Machado de Assis'),
  ('Paulo Coelho'),
  ('J. K. Rowling'),
  ('J. R. R. Tolkien'),
  ('Gabriel Garcia Marquez'),
  ('Antoine de Saint-Exupéry'),
  ('George Orwell'),
  ('Dan Brown'),
  ('J. D. Salinger'),
  ('C. S. Lewis '),
  ('Agatha Christie'),
  ('Umberto Eco'),
  ('Paulo Vieira'),
  ('Vladimir Nabokov');

INSERT INTO
  categorias
VALUES
  ('Romance Contemporâneo'),
  ('Ficção Científica'),
  ('Autoajuda e Negócios'),
  ('Suspense e Mistério'),
  ('Clássicos da Literatura'),
  ('Biografias e Memórias'),
  ('Desenvolvimento Pessoal'),
  ('Fantasia e Ficção Juvenil'),
  ('História e Sociedade'),
  ('Psicologia e Educação Financeira');

INSERT INTO
  editoras
VALUES
  ('Galera Record'),
  ('Bertrand Brasil'),
  ('HarperCollins Brasil'),
  ('Citadel Editora'),
  ('Editora Record'),
  ('Alta Books'),
  ('Sextante'),
  ('Faro Editorial'),
  ('Companhia das Letras'),
  ('Intrínseca'),
  ('Paralela'),
  ('Gente Editora'),
  ('Planeta de Livros Brasil'),
  ('Globo Livros'),
  ('Rocco');

INSERT INTO
  livros (
    titulo,
    ISBN,
    paginas,
    publicacao,
    fk_editora,
    fk_categoria
  )
VALUES
  (
    'Dom Casmurro',
    '9781234567890',
    256,
    '1899-01-01',
    1,
    1
  ),
  (
    'O Alquimista',
    '9789876543210',
    208,
    '1988-01-01',
    2,
    3
  ),
  (
    'Harry Potter e a Pedra Filosofal',
    '9788532511010',
    320,
    '1997-01-01',
    3,
    2
  ),
  (
    'O Senhor dos Anéis',
    '9782233445566',
    1216,
    '1954-01-01',
    4,
    2
  ),
  (
    'Cem Anos de Solidão',
    '9783344556677',
    417,
    '1967-01-01',
    5,
    1
  ),
  (
    'O Pequeno Príncipe',
    '9784455667788',
    96,
    '1943-01-01',
    6,
    1
  ),
  ('1984', '9785566778899', 328, '1949-01-01', 7, 2),
  (
    'O Código Da Vinci',
    '9786677889900',
    689,
    '2003-01-01',
    8,
    4
  ),
  (
    'A Revolução dos Bichos',
    '9787788990011',
    112,
    '1945-01-01',
    9,
    2
  ),
  (
    'O Apanhador no Campo de Centeio',
    '9788899001122',
    277,
    '1951-01-01',
    10,
    1
  ),
  (
    'As Crônicas de Nárnia',
    '9789900112233',
    767,
    '1950-01-01',
    11,
    2
  ),
  (
    'O Hobbit',
    '9780011223344',
    310,
    '1937-01-01',
    12,
    2
  ),
  (
    'E não sobrou nenhum',
    '9781122334455',
    272,
    '1939-01-01',
    13,
    4
  ),
  (
    'O Nome da Rosa',
    '9788535902778',
    512,
    '1980-01-01',
    14,
    4
  ),
  (
    'Lolita',
    '9788579620560',
    336,
    '1955-01-01',
    15,
    1
  );

INSERT INTO
  exemplares
VALUES
  ('Disponível', 1),
  ('Emprestado', 2),
  ('Disponível', 3),
  ('Emprestado', 4),
  ('Disponível', 5),
  ('Emprestado', 6),
  ('Disponível', 7),
  ('Emprestado', 8),
  ('Disponível', 9),
  ('Emprestado', 10),
  ('Disponível', 11),
  ('Emprestado', 12),
  ('Disponível', 13),
  ('Emprestado', 14),
  ('Disponível', 15);

INSERT INTO
  livro_autor (fk_livro, fk_autor)
VALUES
  -- Dom Casmurro por Machado de Assis
  (1, 1),
  -- O Alquimista por Paulo Coelho
  (2, 2),
  -- Harry Potter e a Pedra Filosofal por J.K. Rowling
  (3, 3),
  -- O Senhor dos Anéis por J.R.R. Tolkien
  (4, 4),
  -- Cem Anos de Solidão por Gabriel García Márquez
  (5, 5),
  -- O Pequeno Príncipe por Antoine de Saint-Exupéry
  (6, 6),
  -- 1984 por George Orwell
  (7, 7),
  -- O Código Da Vinci por Dan Brown
  (8, 8),
  -- A Revolução dos Bichos por George Orwell
  (9, 7),
  -- O Apanhador no Campo de Centeio por J.D. Salinger
  (10, 9),
  -- As Crônicas de Nárnia por C.S. Lewis
  (11, 10),
  -- O Hobbit por J.R.R. Tolkien
  (12, 4),
  -- E não sobrou nenhum por Agatha Christie 
  (13, 11),
  -- O Nome Da Rosa por Umberto Eco
  (14, 12),
  -- Lolita por Vladimir nabokov
  (15, 14);