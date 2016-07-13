require('capybara/rspec')
require('./app')
require('pry')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('adding a new doctor', {:type => :feature}) do
  it('allows the user to add a new doctor') do
    visit('/')
    click_link('Add New Doctor')
    fill_in('doctor_name', {:with => "Doctor Jones"})
    click_button('Add Doctor')
    expect(page).to have_content("Successfully")
  end
end

describe('viewing all doctors', {:type => :feature}) do
  it('allows the user to see all doctors') do
    doctor = Doctor.new({:name => 'Doctor Jones', :specialty => 'Dentist', :id => nil})
    doctor.save()
    visit('/')
    click_link('View All Doctors')
    expect(page).to have_content(doctor.name())
  end
end

describe('seeing details for a single doctor', {:type => :feature}) do
  it('allows a user to click a doctor and see the patients and specialty') do
    test_doctor = Doctor.new({:name => "Doctor Jones", :specialty => "Dentist", :id => nil})
    test_doctor.save()
    test_patient = Patient.new({:name => "John Smith", :birthday => "1990-12-20", :doctor_id => test_doctor.id(), :id => nil})
    test_patient.save()
    visit('/doctors')
    click_link(test_doctor.name())
    expect(page).to have_content(test_doctor.name())
  end
end
