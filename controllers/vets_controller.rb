require('sinatra')
require('sinatra/contrib/all')
require_relative('../models/pet.rb')
require_relative('../models/vet.rb')
also_reload('../models/*')

get '/vets' do
  @vets = Vet.all.sort { |a, b| a.name <=> b.name}
  erb(:'/vets/index')
end

get '/vets/new' do
  erb(:'/vets/new')
end

post '/vets' do
  Vet.new(params).save
  redirect to '/vets'
end
