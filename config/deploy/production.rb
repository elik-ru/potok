# frozen_string_literal: true

server 'elik.ru', user: 'rails', roles: %w[app db web]

set :branch, 'master'
set :deploy_to, '/home/rails/potok/production'
set :rails_env, 'production'
