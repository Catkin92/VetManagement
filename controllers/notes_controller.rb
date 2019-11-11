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
