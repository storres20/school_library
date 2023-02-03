require_relative './student'
require_relative './teacher'
require_relative './book'
require_relative './rental'

class App
  def initialize(menu)
    @menu = menu
    @books = []
    @people = []
    @rentals = []
  end

  def list_all_books
    if @books.empty?
      puts 'No added book!'
    else
      @books.each { |book| puts "Title: #{book.title}, Author: #{book.author}" }
    end
    @menu.show_menu
  end

  def list_all_people
    if @people.empty?
      puts 'No added person!'
    else
      @people.each { |person| puts "[#{person.class}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}" }
    end
    @menu.show_menu
  end

  def create_student
    print 'Age: '
    age = gets.chomp.to_i
    if age.zero?
      puts 'Invalid age'
    else
      print 'Name: '
      name = gets.chomp
      print 'Has parent permission? [Y/N]: '
      parent_permission = gets.chomp.downcase == 'y'
      print 'Classroom: '
      classroom = gets.chomp
      @people.push(Student.new(classroom, age, name: name, parent_permission: parent_permission))
      puts
      puts 'Person created successfuly'
    end
  end

  def create_teacher
    print 'Age: '
    age = gets.chomp.to_i
    if age.zero?
      puts 'Invalid age'
    else
      print 'Name: '
      name = gets.chomp
      print 'Specialization: '
      specialization = gets.chomp
      @people.push(Teacher.new(specialization, age, name: name))
      puts
      puts 'Person created successfuly'
    end
  end

  def create_person
    puts 'Do you want to create a student(1) or a teacher(2)? [Input the number]'
    person = gets.chomp
    case person
    when '1'
      create_student
    when '2'
      create_teacher
    else
      puts 'Please add either 1 or 2!'
    end

    @menu.show_menu
  end

  def create_book
    print 'Title: '
    title = gets.chomp
    print 'Author: '
    author = gets.chomp
    @books.push(Book.new(title, author))
    puts 'Book created successfully'
    @menu.show_menu
  end

  def create_rental
    puts 'Select a book from the following list by number'
    @books.each_with_index { |book, index| puts "#{index}) Title: '#{book.title}', Author: #{book.author}" }
    book_number = gets.chomp.to_i
    puts

    puts 'Select a person from the following list by number (not id)'
    @people.each_with_index do |person, index|
      puts "#{index}) [#{person.class}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
    end
    person_number = gets.chomp.to_i

    print 'Date: '
    date = gets.chomp
    @rentals.push(Rental.new(date, @books[book_number], @people[person_number]))
    puts 'Rental created successfully'

    @menu.show_menu
  end

  def list_all_rentals
    print 'ID of person: '
    id = gets.chomp.to_i
    puts 'Rentals:'
    @rentals.each do |rental|
      puts "Date: #{rental.date}, Book \"#{rental.book.title}\" by #{rental.book.author}" if rental.person.id == id
    end
    @menu.show_menu
  end

  def exit
    puts 'Thank you for using the app!'
  end
end
