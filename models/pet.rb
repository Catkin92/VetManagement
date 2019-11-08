require_relative('../db/sql_runner')

class Pet

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @dob = options['dob']
    @type = options['type']
    @notes = options['notes']
    @vet_id = options['vet_id'].to_i
    @owner_id = options['owner_id'].to_i
  end
  
end
