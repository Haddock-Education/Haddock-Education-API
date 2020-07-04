### Documentação Haddock-Education-API

Documentação oficial da API do projeto Haddock Education.

Essa documentação será atualizada e no final desse arquivo estará a data de cada alteração feita nela.

***

### Utilização de token nas requisições

Para a maioria das requisições, a API espera receber um Token de autenticação que será enviado no HEADER da requisição.
Esse Token precisa seguir o padrão abaixo. O Token será obtido pelo cliente após uma requisição de Sign Up ou Sign In, também no HEADER. Para mais informações sobre o login, consulte a sessão *usuário#login* abaixo.

As requisições que precisam de Token estarão devidamente marcadas em negrito nessa documentação, com a informação "**Token no Header**".


    {
      "Access-Token": "eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjo3LCJleHAiOjE1OTM4MjM0NTksImlhdCI6MTU5MzgyMzQyOX0.Agobu6Lg66wUwTpi26aReOjedeH1ZlNzBJxLp2offEI",
      "Refresh-Token": "QUGOzcArLaBgI7sZs3-TpQ"
    }

***

## Rotas


## Usuários
  **Criação de usuário**
  *URL:** https://haddock-api.herokuapp.com/users/sign_up

  Method: POST
    Descrição: Essa rota é responsável por criar um novo usuário,

    Parâmetros de Envio:

      {
        "user": {
          "name": "test",
          "email": "test@mail.com",
          "password": "123456",
          "password_confirmation": "123456"
        }
      }

Retorno:

    Body:

      {
        "message": "Cadastro realizado com sucesso!",
        "is_success": true,
        "data": {
            "user": {
                "id": 1,
                "name": "test",
                "created_at": "2020-05-08T22:03:01.424Z",
                "updated_at": "2020-05-08T22:03:01.424Z",
                "email": "test@mail.com"
            }
        }
      }

    Header:

      {
        "Access-Token": "eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjo5LCJleHAiOjE1OTM4OTkxODEsImlhdCI6MTU5MzgxMjc4MX0.krQ2qys0e85rQR-zFCXxxsllahyvM5_m5hFMm-7M3qg",
        "Refresh-Token": "dlzFr_7jJlWd7QHwHXCNOQ",
        "Expire-At": "1593899181"
      }


    Login de usuário
    URL: https://haddock-api.herokuapp.com/users/sign_in
    Method: POST
    Parâmetros de Envio:

      {
        "user": {
          "email": "test@mail.com",
          "password": "123456"
        }
      }

Retorno:

  Body:

    {
        "message": "Bem vindo!",
        "is_success": true,
        "data": {
            "user": {
                "id": 1,
                "name": "teste",
                "email": "teste@mail.com",
                "password_digest": "$2a$12$BCxfA2WI4VJTOTi3uxbu0OqCeGrGo29DEBofL6AaXCn0JDCJ.KFGG",
                "created_at": "2020-07-03T21:35:51.153Z",
                "updated_at": "2020-07-03T21:35:51.153Z",
                "total_points": 0
            }
        }
    }

  Header:

    {
      "Access-Token": "eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjo5LCJleHAiOjE1OTM4OTkxODEsImlhdCI6MTU5MzgxMjc4MX0.krQ2qys0e85rQR-zFCXxxsllahyvM5_m5hFMm-7M3qg",
      "Refresh-Token": "dlzFr_7jJlWd7QHwHXCNOQ",
      "Expire-At": "1593899181"
    }

***

# Histórico de alterações na API

- 03/07/2020 - Criação da documentação. Por: Hugo
