require('rspec')
require('patient')
require('pg')
require('spec_helper')

describe(Patient) do
  describe('.all') do
    it('starts off with no lists') do
      expect(Patient.all()).to(eq([]))
    end
  end

  describe("#name") do
    it("tells you patient name") do
      test_patient = Patient.new({:name => "Gary Oldman", :birthday => '1990-12-20', :doctor_id => 1, :id => nil})
      expect(test_patient.name()).to(eq("Gary Oldman"))
    end
  end

  describe("#birthday") do
    it("tells you patient birthday") do
      test_patient = Patient.new({:name => "Gary Oldman", :birthday => '1990-12-20', :doctor_id => 1, :id => nil})
      expect(test_patient.birthday()).to(eq("1990-12-20"))
    end
  end

  describe("#id") do
    it("sets its ID when you save it") do
      test_patient = Patient.new({:name => "Doctor Holiday", :birthday => '1990-12-20', :doctor_id => 1, :id => nil})
      test_patient.save()
      expect(test_patient.id()).to(be_an_instance_of(Fixnum))
    end
  end

  describe("#save") do
    it("lets you save patients to the database") do
      test_patient = Patient.new({:name => "Gary Oldman", :birthday => '1990-12-20', :doctor_id => 1, :id => nil})
      test_patient.save()
      expect(Patient.all()).to(eq([test_patient]))
    end
  end

  describe('#==') do
    it('is the same patient if it has the same name') do
      test_patient1 = Patient.new({:name => "Gary Oldman", :birthday => '1990-12-20', :doctor_id => 1, :id => nil})
      test_patient2 = Patient.new({:name => "Gary Oldman", :birthday => '1990-12-20', :doctor_id => 1, :id => nil})
      expect(test_patient1).to(eq(test_patient2))
    end
  end

  describe("#doctor_id") do
    it("tells you patient birthday") do
      test_patient = Patient.new({:name => "Gary Oldman", :birthday => '1990-12-20', :doctor_id => 1, :id => nil})
      expect(test_patient.doctor_id()).to(eq(1))
    end
  end


end
