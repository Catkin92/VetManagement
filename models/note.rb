require_relative('../db/sql_runner.rb')
require_relative('./pet')

class Note

  attr_reader :id
  attr_accessor :pet_id, :note_date, :note

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @pet_id = options['pet_id'].to_i
    @note_date = options['note_date']
    @note = options['note']
  end

  def save
    sql = "INSERT INTO notes(
    pet_id,
    note_date,
    note
    ) VALUES(
    $1, $2, $3
    ) RETURNING *"
    values = [@pet_id, @note_date, @note]
    save = SqlRunner.run(sql, values).first
    @id = save['id']
  end

end