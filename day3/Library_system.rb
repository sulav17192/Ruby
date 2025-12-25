
class Book
  attr_accessor :title, :author, :isbn, :is_available

  def initialize(title, author, isbn)
    @title = title
    @author = author
    @isbn = isbn
    @is_available = true
  end

  def check_out
    @is_available = false
  end

  def return_book
    @is_available = true
  end

  def to_s
    "#{title} by #{author} (ISBN: #{isbn})"
  end
end

class Member
  attr_accessor :name, :member_id

  @@total_members = 0

  def initialize(name, member_id)
    @name = name
    @member_id = member_id
    @borrowed_books = []
    @@total_members += 1
  end

  def borrow(book) # amount of book to take is 3
    if @borrowed_books.length >= 3
      puts "#{name} has reached the borrowing limit."
    elsif !book.is_available
      puts "#{book.title} is not available."
    else
      book.check_out
      @borrowed_books << book
      puts "#{name} borrowed '#{book.title}'."
    end
  end

  def return(book) # return the book and delete from data
    if @borrowed_books.include?(book)
      book.return_book
      @borrowed_books.delete(book)
      puts "#{name} returned '#{book.title}'."
    else
      puts "#{name} does not have '#{book.title}'."
    end
  end

  def list_books  #list all book that member has taken
    if @borrowed_books.empty?
      puts "#{name} has no borrowed books."
    else
      puts "#{name}'s borrowed books:"
      @borrowed_books.each { |book| puts "  - #{book}" }
    end
  end

  def self.total_members # belongs to class itself only .self
    @@total_members
  end

  private

  attr_accessor :borrowed_books
end

class PremiumMember < Member
  def borrow(book)
    if instance_variable_get(:@borrowed_books).length >= 5
      puts "#{name} has reached the premium borrowing limit."
    elsif !book.is_available
      puts "#{book.title} is not available."
    else
      book.check_out
      instance_variable_get(:@borrowed_books) << book
      puts "#{name} (Premium) borrowed '#{book.title}'."
    end
  end
end


book1 = Book.new("1984", "George Orwell", "ISBN001")
book2 = Book.new("To Kill a Mockingbird", "Harper Lee", "ISBN002")
book3 = Book.new("The Hobbit", "J.R.R. Tolkien", "ISBN003")
book4 = Book.new("The Catcher in the Rye", "J.D. Salinger", "ISBN004")

member1 = Member.new("Alice", 101)
member2 = Member.new("Bob", 102)
member3 = Member.new("Charlie", 103)
member4 = Member.new("Daisy", 104)

premium_member = PremiumMember.new("Eve", 201)

member1.borrow(book1)
member1.borrow(book2)
member1.borrow(book3)


premium_member.borrow(book4)


member1.return(book2)

puts
member1.list_books
puts
premium_member.list_books

puts
puts "Total members created: #{Member.total_members}"
