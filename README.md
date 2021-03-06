# Vet Management Project
This is the first project I made in CodeClan, five weeks into the course, designed to consolidate my knowledge of Ruby and Sinatra. I had 5 days to create a simple app for a vetenary practice to create and view information in vets, pets, owners and appointments.

![Screenshot of appointment page](public/vetAppointment.png)

# Project Brief

### Vet Management App

A veterinary practice has approached you to build a web application to help them manage their animals and vets. A vet may look after many animals at a time. An animal is registered with only one vet. 

#### MVP

- The practice wants to be able to register / track animals. Important information for the vets to know is -
  - Name
  - Date Of Birth (use a VARCHAR initially)
  - Type of animal
  - Contact details for the owner
  - Treatment notes
- Be able to assign animals to vets
- CRUD actions for vets / animals - remember the user - what would they want to see on each View? What Views should there be?

# Project Set Up

Create the database
```
createdb vet_db
```

Create the database tables
```
psql -d vet_db -f db/vet_management.sql
```

Populate the database
```
ruby db/seeds.db
```

Run the app
```
ruby app.db
```
