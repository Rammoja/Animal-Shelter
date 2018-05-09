require_relative( '../db/sql_runner' )

class Adoption

  attr_reader( :owner_id, :animal_id, :adoption_date, :id )

  def initialize( options )
    @id = options['id'].to_i if options['id']
    @owner_id = options['owner_id']
    @animal_id = options['animal_id'].to_i
    @adoption_date = options['adoption_date']
  end

  def save()
    sql = "INSERT INTO adoptions
    (
      owner_id, animal_id, adoption_date

    )
    VALUES
    (
      $1, $2, $3
    )
    RETURNING id"
    values = [@owner_id, @animal_id, @adoption_date]
    results = SqlRunner.run(sql, values)
    @id = results.first()['id'].to_i
  end

  def owner()
      sql = "SELECT name FROM owners
      WHERE id = $1"
      values = [@owner_id]
      results = SqlRunner.run( sql, values )
      result = Owner.new( results.first )
      return result.name
    end

    def animal()
      sql = "SELECT name FROM animals
      WHERE id = $1"
      values = [@animal_id]
      results = SqlRunner.run( sql, values )
      result = Animal.new( results.first )
      return result.name
    end




  # def get_name_by_id
  #   sql = "SELECT owner FROM owners INTO JOIN WHERE id = $1"
  #   values = [@owner_id]
  #   result = SqlRunner.run(sql, values).first
  #   return result['owner']
  # end


  def self.find( id )
    sql = "SELECT * FROM adoptions WHERE id = $1"
    values = [id]
    adoption = SqlRunner.run( sql, values )
    result = Adoption.new( adoption.first )
    return result
  end


  def self.all()
    sql = "SELECT * FROM adoptions"
    results = SqlRunner.run( sql )
    return results.map { |adoption| Adoption.new( adoption ) }
  end


  def self.delete_all()
    sql = "DELETE FROM adoptions"
    SqlRunner.run( sql )
  end

end
