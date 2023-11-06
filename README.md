![example workflow](https://github.com/danielnottingham/mdn/actions/workflows/ci.yml/badge.svg)

## Requerimentos:
- Ruby 3.2.2
- Node 20.7.0
- Docker
- Docker-Compose

## Iniciando:
1. Clone o repositório para o seu ambiente local.
2. Navegue até o diretório raiz do aplicativo.
3. Crie um arquivo .env baseado no .env.example
```
$ cp .env.example .env
```
4. Execute o comando: `bin/setup` e após a instação das dependencias execute: `bin/dev`

---
## Linters:
- gem: [rubocop](https://github.com/rubocop/rubocop)
- gem: [erb-lint](https://github.com/Shopify/erb-lint)

```
# Para executar o rubocop:
bundle exec rubocop

# Para executar o erb-lint:
bundle exec erblint --lint-all

# Para executar o lint do yarn
yarn lint

# Para executar todos juntos:
bin/lint
```
---
## Scan:
- gem: [brakeman](https://github.com/presidentbeef/brakeman)
```
# Para executar:
bundle exec brakeman

# Ou:
bin/scan
```
