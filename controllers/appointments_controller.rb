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
