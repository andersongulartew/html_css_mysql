-- UM PARA UM

CREATE TABLE Funcionarios (
  id INT PRIMARY KEY,
  nome VARCHAR(50),
  detalhes_contato_id INT,
  FOREIGN KEY (detalhes_contato_id) REFERENCES DetalhesContato(id)
);

CREATE TABLE DetalhesContato (
  id INT PRIMARY KEY,
  telefone VARCHAR(20),
  email VARCHAR(50)
);

-- UM PARA MUITOS

CREATE TABLE Posts (
  id INT PRIMARY KEY,
  titulo VARCHAR(100),
  conteudo TEXT
);

CREATE TABLE Comentarios (
  id INT PRIMARY KEY,
  texto TEXT,
  post_id INT,
  FOREIGN KEY (post_id) REFERENCES Posts(id)
);

-- MUITOS PARA MUITOS

CREATE TABLE Produtos (
  id INT PRIMARY KEY,
  nome VARCHAR(100),
  descricao TEXT
);

CREATE TABLE Categorias (
  id INT PRIMARY KEY,
  nome VARCHAR(50)
);

CREATE TABLE ProdutosCategorias (
  produto_id INT,
  categoria_id INT,
  PRIMARY KEY (produto_id, categoria_id),
  FOREIGN KEY (produto_id) REFERENCES Produtos(id),
  FOREIGN KEY (categoria_id) REFERENCES Categorias(id)
);

-- JOINS

-- INNER 
-- A PALAVRA INNER NÃO É NECESSÁRIA
-- RETORNA APENAS POSTS QUE POSSUEM COMENTÁRIOS

SELECT Posts.titulo, Comentarios.texto
FROM Posts
INNER JOIN Comentarios ON Posts.id = Comentarios.post_id

-- LEFT
-- PRECISA DA PALAVRA LEFT
-- RETORNA TODOS OS POSTS INDEPENDENTE DE TER OU NÃO COMENTÁRIOS

SELECT Posts.titulo, Comentarios.texto
FROM Posts
LEFT JOIN Comentarios ON Posts.id = Comentarios.post_id

-- INNER EM MUITOS PARA MUITOS
-- APENAS OS QUE POSSUEM CATEGORIAS

SELECT Produtos.nome, Categorias.nome
FROM Produtos
INNER JOIN ProdutosCategorias ON Produtos.id = ProdutosCategorias.produto_id
INNER JOIN Categorias ON ProdutosCategorias.categoria_id = Categorias.id

-- LEFT EM MUITOS PARA MUITOS
-- RETORNA TODOS OS PRODUTOS INDEPENDENTE DE TER OU NÃO CATEGORIAS

SELECT Produtos.nome, Categorias.nome
FROM Produtos
LEFT JOIN ProdutosCategorias ON Produtos.id = ProdutosCategorias.produto_id
LEFT JOIN Categorias ON ProdutosCategorias.categoria_id = Categorias.id

-- RIGHT EM MUITOS PARA MUITOS
-- RETORNA TODAS AS CATEGORIAS INDEPENDENTE DE TER OU NÃO PRODUTOS

SELECT Produtos.nome, Categorias.nome
FROM Produtos
RIGHT JOIN ProdutosCategorias ON Produtos.id = ProdutosCategorias.produto_id
RIGHT JOIN Categorias ON ProdutosCategorias.categoria_id = Categorias.id

-- FULL EM MUITOS PARA MUITOS
-- RETORNA TODOS OS PRODUTOS E CATEGORIAS MESMO QUE NÃO HAJA RELACIONAMENTO

SELECT Produtos.nome, Categorias.nome
FROM Produtos
RIGHT JOIN ProdutosCategorias ON Produtos.id = ProdutosCategorias.produto_id
RIGHT JOIN Categorias ON ProdutosCategorias.categoria_id = Categorias.id