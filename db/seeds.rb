require('pry')
require_relative('../models/owner.rb')

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
