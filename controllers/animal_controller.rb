require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry-byebug' )
require_relative( '../models/animal.rb' )
require_relative( '../models/owner.rb' )
require_relative( '../models/breed.rb' )




get '/animals' do
  @animals = Animal.all()
  erb(:"animal/index")
end


get "/animals/:id/edit" do
  @animal = Animal.find(params[:id])
  erb(:"animal/edit")
end

post "/animals/:id/edit" do
  @animal = Animal.new(params)
  @animal.update
  redirect to '/animals'
end
