require('sinatra')
require('sinatra/contrib/all')
require_relative('../models/pet.rb')
require_relative('../models/vet.rb')
require_relative('../models/appointment.rb')
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

get '/vets/edit/:id' do
  @vet = Vet.find(params[:id])
  erb(:'/vets/edit')
end

post '/vets/:id' do
  @vet = Vet.new(params)
  @vet.update
  redirect to '/vets'
end

get '/vets/delete/:id' do
  @vet = Vet.find(params[:id])
  @vet.delete
  redirect to '/vets'
end
