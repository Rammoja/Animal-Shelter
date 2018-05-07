require_relative( '../db/sql_runner' )

class Breed

  attr_reader( :breed, :id )

  def initialize( options )
    @id = options['id'].to_i if options['id']
    @breed = options['breed']
  end


  def save()
    sql = "INSERT INTO breeds
    (
      breed,

    )
    VALUES
    (
      $1
    )
    RETURNING id"
    values = [@breed]
    results = SqlRunner.run(sql, values)
    @id = results.first()['id'].to_i
  end
end
