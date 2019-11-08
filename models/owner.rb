require_relative('../db/sql_runner.rb')

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
    ) = (
    $1, $2, $3)
    WHERE id = $4"
    values = [@name, @address, @phone_number, @id]
    owner = SqlRunner.run(sql, values)[0]
    return owner
  end

  def delete
    sql = "DELETE FROM owners
    WHERE id = $1"
    SqlRunner.run(sql, [@id])
  end

  def self.all
    sql = "SELECT * FROM owners"
    owners = SqlRunner.run(sql)
    found_owners = owners.map { |owner| Owner.new(owner) }
    return found_owners
  end

  def self.id(id)
    sql = "SELECT * FROM owners
    WHERE id = $1"
    found_owner = SqlRunner.run(sql, [@id])[0]
    return found_owner
  end

end
