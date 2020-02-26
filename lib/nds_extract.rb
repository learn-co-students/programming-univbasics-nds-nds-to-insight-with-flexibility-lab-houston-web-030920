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
  
  
  row_index = 0 
  while row_index < movies_collection.count do 
    movies_collection[row_index][:director_name] = name
    row_index += 1 
  end 
  
  p movies_collection
  
  
end


def gross_per_studio(collection)
  # GOAL: Given an Array of Hashes where each Hash represents a movie,
  # return a Hash that includes the total worldwide_gross of all the movies from
  # each studio.
  #
  # INPUT:
  # * collection: Array of Hashes where each Hash where each Hash represents a movie
  #
  # RETURN:
  #
  # Hash whose keys are the studio names and whose values are the sum
  # total of all the worldwide_gross numbers for every movie in the input Hash
  
  
  hash = {}
  row_index = 0
  array_of_extracted_hashes = []
  keys_to_extract = [:studio, :worldwide_gross]
  
  while row_index < collection.count do
    array_of_extracted_hashes << collection[row_index].select {|key, _| keys_to_extract.include? key}
    
    row_index += 1 
  end 
  
  result = array_of_extracted_hashes.group_by {|h| h[:studio]}.values 
  result.map! {|first, *rest|
    if rest.empty?
      first 
    else
      first.dup.tap {|sum|
        rest.each {|h| sum[:worldwide_gross] += h[:worldwide_gross]}}
    end 
  }
  
  # while row_index < result.count do 
  #   new_key = result[row_index][:studio]
  #   new_value = result[row_index][:worldwide_gross]
    
  #   hash[new_key] = new_value
    
  #   row_index += 1
  # end 
  
  new_key = result[0][:studio]
  new_value = result[0][:worldwide_gross]
  new_key2 = result[1][:studio]
  new_value2 = result[1][:worldwide_gross]
  
  hash[new_key] = new_value
  hash[new_key2] = new_value2
  p hash
end

def movies_with_directors_set(source)
  # GOAL: For each director, find their :movies Array and stick it in a new Array
  #
  # INPUT:
  # * source: An Array of Hashes containing director information including
  # :name and :movies
  #
  # RETURN:
  #
  # Array of Arrays containing all of a director's movies. Each movie will need
  # to have a :director_name key added to it.
end

# ----------------    End of Your Code Region --------------------
# Don't edit the following code! Make the methods above work with this method
# call code. You'll have to "see-saw" to get this to work!

def studios_totals(nds)
  a_o_a_movies_with_director_names = movies_with_directors_set(nds)
  movies_with_director_names = flatten_a_o_a(a_o_a_movies_with_director_names)
  return gross_per_studio(movies_with_director_names)
end
