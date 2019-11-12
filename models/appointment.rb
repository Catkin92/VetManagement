require_relative('../db/sql_runner.rb')
require_relative('./pet')
require_relative('./vet')

class Appointment

  attr_reader :id
  attr_accessor :pet_id, :vet_id, :date, :start_time, :end_time, :details

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @pet_id = options['pet_id'].to_i
    @vet_id = options['vet_id'].to_i
    @date = options['date']
    @start_time = options['start_time']
    @end_time = options['end_time']
    @details = options['details']
  end

  def save
    sql = "INSERT INTO appointments(
    pet_id,
    vet_id,
    date,
    start_time,
    end_time,
    details
    ) VALUES (
    $1, $2, $3, $4, $5, $6)
    RETURNING *"
    values = [@pet_id, @vet_id, @date, @start_time, @end_time, @details]
    save = SqlRunner.run(sql, values).first
    @id = save['id']
  end

  def update
    sql = "UPDATE appointments SET(
    pet_id,
    vet_id,
    date,
    start_time,
    end_time,
    details
    ) = (
    $1, $2, $3, $4, $5, $6)
    WHERE id = $7"
    values = [@pet_id, @vet_id, @date, @start_time, @end_time, @details, @id]
    SqlRunner.run(sql, values)
  end

end
