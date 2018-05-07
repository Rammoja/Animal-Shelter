require_relative( '../db/sql_runner' )

class Breed

  attr_reader( :breed, :id )

  def initialize( options )
    @id = options['id'].to_i if options['id']
    @breed = options['breed']
  end


  def save()
    sql = "INSERT INTO breeds

      (breed)


    VALUES
    ($1)

    RETURNING id"
    values = [@breed]
    results = SqlRunner.run(sql, values)
    @id = results.first()['id'].to_i
  end

  def self.all()
    sql = "SELECT * FROM breeds"
    results = SqlRunner.run( sql )
    return results.map { |breed| Breed.new( breed ) }
  end


  def self.delete_all()
    sql = "DELETE FROM breeds"
    SqlRunner.run( sql )
  end



end
