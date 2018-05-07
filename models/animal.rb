require_relative( '../db/sql_runner' )

class Animal

  attr_reader( :name, :breed_id, :age, :admission_date, :status, :id )

  def initialize( options )
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @breed_id = options['breed_id'].to_i
    @age = options['age'].to_i
    @admission_date = options['admission_date']
    @status = options['status']
  end


  def save()
    sql = "INSERT INTO animals
    (
      name, breed_id, age, admission_date, status
    )
    VALUES
    (
      $1, $2, $3, $4, $5
    )
    RETURNING id"
    values = [@name, @breed_id, @age, @admission_date, @status]
    results = SqlRunner.run(sql, values)
    @id = results.first()['id'].to_i
  end

  def self.all()
    sql = "SELECT * FROM animals"
    results = SqlRunner.run( sql )
    return results.map { |animal| Animal.new( animal ) }
  end


  def self.delete_all()
    sql = "DELETE FROM animals"
    SqlRunner.run( sql )
  end



end
