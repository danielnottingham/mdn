# Use a imagem base do Ruby
FROM ruby:3.2.2-alpine

# Define o diretório de trabalho no contêiner
WORKDIR /app

# Instala as dependências do sistema
RUN apk add --update --virtual \
  runtime-deps \
  postgresql-client \
  build-base \
  libxml2-dev \
  nodejs \
  yarn \
  libffi-dev \
  readline \
  postgresql-dev \
  libc-dev \
  linux-headers \
  readline-dev \
  file \
  imagemagick \
  git \
  tzdata \
  && rm -rf /var/cache/apk/*

# Copia o Gemfile e o Gemfile.lock para o contêiner
COPY Gemfile Gemfile.lock ./

# Instala as gems
RUN gem install bundler
RUN yarn install
RUN bundle install

# Copia o restante do aplicativo para o contêiner
COPY . .

# Expose a porta utilizada pelo aplicativo (por exemplo, 3000)
EXPOSE 3000

# Executa o comando de inicialização do servidor
CMD ["rails", "server", "-b", "0.0.0.0"]

