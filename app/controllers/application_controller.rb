
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
    redirect to "/articles"
  end

  get '/articles' do
    @articles = Article.all
    erb :index
  end 

  get '/articles/new' do 
    @article = Article.new
    erb :new 
  end 

  post '/articles' do 
    @article = Article.create(params)
    if @article.save 
      redirect to "/articles/#{@article.id}"
    end 
  end 

  get '/articles/:id' do 
    @article = Article.find_by(id: params[:id])
    erb :show
  end 

  get '/articles/:id/edit' do 
    @article = Article.find_by(id: params[:id])
    erb :edit
  end 

  patch '/articles/:id/edit' do 
    @article = Article.find_by(id: params[:id])
    @article.update(params[:article])
    redirect to "/articles/#{@article.id}"
  end 

  delete '/articles/:id' do 
    @article = Article.find_by(id: params[:id])
    @article.destroy 
   
    redirect to "/articles"
  end 

end
