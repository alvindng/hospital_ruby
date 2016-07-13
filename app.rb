require('sinatra')
require('sinatra/reloader')
also_reload('lib/**/*.rb')
require('./lib/doctor')
require('./lib/patient')
require('pg')
require('pry')

DB = PG.connect({:dbname => 'hospital_test'})

get('/') do
  erb(:index)
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
  @doctor = doctor
  erb(:doctor_success)
end

get("/doctors/:id") do
  @doctor = Doctor.find(params.fetch("id").to_i())
  @patients = Patient.all()
  erb(:doctor)
end

get('/doctors/new') do
  erb(:doctor_form)
end

post('/doctors/success') do
  erb(:doctor_success)
end

get('/doctor') do
  @patients = Patient.all()
  erb(:doctor)
end

post('/doctor') do
  doctor_id = params.fetch('doctor_id').to_i()
  @doctor_id = Doctor.find(doctor_id)
  patient_name = params.fetch('patient_name')
  birthday = params.fetch('birthday')
  @patient = Patient.new({:name => patient_name, :birthday => birthday, :doctor_id => @doctor_id.to_i(), :id => nil})
  @patient.save()
  erb(:patient_success)
end

get('/patient/new') do
  erb(:patient_form)
end

get('patients/:id') do
  @patient = Patient.find(params.fetch('id').to_i())
  erb(:patient)
end
