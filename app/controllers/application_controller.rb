
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/articles' do
    @articles = Article.all

    erb :'views/index'
  end

  post '/articles' do
    @article = Article.create(params[:article])

    erb :'views/index'
  end

  get 'articles/new' do

    erb :'views/new'
  end
end
