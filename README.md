# formula1-dbt

Repositorio criado para testar as funcionalidades da ferramenta dbt

## Para iniciar o projeto

Rodando o script `build.sh` irá descompactar o arquivo *.zip* as tabelas em formato csv, montar e iniciar os containers do banco e do dbt:

```bash
sh build.sh
```

Após todo o setup estiver pronto basta rodar o comando `dbt seed`, que irá carregar os arquivos *.csv* em tabelas do banco:

```bash
docker exec -it dbt dbt seed
```
