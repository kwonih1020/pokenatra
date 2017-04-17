require 'sinatra'
require 'sinatra/reloader'
require 'active_record'


require_relative 'db/connection'

# Load models
require_relative 'models/pokemon'
require_relative 'models/trainer'

get "/" do
    @trainers = Trainer.all
    erb :"trainers/index"
end
