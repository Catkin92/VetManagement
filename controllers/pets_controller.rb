require('sinatra')
require('sinatra/contrib/all')
require_relative('../models/pet.rb')
require_relative('../models/vet.rb')
require_relative('../models/owner.rb')
require_relative('../models/note.rb')
require_relative('../models/appointment.rb')
also_reload('../models/*')

get '/pets' do
  @pets = Pet.all.sort { |a, b| a.name <=> b.name}
  erb(:'/pets/index')
end

get '/pets/new' do
  @owners = Owner.all.sort { |a, b| a.name <=> b.name }
  @vets = Vet.all.sort { |a, b| a.name <=> b.name }
  erb(:'/pets/new')
end

post '/pets' do
  @pet = Pet.new(params)
  @pet.save
  redirect to ('/pets')
end

get '/pets/:id' do
  @pet = Pet.find(params[:id])
  id = @pet.owner_id
  @owner = Owner.find(id)
  notes = Note.find_by_pet(params[:id])
  @notes = notes.sort { |a, b| b.note_date <=> a.note_date }
  erb(:'/pets/show')
end

get '/pets/:id/edit' do
  @pet = Pet.find(params[:id])
  @owners = Owner.all.sort { |a, b| a.name <=> b.name}
  @vets = Vet.all.sort { |a, b| a.name <=> b.name }
  erb(:'/pets/edit')
end

post '/pets/:id' do
  @pet = Pet.new(params)
  @pet.update
  redirect to "/pets/#{params['id']}"
end

get '/pets/delete/:id' do
  Note.delete_by_pet(params[:id])
  @pet = Pet.find(params[:id])
  @pet.delete
  redirect to "/pets"
end
