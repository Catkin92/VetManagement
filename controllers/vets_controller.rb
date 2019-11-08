require('sinatra')
require('sinatra/contrib/all')
require_relative('../models/pet.rb')
require_relative('../models/vet.rb')
also_reload('../models/*')

get '/vets' do
  @vets = Vet.all
  erb(:'/vets/index')
end
