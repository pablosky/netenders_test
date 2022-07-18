# README

* This miniapp uses docker
DB start

1. build image docker
  - docker-compose build
  - docker-compose up
2. in other terminal 
  Enter the container
  docker exec -it rails-web bash 
    - bundle exec rails db:create

3. visit localhost:3000