require './person'

class Teacher < Person
  def initialize(*person, specialization)
    super(*person)
    @specialization = specialization
  end

  def can_use_services?
    true
  end
end
