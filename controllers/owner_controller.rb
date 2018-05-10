require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry-byebug' )
require_relative( '../models/owner.rb' )
require_relative( '../models/animal.rb' )
require_relative( '../models/breed.rb' )
require_relative( '../models/adoption.rb' )



get '/owners' do
  @owners = Owner.all()
  erb(:"owner/index")
end

#NEW
get '/owners/new' do
  erb :"owner/new"
end

#SHOW
get '/owners/:id' do
  @owner = Owner.find(params[:id])
  erb(:"owner/show")
end

#CREATE
post '/owners' do
  Owner.new(params).save
  redirect to '/owners'
end

#EDIT
get "/owners/:id/edit" do
  @owner = Owner.find(params[:id])
  erb(:"owner/edit")
end

#UPDATE
post "/Owners/:id" do
  @owner = Owner.new(params)
  @owner.update
  redirect to '/owners'
end


#DELETE
post "/owners/:id/delete" do


end
