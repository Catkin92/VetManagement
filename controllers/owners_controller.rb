require('sinatra')
require('sinatra/contrib/all')
require_relative('../models/owner.rb')
require_relative('../models/pet.rb')
also_reload('../models/*')

get '/owner/:id' do
  @owner = Owner.find(params[:id])
  erb(:'/owner/show')
end
