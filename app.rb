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
