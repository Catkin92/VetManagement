require_relative('../db/sql_runner')

class Pet

  attr_reader :id
  attr_accessor :name, :dob, :type, :notes, :vet_id, :owner_id

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @dob = options['dob']
    @type = options['type']
    @notes = options['notes']
    @vet_id = options['vet_id'].to_i
    @owner_id = options['owner_id'].to_i
  end

  def save
    sql = "INSERT INTO pets(
    name,
    dob,
    type,
    notes,
    vet_id,
    owner_id
    ) VALUES(
    $1, $2, $3, $4, $5, $6
    ) RETURNING *"
    values = [@name, @dob, @type, @notes, @vet_id, @owner_id]
    save = SqlRunner.run(sql, values).first
    @id = save['id']
  end

  def update
    sql = "UPDATE pets SET(
    name,
    dob,
    type,
    notes,
    vet_id,
    owner_id
    ) = (
    $1, $2, $3, $4, $5, $6
    ) WHERE id = $7"
    values = [@name, @dob, @type, @notes, @vet_id, @owner_id, @id]
    SqlRunner.run(sql, values)
  end

  def delete
    sql = "DELETE FROM pets
    WHERE id = $1"
    SqlRunner.run(sql, [@id])
  end

  def owner
    sql = "SELECT * FROM owners
    WHERE id = $1"
    owner = SqlRunner.run(sql, [@owner_id]).first
    return owner
  end

  def vet
    sql = "SELECT * FROM vets
    WHERE id = $1"
    vet = SqlRunner.run(sql, [@vet_id]).first
    return vet
  end

  def self.all
    sql = "SELECT * FROM pets"
    pets = SqlRunner.run(sql)
    found_pets = pets.map { |pet| Pet.new(pet) }
    return found_pets
  end

  def self.find(id)
    sql = "SELECT * FROM pets
    WHERE id = $1"
    pet = SqlRunner.run(sql, [id]).first
    return pet
  end

end
