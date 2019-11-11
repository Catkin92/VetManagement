require('sinatra')
require('sinatra/contrib/all')
require_relative('../models/note.rb')
require_relative('../models/pet.rb')
also_reload('../models/*')

get '/notes/:id/new' do
  @pet = Pet.find(params[:id])
  erb(:'/notes/new')
end

post '/notes/:id' do
  @note = Note.new(params)
  @note.save
  redirect to "/pets/#{params['id']}"
end
