require('sinatra')
require('sinatra/contrib/all')
require_relative('../models/owner.rb')
require_relative('../models/pet.rb')
also_reload('../models/*')

get '/owners' do
  @owners = Owner.all
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

post 'owners/:id' do
  redirect to '/owners/:id'
end
