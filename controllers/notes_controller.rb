require('sinatra')
require('sinatra/contrib/all')
require_relative('../models/note.rb')
require_relative('../models/pet.rb')
also_reload('../models/*')

get '/notes/:id' do
  @pet = Pet.find(params[:id])
  @notes = Note.find_by_pet(params[:id])
  erb(:'/notes/show')
end

get '/notes/:id/new' do
  @pet = Pet.find(params[:id])
  erb(:'/notes/new')
end

post '/notes/:id' do
  @note = Note.new(params)
  @note.save
  redirect to "/notes/#{params['id']}"
end
