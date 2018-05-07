require_relative( '../db/sql_runner' )

class Adoptable

  attr_reader( :owner_id, :animal_id, :adoption_date, :id )

  def initialize( options )
    @id = options['id'].to_i if options['id']
    @owner_id = options['owner_id'].to_i
    @animal_id = options['animal_id'].to_i
    @adoption_date = options['adoption_date'].to_i

  end

  def save()
    sql = "INSERT INTO adoptables
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

    def self.all()
      sql = "SELECT * FROM adoptables"
      results = SqlRunner.run( sql )
      return results.map { |adoptable| Adoptable.new( adoptable ) }
    end


    def self.delete_all()
      sql = "DELETE FROM adoptables"
      SqlRunner.run( sql )
    end

end
