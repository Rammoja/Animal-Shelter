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

  def self.find( id )
      sql = "SELECT * FROM animals WHERE id = $1"
      values = [id]
      animal = SqlRunner.run( sql, values )
      result = Animal.new( animal.first )
      return result
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

  def get_breed_name_by_id
    sql = "SELECT breed FROM breeds WHERE id = $1"
    values = [@breed_id]
    result = SqlRunner.run(sql, values).first
    return result['breed']
  end


  def update()
      sql = "UPDATE animals
      SET
      (
        name,
        age,
        status
      ) =
      (
        $1, $2, $3
      )
      WHERE id = $3"
      values = [@name, @age, @status ]
      SqlRunner.run( sql, values )
    end





end
