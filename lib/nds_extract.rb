# Provided, don't edit
require 'directors_database'
require 'pry'
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
  #Changes an individual movie hash by adding a directors name as a key. 
  # Takes one movie hash and takes directors name 
end


# Your code after this point

def movies_with_director_key(name, movies_collection)
  
new_array = []

 counter = 0 
 while counter < movies_collection.length do 
   array_info = movie_with_director_name(name, movies_collection[counter])
   new_array << array_info
counter += 1
end
return new_array
end
# Array of movie hashes for one director, where each hash has the director_name key added to it. 
# 

def gross_per_studio(collection)
  new_hash = {}
  counter = 0 
  while counter < collection.length do 
  studio_name = collection[counter][:studio]
  ww_gross = collection[counter][:worldwide_gross]
  if !new_hash[studio_name]
    new_hash[studio_name] = ww_gross
  else 
    new_hash[studio_name] += ww_gross
  end 
  counter += 1 
end
return new_hash
end

def movies_with_directors_set(source)
 
newer_array = []
counter = 0 
while counter < source.length do 

newer_array << movies_with_director_key(source[counter][:name], source[counter][:movies])
# binding.pry
counter += 1 
end
return newer_array
end
# We want to call the movies_with_director_key for each director, rather than just one. And then return an array of each directors movies arrays. 
# We want the movies_with_director_key new_array to be pushed into a newer array, and be done for each director and their movies. 




# ----------------    End of Your Code Region --------------------
# Don't edit the following code! Make the methods above work with this method
# call code. You'll have to "see-saw" to get this to work!

def studios_totals(nds)
  a_o_a_movies_with_director_names = movies_with_directors_set(nds)
  movies_with_director_names = flatten_a_o_a(a_o_a_movies_with_director_names)
  return gross_per_studio(movies_with_director_names)
end
