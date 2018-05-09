require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry-byebug' )
require_relative( '../models/adoption.rb' )
require_relative( '../models/animal.rb' )
require_relative( '../models/owner.rb' )
require_relative( '../models/breed.rb' )


get '/adoptions' do
  @adoptions = Adoption.all()
  erb(:"adoption/index")
end

get '/adoptions/new' do
  @animals = Animal.all
  @owners = Owner.all
  erb(:"adoption/new")
end

post '/adoptions' do
  adoption = Adoption.new(params)
  adoptions.save
  # redirect to("/bitings")
end

post '/adoptions/:id/delete' do
  Adoption.delete(params[:id])
  # redirect to("/bitings")
end
