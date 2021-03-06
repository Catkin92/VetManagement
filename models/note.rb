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
    $1, now(), $2
    ) RETURNING *"
    values = [@pet_id, @note]
    save = SqlRunner.run(sql, values).first
    @id = save['id']
  end

  def update
    sql = "UPDATE notes SET(
    pet_id,
    note_date,
    note
    ) = (
    $1, now(), $2
    ) WHERE id = $3"
    values = [@pet_id, @note, @id]
    SqlRunner.run(sql, values)
  end

  def delete
    sql = "DELETE FROM notes WHERE id = $1"
    SqlRunner.run(sql, [@id])
  end

  def self.delete_by_pet(id)
    sql = "DELETE FROM notes WHERE pet_id = $1"
    SqlRunner.run(sql, [id])
  end

  def self.find_by_pet(id)
    sql = "SELECT * FROM notes WHERE pet_id = $1"
    pet_notes = SqlRunner.run(sql, [id])
    notes = pet_notes.map { |note| Note.new(note) }
    return notes
  end

  def self.find(id)
    sql = "SELECT * FROM notes WHERE id = $1"
    found_note = SqlRunner.run(sql, [id]).first
    return Note.new(found_note)
  end
end
