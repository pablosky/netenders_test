# Dockerfile
FROM ruby:2.6.5
RUN curl -sL https://deb.nodesource.com/setup_12.x | bash 
RUN apt-get install -y nodejs
RUN npm install -g yarn
# Create directory docker-rails
RUN mkdir /docker-rails
# Change directory to docker-rails
WORKDIR /docker-rails
# Copy created Gemfile & Gemfile.lock to docker container
COPY Gemfile /docker-rails/Gemfile
COPY Gemfile.lock /docker-rails/Gemfile.lock
# Install dependencies
RUN bundle install --jobs 4
COPY . /docker-rails
EXPOSE 3000 3035

CMD ["rails", "server", "-b", "0.0.0.0"]