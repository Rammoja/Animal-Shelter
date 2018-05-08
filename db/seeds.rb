require_relative( "../models/owner.rb" )
require_relative( "../models/animal.rb" )
require_relative( "../models/breed.rb" )
require("pry-byebug")


Animal.delete_all()
Owner.delete_all()
Breed.delete_all()

breed1 = Breed.new({
  "breed" => "Beagle"
  })
breed1.save()

breed2 = Breed.new({
  "breed" => "Golden Retriever"
  })
breed2.save()

breed3 = Breed.new({
  "breed" => "Bulldog"
    })
breed3.save()


animal1 = Animal.new({
  "name" => "Bella",
  "age" => 3,
  "breed_id" => breed1.id,
  "admission_date" => "3/5/2017",
  "status" => "adoptable"
  })
animal1.save()

animal2 = Animal.new({
  "name" => "Riley",
  "age" => 1,
  "breed_id" => breed2.id,
  "admission_date" => "12/2/2017",
  "status" => "not adoptable"
  })
animal2.save()

animal3 = Animal.new({
  "name" => "Oli",
  "age" => 4,
  "breed_id" => breed3.id,
  "admission_date" => "3/5/2018",
  "status" => "adoptable"
  })
animal3.save()

owner1 = Owner.new({
  "name" => "David",
  "contact_details" => " 07951234567 "
  })
owner1.save()

owner2 = Owner.new({
  "name" => "Susan",
  "contact_details" => " 07998765432 "
  })
owner2.save()

owner3 = Owner.new({
    "name" => "Sarah",
    "contact_details" => " 07919283746 "
    })
owner3.save()

binding.pry
nil
