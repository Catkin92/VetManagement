require_relative('../db/sql_runner')

class Vet

  attr_reader :id
  attr_accessor :name

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
  end

  def save
    sql = "INSERT INTO vets(
    name
    ) VALUES(
    $1
    ) RETURNING *"
    values = [@name]
    save = SqlRunner.run(sql, values).first
    @id = save['id']
  end

  def update
    sql = "UPDATE vets SET(
    name) = ($1)
    WHERE id = $2"
    values = [@name, @id]
    SqlRunner.run(sql, values)
  end

  def delete
    sql = "DELETE FROM vets WHERE id = $1"
    SqlRunner(sql, [@id])
  end

  def self.all
    sql = "SELECT * FROM vets"
    vets = SqlRunner.run(sql)
    found_vets = vets.map { |vet| Vet.new(vet) }
    return found_vets
  end
end
