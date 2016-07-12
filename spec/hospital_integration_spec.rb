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
    expect(page).to have_content("Success!")
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
