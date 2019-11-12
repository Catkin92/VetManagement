require('sinatra')
require('sinatra/contrib/all')
require_relative('../models/owner.rb')
require_relative('../models/pet.rb')
also_reload('../models/*')

get '/owners' do
  @owners = Owner.all.sort { |a, b| a.name <=> b.name}
  erb(:'/owners/index')
end

get '/owners/new' do
  erb(:'/owners/new')
end

post '/owners' do
  @owner = Owner.new(params)
  @owner.save
  redirect to '/owners'
end

get '/owners/:id' do
  @owner = Owner.find(params['id'])
  erb(:'/owners/show')
end

get '/owners/:id/edit' do
  @owner = Owner.find(params[:id])
  erb(:'/owners/edit')
end

post '/owners/:id' do
  Owner.new(params).update
  redirect to "/owners/#{params['id']}"
end

get '/owners/delete/:id' do
  @owner = Owner.find(params[:id])
  @pets = @owner.pets
  @pets.each { |pet| pet.delete }
  @owner.delete
  redirect to "/owners"
end
