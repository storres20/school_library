require './person'

class Student < Person
  def initialize(*person, classroom)
    super(*person)
    @classroom = classroom
  end

  def play_hooky
    '¯(ツ)/¯'
  end
end
