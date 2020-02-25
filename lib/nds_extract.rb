# Provided, don't edit
require 'directors_database'
require 'pp'
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
#HJDSFAHJDLKGALKSDJGLKSADFJG WHAT IS THE FUCKIGN POINT OF THE CODE ABOVE ^^^ IF ITS THIS FUCKING SIMPLE
#THIS LITERALLY WASTED 30MIN OF MY FUCKING TIME TRYING TO FUCKING INTERPRET THESE INSTRUCTIONS
  movies_collection.each do |movie|
    movie[:director_name] = name
  end
end


def gross_per_studio(collection)
  pp collection
  result = {}

  collection.each do |movie|
    total = 0
    collection.each do |studio|
      if movie[:studio] == studio[:studio]
        total += studio[:worldwide_gross]
      end
    end
    result [movie[:studio]] = total
  end
  pp result
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
  result = []
  pp source
  source.each do |director|
    director[:movies].each do |movie|
      movie[:director_name] = director[:name]
    end
    result << director[:movies]
  end

  result

end

# ----------------    End of Your Code Region --------------------
# Don't edit the following code! Make the methods above work with this method
# call code. You'll have to "see-saw" to get this to work!

def studios_totals(nds)
  a_o_a_movies_with_director_names = movies_with_directors_set(nds)
  movies_with_director_names = flatten_a_o_a(a_o_a_movies_with_director_names)
  return gross_per_studio(movies_with_director_names)
end
