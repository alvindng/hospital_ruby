class Patient
  attr_reader(:name, :birthdate, :doctor_id)

  define_method(:initialize) do |attributes|
    @name = attributes.fetch(:name)
    @birthdate = attributes.fetch(:birthdate)
    @doctor_id = attributes.fetch(:doctor_id)
  end

  define_singleton_method(:all) do
    returned_patients = DB.exec("SELECT * FROM patients;")
    patients = []
    returned_patients.each() do |patient|
      name = patient.fetch('name')
      birthdate = patient.fetch('birthdate')
      doctor_id = patient.fetch('doctor_id').to_i()
      patients.push(Patient.new({:name => name, :birthdate => birthdate, :doctor_id => doctor_id}))
    end
    patients
  end

end
