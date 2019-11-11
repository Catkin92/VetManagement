require('pry')
require_relative('../models/owner.rb')
require_relative('../models/vet.rb')
require_relative('../models/pet.rb')
require_relative('../models/note.rb')

owner1 = Owner.new(
  'name' => 'Cruella De Vil',
  'address' => 'Hell Hall, Ipswich, Suffolk, IP2 6ST',
  'phone_number' => '01473 672 364')
owner2 = Owner.new(
  'name' => 'Alice Liddell',
  'address' => '3 Carroll Lane, Framlingham, Suffolk, IP13 8XE',
  'phone_number' => '01728 749 936')
owner3 = Owner.new(
  'name' => 'Bill Sykes',
  'address' => '12 Dickens Drive, Alderburgh, Suffolk, IP15 5DF ',
  'phone_number' => '01728 324 773')

owner1.save
owner2.save
owner3.save

vet1 = Vet.new(
  'name' => 'Dr. John Dolittle'
)
vet2 = Vet.new(
  'name' => 'Dr. Morwenna Hamster'
)

vet1.save
vet2.save

pet1 = Pet.new(
  'name' => 'Patch',
  'dob' => '12/10/19',
  'type' => 'dalmatian',
  'vet_id' => vet2.id,
  'owner_id' => owner1.id)
pet2 = Pet.new(
  'name' => 'Rolly',
  'dob' => '12/10/19',
  'type' => 'dalmatian',
  'vet_id' => vet2.id,
  'owner_id' => owner1.id)
pet3 = Pet.new(
  'name' => 'Dinah',
  'dob' => '23/7/17',
  'type' => 'cat',
  'vet_id' => vet1.id,
  'owner_id' => owner2.id)
pet4 = Pet.new(
  'name' => 'Roscoe',
  'dob' => '4/2/15',
  'type' => 'doberman',
  'vet_id' => vet1.id,
  'owner_id' => owner3.id)

pet1.save
pet2.save
pet3.save
pet4.save

  note1 = Note.new(
    'pet_id' => pet1.id,
    'note_date' => '2007-12-04',
    'note' => 'Patch is presenting with mild alopecia.')
  note2 = Note.new(
    'pet_id' => pet1.id,
    'note_date' => '2007-10-17',
    'note' => 'Patch has some bald patches.')
  note3 = Note.new(
    'pet_id' => pet4.id,
    'note_date' => '2016-05-10',
    'note' => 'Roscoe seems to be getting more aggressive.')

note1.save
note2.save
note3.save

# binding.pry
#
# nil
