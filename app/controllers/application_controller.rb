require 'pry'
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
    "Welcome to my first Sinatra/ActiveRecord lab!!"
  end

  get '/articles' do 
    @articles = Article.all
    erb :index
  end 

  get '/articles/new' do 
    erb :new
  end

  post '/articles' do 
    # @article = Article.create({title: params[:title], content: params[:content]})
    @article = Article.create(params)
    redirect "/articles/#{@article.id}"
  end 
  
  get '/articles/:id' do 
    @article = Article.find_by_id(params[:id])
    erb :show
  end 

  get '/articles/:id/edit' do 
    @article = Article.find_by_id(params[:id])
    erb :edit
  end 

  patch '/articles/:id' do 
    @old_article = Article.find_by_id(params[:id])
    new_article = {}
    new_article[:title] = params[:title] 
    new_article[:content] = params[:content] 
    @old_article.update(new_article)
    redirect "/articles/#{@article.id}"
  end

  delete '/articles/:id' do
    @article = Article.find_by_id(params[:id]) 
    @article.delete
  end 


end
