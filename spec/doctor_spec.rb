require('rspec')
require('doctor')
require('pg')
require('spec_helper')

describe(Doctor) do
  describe('.all') do
    it('starts off with no lists') do
      expect(Doctor.all()).to(eq([]))
    end
  end

  describe("#name") do
      it("tells you doctor name") do
        test_doctor = Doctor.new({:name => "Doctor Holiday", :id => nil})
        expect(test_doctor.name()).to(eq("Doctor Holiday"))
      end
    end

  describe("#save") do
    it("lets you save doctors to the database") do
      test_doctor = Doctor.new({:name => "Doctor Holiday", :id => nil})
      test_doctor.save()
      expect(Doctor.all()).to(eq([test_doctor]))
    end
  end

  describe("#id") do
    it("sets its ID when you save it") do
      test_doctor = Doctor.new({:name => "Doctor Holiday", :id => nil})
      test_doctor.save()
      expect(test_doctor.id()).to(be_an_instance_of(Fixnum))
    end
  end

  describe('#==') do
    it('is the same doctor if it has the same name') do
      test_doctor1 = Doctor.new({:name => "Doctor Jones", :id => nil})
      test_doctor2 = Doctor.new({:name => "Doctor Jones", :id => nil})
      expect(test_doctor1).to(eq(test_doctor2))
    end
  end

  describe(".find") do
    it("returns a doctor by their ID") do
      test_doctor = Doctor.new({:name => "Doctor Jones", :id => nil})
      test_doctor.save()
      test_doctor2 = Doctor.new({:name => "Doctor Barnes", :id => nil})
      test_doctor2.save()
      expect(Doctor.find(test_doctor2.id())).to(eq(test_doctor2))
    end
  end

end
