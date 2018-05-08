require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry-byebug' )
require_relative( '../models/owner.rb' )
require_relative( '../models/animal.rb' )
require_relative( '../models/breed.rb' )




get '/owners' do
  @owners = Owner.all()
  erb(:"owner/index")
end
