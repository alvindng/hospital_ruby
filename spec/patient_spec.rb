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
end
