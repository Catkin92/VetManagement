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

get '/notes/edit/:id' do
  @note = Note.find(params[:id])
  erb(:'/notes/edit')
end

post '/notes/note/:id' do
  @note = Note.new(params)
  @note.update
  @pet_id = @note.pet_id
  redirect to "/pets/#{@pet_id}"
end

get '/notes/delete/:id' do
  @note = Note.find(params[:id])
  @pet_id = @note.pet_id
  @note.delete
  redirect to "/pets/#{@pet_id}"
end
