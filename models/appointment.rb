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

  def delete
    sql = "DELETE FROM appointments WHERE id = $1"
    SqlRunner.run(sql, [@id])
  end

  def pet
    sql = "SELECT * FROM pets
    WHERE id = $1"
    pet = SqlRunner.run(sql, [@pet_id]).first
    return Pet.new(pet)
  end

  def vet
    sql = "SELECT * FROM vets
    WHERE id = $1"
    vet = SqlRunner.run(sql, [@vet_id]).first
    return Vet.new(vet)
  end

  def time
    sql = "SELECT DATE_PART('minute', end_time - start_time) FROM appointments WHERE id = $1"
    values = [@id]
    time =  SqlRunner.run(sql, values).first
    return time['date_part'].to_i
  end

  def current_date
    sql = "SELECT DATE_PART('day', date - CURRENT_DATE) FROM appointments WHERE id = $1"
    values = [@id]
    current_date = SqlRunner.run(sql, values).first
    
  end

  def self.all
    sql = "SELECT * FROM appointments"
    appointments = SqlRunner.run(sql)
    all = appointments.map { |app| Appointment.new(app) }
    return all
  end

  def self.find(id)
    sql = "SELECT * FROM appointments
    WHERE id = $1"
    found = SqlRunner.run(sql, [id]).first
    return Appointment.new(found)
  end

  def self.find_by_vet(id)
    sql = "SELECT * FROM appointments
    WHERE vet_id = $1"
    found = SqlRunner.run(sql, [id]).first
    return Appointment.new(found)
  end

  def self.find_by_pet(id)
    sql = "SELECT * FROM appointments
    WHERE pet_id = $1"
    found = SqlRunner.run(sql, [id]).first
    return Appointment.new(found)
  end

  def self.find_by_date(date)
    sql = "SELECT * FROM appointments
    WHERE date = $1"
    found = SqlRunner.run(sql, [date]).first
    return Appointment.new(found)
  end
end
