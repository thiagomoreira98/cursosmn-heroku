CREATE OR REPLACE FUNCTION public.inserirUsuario(
    pNome VARCHAR(50),
    pCPF VARCHAR(15),
    pEmail VARCHAR(150)
)

    /*;
	Documentação
	Arquivo Fonte.....: proc.sql
	Objetivo..........: Inserir novos usuarios no banco
	Autor.............: Iury Almeida
	Data..............: 01/02/2018
	Ex................: 
		SELECT * FROM site.inserirUsuario()
	*/


    RETURNS void AS $$

    BEGIN 

        INSERT INTO public.usuario(
            nome, 
            cpf,
            email
        )
        VALUES(
            pNome,
            pCPF,
            pEmail
        );
    END;
$$
LANGUAGE PLPGSQL;

----------------------------------------------------------------------------------------------------------------
CREATE OR REPLACE FUNCTION public.selecionarUsuario(
    pNome VARCHAR(50),
    pPagina SMALLINT,
    pQuantidade SMALLINT
)

    /*;
	Documentação
	Arquivo Fonte.....: proc.sql
	Objetivo..........: Trazer todos os usuarios a partir de filtros
	Autor.............: Iury Almeida
	Data..............: 01/02/2018
	Ex................: 
		SELECT * FROM site.selecionarUsuario()
	*/

    RETURNS TABLE (
        "registros" JSON,
        "totalRegistros" INTEGER
    ) AS $$

    DECLARE 
        vRegistros JSON;
        vTotalRegistros INTEGER;

    BEGIN 

    vRegistros := json_agg(o) FROM (
        SELECT 
            u.id,
            u.nome,
            u.cpf,
            u.email 
        FROM public.usuario u 
        WHERE
            CASE  WHEN (pNome IS NOT NULL) THEN
                (u.nome ILIKE '%' || pnome || '%')
            ELSE
                TRUE
            END
    )o;

    vTotalRegistros := (
        SELECT COUNT(*)
        FROM public.usuario
    );

    RETURN QUERY
        SELECT vRegistros AS registros,
            vTotalRegistros AS totalRegistros;
            
    END;

$$
LANGUAGE PLPGSQL;

-----------------------------------------------------------------------------------------------------------
CREATE OR REPLACE FUNCTION public.buscarUsuario(
    pId INTEGER
)

    /*;
	Documentação
	Arquivo Fonte.....: proc.sql
	Objetivo..........: Trazer um usuario específico a partir do seu ID
	Autor.............: Iury Almeida
	Data..............: 01/02/2018
	Ex................: 
		SELECT * FROM site.buscarUsuario()
	*/

    RETURNS TABLE (
        "id" INTEGER,
        "nome" VARCHAR(50), 
        "cpf" VARCHAR(15),
        "email" VARCHAR(150)
    ) AS $$

    BEGIN

    RETURN QUERY

        SELECT 
            u.id,
            u.nome,
            u.cpf,
            u.email
        FROM    
            public.usuario u 
        WHERE
            u.id = pId;

    END;

$$
LANGUAGE PLPGSQL;

-----------------------------------------------------------------------------------------------------------
CREATE OR REPLACE FUNCTION public.alterarUsuario(
    pId INTEGER,
    pNome VARCHAR(50),
    pCpf VARCHAR(15),
    pEmail VARCHAR(150)
)

    /*;
	Documentação
	Arquivo Fonte.....: proc.sql
	Objetivo..........: Alterar dados de um usuario a partir do seu ID
	Autor.............: Iury Almeida
	Data..............: 01/02/2018
	Ex................: 
		SELECT * FROM site.selecionarUsuario()
	*/

    RETURNS void AS $$

    BEGIN 

        UPDATE public.usuario
            SET
                nome = pNome,
                cpf = pCpf,
                email = pEmail
            WHERE id = pId;

    END;
$$
LANGUAGE PLPGSQL;

----------------------------------------------------------------------------------------------------------
CREATE OR REPLACE FUNCTION public.deletarUsuario(
    pId INTEGER
)

    /*;
	Documentação
	Arquivo Fonte.....: proc.sql
	Objetivo..........: Deletar um usuario a partir do seu ID
	Autor.............: Iury Almeida
	Data..............: 01/02/2018
	Ex................: 
		SELECT * FROM site.deletarUsuario()
	*/

    RETURNS void AS $$

    BEGIN 

        DELETE FROM public.usuario
            WHERE id = pId;
    
    END;

$$
LANGUAGE PLPGSQL;