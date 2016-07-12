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
        test_doctor_list = Doctor.new({:name => "Doctor Holiday", :id => nil})
        expect(test_doctor_list.name()).to(eq("Doctor Holiday"))
      end
    end

  describe("#save") do
    it("lets you save doctors to the database") do
      test_doctor_list = Doctor.new({:name => "Doctor Holiday", :id => nil})
      test_doctor_list.save()
      expect(Doctor.all()).to(eq([test_doctor_list]))
    end
  end

  describe("#id") do
    it("sets its ID when you save it") do
      test_doctor_list = Doctor.new({:name => "Doctor Holiday", :id => nil})
      test_doctor_list.save()
      expect(test_doctor_list.id()).to(be_an_instance_of(Fixnum))
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

  #
  # describe(".find") do
  #   it("returns a doctor by their ID") do
  #     test_doctor_list = Doctor.new({:name => "Doctor Holiday", :id => nil})
  #     test_doctor_list.save()
  #     test_doctor_list2 = Doctor.new({:name => "Doctor Johnson", :id => nil})
  #     test_doctor_list2.save()
  #     expect(Doctor.find(test_doctor_list2.id())).to(eq(test_doctor_list2))
  #   end
  # end
  #
end
