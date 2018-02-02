CREATE DATABASE CursoSMN;
SET SEARCH_PATH = CursoSMN;

CREATE TABLE public.usuario(
    id SERIAL PRIMARY KEY ,
    nome VARCHAR(50), 
    cpf VARCHAR(15),
    email VARCHAR(150)
)
