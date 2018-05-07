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

end
