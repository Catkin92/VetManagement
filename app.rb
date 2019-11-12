require('sinatra')
require('sinatra/contrib/all')
require_relative('./controllers/pets_controller.rb')
require_relative('./controllers/vets_controller.rb')
require_relative('./controllers/owners_controller.rb')
require_relative('./controllers/notes_controller.rb')
require_relative('./controllers/appointments_controller.rb')

get '/' do
  @pets = Pet.all
erb(:index)
end
