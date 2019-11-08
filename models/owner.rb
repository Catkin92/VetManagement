require_reltive('../db/sql_runner.rb')

class Owner

  attr_accessor :name, :address, :phone_number
  attr_reader :id

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @address = options['address']
    @phone_number = options['phone_number']
  end

  def save
    sql = "INSERT INTO owners(
    name,
    address,
    phone_number
    ) VALUES(
      $1, $2, $3
    ) RETURNING *"
    values = [@name, @address, @phone_number]
    save = SqlRunner.run(sql, values)
    @id = save[0]['id'].to_i
  end

  def update
    sql = "UPDATE owners SET(
    name,
    address,
    phone_number
    )"
  end
end
