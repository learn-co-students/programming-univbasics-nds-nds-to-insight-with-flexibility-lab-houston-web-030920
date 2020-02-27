
# Provided, don't edit
require 'directors_database'
# A method we're giving you. This "flattens"  Arrays of Arrays so: [[1,2],
# [3,4,5], [6]] => [1,2,3,4,5,6].
def flatten_a_o_a(aoa)
  result = []
  i = 0
  while i < aoa.length do
    k = 0
    while k < aoa[i].length do
      result << aoa[i][k]
      k += 1
    end
    i += 1
  end
  result
end
def movie_with_director_name(director_name, movie_data)
  { 
    :title => movie_data[:title],
    :worldwide_gross => movie_data[:worldwide_gross],
    :release_year => movie_data[:release_year],
    :studio => movie_data[:studio],
    :director_name => director_name
  }
end
# Your code after this point
def movies_with_director_key(name, movies_collection)
  # GOAL: For each Hash in an Array (movies_collection), provide a collection
  # of movies and a directors name to the movie_with_director_name method
  # and accumulate the returned Array of movies into a new Array that's
  # returned by this method.
  #
  # INPUT:
  # * name: A director's name
  # * movies_collection: An Array of Hashes where each Hash represents a movie
  #
  # RETURN:
  #
  # Array of Hashes where each Hash represents a movie; however, they should all have a
  # :director_name key. This addition can be done by using the provided
  # movie_with_director_name method

  movies =[]
  index =0
  while index < movies_collection.length do
    movie = movies_collection[index]
    movies << movie_with_director_name(name, movie)
    index +=1
  end

   movies

end

 def gross_per_studio(collection)
  #
  # Hash whose keys are the studio names and whose values are the sum
  # total of all the worldwide_gross numbers for every movie in the input Hash

   total ={}
   index = 0

   while index < collection.length do
    current_studio_name = collection[index][:studio]
    current_studio_gross = collection[index][:worldwide_gross]
    #binding.pry
    if total[current_studio_name]
      total[current_studio_name] += current_studio_gross
    else
      total[current_studio_name]
      total[current_studio_name] = current_studio_gross
    end
    index += 1

  end
  total

end

def movies_with_directors_set(source)
  #
  # Array of Arrays containing all of a director's movies. Each movie will need
  # to have a :director_name key added to it.

  movie =[]
  index =0
  while index <source.length do

    director_name = source[index][:name]
    movizz= source[index][:movies]
    movie << movies_with_director_key(director_name,movizz) 
    index +=1
  end
  movie
end

# ----------------    End of Your Code Region --------------------
def studios_totals(nds)
  a_o_a_movies_with_director_names = movies_with_directors_set(nds)
  movies_with_director_names = flatten_a_o_a(a_o_a_movies_with_director_names)
  return gross_per_studio(movies_with_director_names)


end