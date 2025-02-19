-- Feature: Cadastro

Scenario 1: Requisição para cadastro de usuário com sucesso
Given: Nenhum usuário foi cadastrado ainda
When: Uma requisição "POST" for enviada para /users com os dados:
    nome de usuário: "aliceperuniz"
    email: "alice@example.com"
    senha: "senha123"
Then: O status da resposta deve ser "201"
And: O usuário é cadastrado com o id = 1
And: A mensagem deve ser "Usuário registrado com sucesso!"

Scenario 2: Requisição para cadastro com email inválido
Given: Nenhum usuário foi cadastrado ainda
When: Uma requisição "POST" for enviada para /users com os dados:
    nome de usuário: "alicep"
    email: "aliceexample.com"
    senha: "senha123"
    
Then: O status da resposta deve ser "400"
And: A mensagem deve ser "Formato de e-mail inválido"

Scenario 3: Requisição para cadastro com nome de usuário já existente
Given: O usuário de id = 1 e nome de usuário = "alicep" já foi cadastrado
When: Uma requisição "POST" for enviada para /users com os dados:
    nome de usuário: "alicep"
    email: "alice2@example.com"
    senha: "senha123"
Then: O status da resposta deve ser "409"
And: A mensagem deve ser "Nome de usuário já existe"

_________________________________________________________________________________________

-- Feature: Login

Scenario 1: Login com sucesso
Given: existe um usuário de id = 1 já foi cadastrado com nome de usuário "alicep" e senha "senha123"
When: Uma requisição "GET" for enviada para "/get_user_by_id/1" 1 com os dados:
    nomeDeUsuario: "alicep"
    senha: "senha123"
Then: O status da resposta deve ser "User found" 1
And: O servidor valida as credenciais

Scenario 2: Requisição para redefinição de senha com sucesso
Given: O usuário de id = 1 solicitou a redefinição de senha e recebeu um token "token123"
When: Uma requisição "POST" for enviada para user/update_password com os dados:
    token: "token123"
    nova senha: "novaSenha123"
Then: O status da resposta deve ser "200"
And: A mensagem deve ser "Senha redefinida com sucesso"______________________________________________________________________________________

-- Feature: Perfil

Scenario 1: Requisição para visualizar o perfil com sucesso
Given: O usuário de id = 1 está logado no sistema
When: Uma requisição "GET" for enviada para "/get_user_by_id/1"
Then: O status da resposta deve ser "200"
And: A mensagem da resposta deve ser "User found"
And: O servidor retorna os dados do perfil do usuário
And: O JSON da resposta deve conter os dados: id, nome de usuário, email, biografia, foto de perfil e status de privacidade.

Scenario 2: Requisição para editar o perfil com sucesso
Given: O usuário de id = 1 está logado no sistema
When: Uma requisição "PATCH" for enviada para "/update_profile/1/Alice%20Peruniz%20Oliveira/url_da_foto.jpg/Exemplo%20de%20biografia"
Then: O status da resposta deve ser "200"
And: O servidor atualiza os dados do perfil do usuário de id = 1
And: A mensagem deve ser "User privacy updated"