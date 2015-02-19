require 'sinatra'
require 'sinatra/reloader'
also_reload './lib/**/*.rb'
require './lib/cd_collection.rb'
require './lib/user.rb'
require 'pry'


get '/' do
  @users = User.all
  erb :index
end

post '/user' do
  @user_name = params[:user_name]
  User.new(@user_name).save
  @users = User.all
  erb :index
end

get '/cds/:id' do
  @cd = CD.find_by_artist(params[:id])
  erb :cd
end

get '/user/:id' do
  @user = User.find(params[:id].to_i)
  @cds = @user.collection
  erb :user
end

post '/cds' do
  @artist = params[:artist]
  @title = params[:title]
  @cd = CD.new(@artist, @title)
  @cd.save
  @user = User.find(params[:user_id].to_i)
  @user.add_cd(@cd)
  @cds = CD.all
  redirect '/user/'.concat(params[:user_id])
end
