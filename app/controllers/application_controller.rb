
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
    
  end

  get '/articles/new'
    erb :new
  end

  post '/create_article' do
    Article.create(params)

    redirect to('/articles/:id')
  end

  get '/articles/:id' do
    @article = Article.all.last

    erb :show
  end
end
