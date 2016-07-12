class Doctor
  attr_reader(:name, :id)

  define_method(:initialize) do |attributes|
    @name = attributes.fetch(:name)
    @id = attributes.fetch(:id)
  end

  define_singleton_method(:all) do
    returned_doctors = DB.exec("SELECT * FROM doctors;")
    doctors = []
    returned_doctors.each() do |doctor|
      name = doctor.fetch('name')
      id = doctor.fetch('id').to_i()
      doctors.push(Doctor.new({:name => name, :id => id}))
    end
    doctors
  end

end
