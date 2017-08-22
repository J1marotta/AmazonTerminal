# Amazon Challenge
#
# Create a Ruby terminal app that let's you borrow or by books from your own Amazon-like service
# Your Amazon service needs a recommendation engine which will help the user find new books to borrow or buy
# Be creative with how your recommendation engine thinks!!
#
# 3 groups chosen by Jamie will present their ideas



# New class to track the books
class Book

 def initialize (name, genre, author)
   @name = name
   @genre = genre
   @author = author
 end

 # getters and setters
 attr_accessor :name, :genre, :author

 def self.all
   ObjectSpace.each_object(self).to_a
 end



end

# class for our authors
class Author

 def initialize(name)
   @name = name
 end

 attr_accessor :name

 def self.all
   ObjectSpace.each_object(self).to_a
 end


end

class Genre

 def initialize(name)
   @name = name
 end

 attr_accessor :name

 def self.all
   ObjectSpace.each_object(self).to_a
 end

end



class User

 def initialize(name, cart=[])
   @name = name
   @cart = cart
 end

 attr_accessor :name, :cart



end



# Name, genre, author
# establish our library of books

## set up our Authors
 stephen_king = Author.new("Stephen King")
 kate_sherwood = Author.new("Kate Sherwood")
 katerina_martinez = Author.new("Katerina Martinez")
 stephen_graham_jones = Author.new("Stephen Graham Jones")
 christopher_moore = Author.new("Christopher Moore")
 donald_ray_pollock = Author.new("Donald Ray Pollock")
 grr_martin = Author.new("George RR Martin")
 jrr_tolkien = Author.new("JRR Tolkien")


# Define our Genres
 thriller = Genre.new("Thriller")
 fantasy = Genre.new("Fantasy")
 horror = Genre.new("Horror")


# Define our books
library = [
 Book.new("It: A Novel",thriller,stephen_king  ),
 Book.new("The Dark Tower",thriller,stephen_king  ),
 Book.new("Sleeping Beauties: A Novel",thriller,stephen_king  ),

 Book.new("Sacrati",thriller,kate_sherwood  ),
 Book.new("Dark Horse",thriller,kate_sherwood  ),
 Book.new("Mark of Cain",thriller,kate_sherwood  ),

 Book.new("Demon's Kiss",thriller,katerina_martinez  ),
 Book.new("Magick Reborn",thriller,katerina_martinez ),
 Book.new("Witch's Wrath",thriller,katerina_martinez  ),

 Book.new("Mongrels",horror,stephen_graham_jones  ),
 Book.new("The Last Final Girl",horror,stephen_graham_jones  ),
 Book.new("Ledfeather",horror,stephen_graham_jones  ),

 Book.new("A Dirty Job",horror,christopher_moore  ),
 Book.new("Secondhand Souls",horror,christopher_moore  ),
 Book.new("The Lust Lizard of Melancholy Cove",horror,christopher_moore  ),

 Book.new("The Heavenly Table",horror,donald_ray_pollock  ),
 Book.new("The Devil all the time",horror,donald_ray_pollock  ),
 Book.new("Knockemstiff",horror,donald_ray_pollock  ),

 Book.new("Game of thrones",fantasy,grr_martin ),
 Book.new("A Clash of Kings",fantasy,grr_martin  ),
 Book.new("A Storm of Swords",fantasy,grr_martin  ),

 Book.new("The Hobbit",fantasy,jrr_tolkien  ),
 Book.new("Lord of the Rings",fantasy,jrr_tolkien  )
]


 ### present the options to the user .

def choice
 ## recommendation or choose genre or author .
 choice = 1
 while choice == 1
   puts " Would you like a recommendation or you can purchase"
   puts " by Author or Genre"

   puts "1 for Random Recommendation"
   puts "2 to shop by Genre"
   puts "3 to shop by Author"
   puts "4 to list all books"

   input = gets.chomp.to_s

   case input
   when "1"
     random_recommendation
     choice = 2
   when "2"
     shopGenre
     choice = 2
   when "3"
     shopAuthor
     choice = 2
   when "4"
     list_books
     choice = 2
   else
     puts "Please choose 1, 2, 3 or 4 "
   end

 end

end

def shopAuthor
  puts
   puts "Choose from our list of Authors:"

   # print all our authors
   Author.all.each {|author|

      puts author.name
    }
    # get a choice from the user
   author_choice = gets.chomp.to_s
   puts

   system("clear")
   # print out books matching author name of our choice.
   Book.all.each do |book|
     puts book.name if book.author.name == author_choice
   end
   puts

   puts "Which book would you like to buy?  "
   #set book choice from user
   book_choice = gets.chomp

   # book_genre = nil
   # set our book genre choice and add to cart
   Book.all.each do |book|
     @username.cart << book.name if book.name == book_choice
     # book_genre = book.genre.name if book.name == book_choice
   end

   puts
   puts "Here are some other recommendations from the same Author."
   Book.all.each do |book|
     puts book.name if book.author.name == author_choice
   end
   puts




   puts
   system("clear")
   puts "Your Cart:"
   puts @username.cart
   puts
   sleep(2)
   system("clear")

end



def shopGenre
 puts
 puts
 puts "Choose from our Three Genres"

 # print all our authors
 Genre.all.each {|genre|

    puts genre.name
  }
  # get a choice from the user
 genre_choice = gets.chomp.to_s
 puts

 # print out books matching genre name of our choice.
 system("clear")
 Book.all.each do |book|
   puts book.name if book.genre.name == genre_choice
 end
 puts

 puts "Which book would you like to buy? "
 #set book choice from user
 book_choice = gets.chomp


 #  and add to cart
 Book.all.each do |book|
   @username.cart << book.name if book.name == book_choice
   # book_genre = book.genre.name if book.name == book_choice
 end

 puts
 puts "Here are some other recommendations from the same Genre."
 Book.all.each do |book|
   puts book.name if book.genre.name == genre_choice
 end
 puts


 puts
 system("clear")
 puts "Your Cart:"
 puts @username.cart
 puts
 sleep(2)
 system("clear")

end


def list_books
  system("clear")
  puts "Here is all our books available."
  Book.all.each do |book|
    puts book.name
  end
  puts
  puts
  sleep(2)
end


def random_recommendation
  system("clear")
  puts "Try this book"
  random_book = []
  Book.all.each do |book|
    random_book << book
  end
  puts random_book.sample.name

  puts
end


### Introduction method

 puts " hello welcome to our \"Amazon\" online book Shop"
 puts " whats your name? "
 @username = User.new(gets.chomp)
until 1 > 2
 choice
end
