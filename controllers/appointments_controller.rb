require('sinatra')
require('sinatra/contrib/all')
also_reload('../models/*')
require_relative('../models/appointment.rb')
require_relative('../models/pet.rb')

get '/appointments' do
  @appointments = Appointment.all
  erb(:'/appointments/index')
end
