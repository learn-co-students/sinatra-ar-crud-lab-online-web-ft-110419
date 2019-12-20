
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
    redirect "/articles"
  end
  
  get '/articles/new' do 
    erb :new 
  end
  
  
  get "/articles" do
    @articles = Article.all
    erb :index
  end
  
  post '/articles' do 
    article = Article.find_or_create_by(params)
    redirect "/articles/#{article.id}"
  end
  
  get '/articles/:id' do 
    @article = Article.find_by(id: params[:id])
    erb :show
  end 
  
  get "/articles/:id/edit" do
    @article = Article.find_by(id: params[:id])
    erb :edit
  end 
  
  patch '/articles/:id' do
    article = Article.find_by(id: params[:id])
    article.update(params.to_a[1..-1].to_h)
    redirect "/articles/#{ article.id }"
  end
  
  delete "/articles/:id" do
    Article.destroy(params[:id])
    redirect "/articles"
  end
  
end
