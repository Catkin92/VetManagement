require('sinatra')
require('sinatra/contrib/all')
require_relative('../models/pet.rb')
also_reload('../models/*')

get '/pets' do
  @pets = Pet.all
  erb(:'/pets/index')
end

get '/pet/:id' do
  @pet = Pet.find(params[:id])
  erb(:'/pets/show')
end
