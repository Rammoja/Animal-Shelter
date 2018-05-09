require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry-byebug' )
require_relative( '../models/animal.rb' )
require_relative( '../models/owner.rb' )
require_relative( '../models/breed.rb' )
require_relative( '../models/adoption.rb' )

#INDEX
get '/animals' do
  @animals = Animal.all()
  erb(:"animal/index")
end

#NEW
get '/animals/new' do
  erb :"animal/new"
end

#SHOW
get '/animals/:id' do
@animal = Animal.find(params[:id])
erb(:"animal/show")
end

#CREATE
post '/animals' do
  Animal.new(params).save
  redirect to '/animals'
end

#EDIT
get "/animals/:id/edit" do
  @animal = Animal.find(params[:id])
  erb(:"animal/edit")
end

#UPDATE
post "/animals/:id" do
  @animal = Animal.new(params)
  @animal.update
  redirect to '/animals'
end


#DELETE
post "/animals/:id/delete" do


end
