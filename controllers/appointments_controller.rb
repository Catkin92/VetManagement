require('sinatra')
require('sinatra/contrib/all')
also_reload('../models/*')
require_relative('../models/appointment.rb')
require_relative('../models/pet.rb')
require_relative('../models/vet.rb')

get '/appointments' do
  @appointments = Appointment.all.sort { |a, b| a.date <=> b.date }
  erb(:'/appointments/index')
end

get '/appointments/new' do
  @pets = Pet.all.sort { |a, b| a.name <=> b.name }
  @vets = Vet.all.sort { |a, b| a.name <=> b.name }
  erb(:'/appointments/new')
end

get '/appointments/new/error' do
  @pets = Pet.all.sort { |a, b| a.name <=> b.name }
  @vets = Vet.all.sort { |a, b| a.name <=> b.name }
  erb(:'/appointments/error_new')
end

post '/appointments' do
  app = Appointment.new(params)
  app.save
  if app.time <= 0
  app.delete
  redirect to '/appointments/new/error'
  end
  redirect to '/appointments'
end

get '/appointments/delete/:id' do
  app = Appointment.find(params[:id])
  app.delete
  redirect to '/appointments'
end

get '/appointments/edit/:id' do
  @appointment = Appointment.find(params[:id])
  @pets = Pet.all.sort { |a, b| a.name <=> b.name }
  @vets = Vet.all.sort { |a, b| a.name <=> b.name }
  erb(:'/appointments/edit')
end

post '/appointments/:id' do
  app = Appointment.new(params)
  app.update
  redirect to '/appointments'
end
