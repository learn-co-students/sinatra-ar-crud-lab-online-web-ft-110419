
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
  end

  get '/articles/new' do
    erb :new
  end

  get '/articles' do
    @articles = Article.all
    erb :index
  end

  post '/articles' do
    Article.create(:title => params[:title], :content => params[:content])
    redirect "/articles/#{Article.last.id}"
  end

  get '/articles/:id' do
    @article = Article.find(params[:id])
    erb :show
  end

  patch '/articles/:id' do
    @article = Article.update(params[:id], :title => params[:title], :content => params[:content])
    erb :show
  end

  delete '/articles/:id' do
    Article.destroy(params[:id])
    redirect '/articles'
  end

  get '/articles/:id/edit' do
    @article = Article.find(params[:id])
    erb :edit
  end

end
