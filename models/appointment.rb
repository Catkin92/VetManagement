require_relative('../db/sql_runner.rb')
require_relative('./pet')
require_relative('./vet')

class Appointment

  attr_reader :id
  attr_accessor :pet_id, :vet_id, :date, :start_time, :end_time, :details

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @pet_id = options['id'].to_i
    @vet_id = options['id'].to_i
    @date = options['date']
    @start_time = options['start_time']
    @end_time = options['end_time']
    @details = options['details']
  end

end
