
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do

  end

  get'/posts/new' do
    erb :new
  end

  post '/posts' do
    Post.create(params)
    erb :index
  end

  get '/posts' do
    @posts = Post.all
    erb :index
  end

  get '/posts/:id' do
    @post = Post.find(params[:id].to_i)
    erb :show
  end

  get '/posts/:id/edit' do
    @post = Post.find(params[:id].to_i)
    erb :edit
  end

  patch '/posts/:id' do
    new_data = {
      name: params[:name],
      content: params[:content]
    }
    Post.update(params[:id].to_i,new_data)
    erb :index
  end

  delete '/posts/:id/delete' do
    Post.destroy(params[:id].to_i)
    erb :index
  end




end
