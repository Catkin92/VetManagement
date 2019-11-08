require('sinatra')
require('sinatra/contrib/all')
require_relative('../models/pet.rb')
require_relative('../models/vet.rb')
require_relative('../models/owner.rb')
also_reload('../models/*')

get '/pets' do
  @pets = Pet.all
  erb(:'/pets/index')
end

get '/pets/new' do
  @owners = Owner.all
  @vets = Vet.all
  erb(:'/pets/new')
end

post '/pets' do
  @pet = Pet.new(params)
  @pet.save
  redirect to (:'/pets')
end

get '/pets/:id' do
  @pet = Pet.find(params[:id])
  erb(:'/pets/show')
end

get '/pets/:id/edit' do
  @pet = Pet.find(params[:id])
  @owners = Owner.all
  @vets = Vet.all
  erb(:'/pets/edit')
end

post '/pets/:id' do
  @pet = Pet.new(params)
  @pet.update
  redirect to (:'/pets/:id')
end
