require('rspec')
require('doctor')
require('pg')
require('spec_helper')
require('pry')

describe(Doctor) do
  describe('.all') do
    it('starts off with no lists') do
      expect(Doctor.all()).to(eq([]))
    end
  end

  describe("#name") do
      it("tells you doctor name") do
        test_doctor = Doctor.new({:name => "Doctor Holiday", :specialty => "Dentist", :id => nil})
        expect(test_doctor.name()).to(eq("Doctor Holiday"))
      end
    end

  describe("#specialty") do
      it("tells you doctor specialty") do
        test_doctor = Doctor.new({:name => "Doctor Holiday", :specialty => "Dentist", :id => nil})
        expect(test_doctor.specialty()).to(eq("Dentist"))
      end
    end

  describe("#save") do
    it("lets you save doctors to the database") do
      test_doctor = Doctor.new({:name => "Doctor Holiday", :specialty => "Dentist", :id => nil})
      test_doctor.save()
      expect(Doctor.all()).to(eq([test_doctor]))
    end
  end

  describe("#id") do
    it("sets its ID when you save it") do
      test_doctor = Doctor.new({:name => "Doctor Holiday", :specialty => "Dentist", :id => nil})
      test_doctor.save()
      expect(test_doctor.id()).to(be_an_instance_of(Fixnum))
    end
  end

  describe('#==') do
    it('is the same doctor if it has the same name') do
      test_doctor1 = Doctor.new({:name => "Doctor Jones", :specialty => "Dentist", :id => nil})
      test_doctor2 = Doctor.new({:name => "Doctor Jones", :specialty => "Dentist", :id => nil})
      expect(test_doctor1).to(eq(test_doctor2))
    end
  end

  describe(".find") do
    it("returns a doctor by their ID") do
      test_doctor = Doctor.new({:name => "Doctor Jones", :specialty => "Dentist", :id => nil})
      test_doctor.save()
      test_doctor2 = Doctor.new({:name => "Doctor Barnes", :specialty => "Dentist", :id => nil})
      test_doctor2.save()
      expect(Doctor.find(test_doctor2.id())).to(eq(test_doctor2))
    end
  end

  describe("#patients") do
    it("returns an array of patients for that doctor") do
      test_doctor = Doctor.new({:name => "Doctor Jones", :specialty => "Dentist", :id => nil})
      test_doctor.save()
      test_patient1 = Patient.new({:name => "Gary Oldman", :birthday => '1990-12-20', :doctor_id => test_doctor.id(), :id => nil})
      test_patient1.save()
      test_patient2 = Patient.new({:name => "Frank Miller", :birthday => '1980-01-03', :doctor_id => test_doctor.id(), :id => nil})
      test_patient2.save()
      expect(test_doctor.patients()).to(eq([test_patient1, test_patient2]))
    end
  end

end
