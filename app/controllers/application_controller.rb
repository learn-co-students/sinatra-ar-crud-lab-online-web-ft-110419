
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
    redirect to '/articles'
  end

  get '/articles' do
     @articles = Article.all
     erb :'articles/index'
  end

  get '/articles/new' do
    erb :'articles/new'
  end

  post '/articles' do
    article = Article.create(params[:article])
    redirect "/articles/#{article.id}"
  end

  get '/articles/:id/edit' do
    @article = Article.find_by(id: params[:id])
    erb :"articles/edit"
  end

  get '/articles/:id' do
    @article = Article.find_by(id: params[:id])
    erb :'articles/show'
  end

  patch '/articles/:id' do
    article = Article.find_by(id: params[:id])
    article.update(params[:article])
    redirect "/articles/#{article.id}"
  end

  delete '/articles/:id' do
    article = Article.find_by(id: params[:id])
    article.destroy
    redirect '/articles'
  end
end
