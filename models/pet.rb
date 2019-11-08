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
end
