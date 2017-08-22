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

  def self.all
    ObjectSpace.each_object(self).to_a
  end

end

@authors_array = [
  stephen_king = Author.new("Stephen King"),
  kate_sherwood = Author.new("Kate Sherwood"),
  katerina_martinez = Author.new("Katerina Martinez"),
  stephen_graham_jones = Author.new("Stephen Graham Jones"),
  christopher_moore = Author.new("Christopher Moore"),
  donald_ray_pollock = Author.new("Donald Ray Pollock"),
  grr_martin = Author.new("George RR Martin"),
  jrr_tolkien = Author.new("JRR Tolkien")
]

# Define our Genres
genres = [
  thriller = Genre.new("Thriller"),
  fantasy = Genre.new("Fantasy"),
  horror = Genre.new("Horror")
]

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
  Book.new("Lord of the Rings",fantasy,jrr_tolkien  ),
]


#########


puts " hello welcome to our \"Amazon\" online book Shop"
puts " whats your name? "
@username = User.new(gets.chomp)

def choice
  puts " Would you like a recommendation or you can purchase"
  puts " by Author or Genre"

  puts "1 for Recommendation"
  puts "2 to shop by Genre"
  puts "3 to shop by Author"
  puts "4 to list all books"

  input = gets.chomp
  recommendation(input)

end



def recommendation(input)
  puts "hey, whats your choice?"

  Book.all.each do |book|
    input == "genre" ? recommend_book(book, choice) : recommend_by_genre(book, choice)
  end
end
def recommend_book(book, choice)
    puts book.name if book.author.name == author_choice
end

def recommend_by_genre(book, choice)
    puts book.name if book.genre.name == genre_choice

end
