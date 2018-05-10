require_relative( '../db/sql_runner' )

class Owner

  attr_reader( :name, :contact_details, :id )

  def initialize( options )
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @contact_details = options['contact_details']
  end


  def save()
    sql = "INSERT INTO owners
    (
      name,
      contact_details
    )
    VALUES
    (
      $1, $2
    )
    RETURNING id"
    values = [@name, @contact_details]
    results = SqlRunner.run(sql, values)
    @id = results.first()['id'].to_i
  end

  def self.find( id )
    sql = "SELECT * FROM owners WHERE id = $1"
    values = [id]
    owner = SqlRunner.run( sql, values )
    result = Owner.new( owner.first )
    return result
  end

  def self.all()
    sql = "SELECT * FROM owners"
    results = SqlRunner.run( sql )
    return results.map { |owner| Owner.new( owner ) }
  end


  def self.delete_all()
    sql = "DELETE FROM owners"
    SqlRunner.run( sql )
  end


end
