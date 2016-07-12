require('sinatra')
require('sinatra/reloader')
also_reload('lib/**/*.rb')
require('./lib/doctor')
require('./lib/patient')
require('pg')

DB = PG.connect({:dbname => 'hospital_test'})

get('/') do
  erb(:index)
end

get('/doctors/new') do
  erb(:doctor_form)
end

post('/doctors/success') do
  erb(:doctor_success)
end

get('/doctors') do
  @doctors = Doctor.all()
  erb(:doctors)
end

post('/doctors') do
  doctor_name = params.fetch('doctor_name')
  specialty = params.fetch('specialty')
  doctor = Doctor.new({:name => doctor_name, :specialty => specialty, :id => nil})
  doctor.save()
  @doctors = Doctor.all()
  erb(:doctors)
end

get("/doctors/:id") do
  @doctor = Doctor.find(params.fetch("id").to_i())
  erb(:doctor)
end
