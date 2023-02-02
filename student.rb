require './person'

class Student < Person
  def initialize(_classroom, age, name = 'Unknown', parent_permission: true)
    super(age, name, parent_permission: true)
    @classroom = classroom
    @parent_permission = parent_permission
  end
  
  attr_reader :classroom

  def play_hooky
    '¯(ツ)/¯'
  end
  
  def classroom=(classroom)
    @classroom = classroom
    classroom.students.push(self) unless classroom.students.include?(self)
  end
end
