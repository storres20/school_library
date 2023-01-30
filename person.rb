class Person
  def initialize(age, name = 'Unknown', parent_permission: true)
    @id = Random.rand(1..1000)
    @name = name
    @age = age
    @parent_permission = parent_permission
  end

  attr_accessor :name, :age
  attr_reader :id

  def can_use_services?
    return unless @age >= 18 || @parent_permission == true

    true
  end

  private

  def of_age?
    @age >= 18
  end
end
