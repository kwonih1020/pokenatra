require 'sinatra'
require 'sinatra/reloader'
require 'active_record'


require_relative 'db/connection'

# Load models
require_relative 'models/pokemon'
require_relative 'models/trainer'

get "/" do
    @trainers = Trainer.all
    @pokemons = Pokemon.all
    erb :"trainers/index"
end

get '/trainers/new' do
    erb :"trainers/new"
end

get "/trainers/:id" do
    @trainer = Trainer.find(params[:id])
    @pokemon = Pokemon.where(trainer_id: params[:id])
    erb :"trainers/show"
end



post "/trainers" do
    @trainer = Trainer.create(name: params[:name], level: params[:id])
    redirect "/trainers/#{@trainer.id}"
end

post '/trainers' do
    @trainer = Trainer.create(params[:trainer])
    redirect "/trainers/#{@trainer.id}"
end

get "/trainers/:id/edit" do
    @trainer = Trainer.find(params[:id])
    erb (:"trainers/edit")
end

put "/trainers/:id" do
    @trainer = Trainer.find(params[:id])
    @trainer.update(params[:trainer])
    redirect ("/trainers/#{@trainer.id}")
end

delete "/trainers/:id" do
    @trainer = Trainer.find(params[:id])
    @trainer.destroy
    redirect "/"
end
