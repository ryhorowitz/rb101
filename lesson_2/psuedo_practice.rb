# a method that returns the sum of two integers
#- get two integers
#- define method that adds both integers and returns the sum

#
=begin
a method that takes an array of strings, and returns a string that is all those strings concatenated together
- array made of multiple strings  
- method takes array
- find kernel.method that concatenates indexes of an array
- define method
=end

array = ['string1', 'string2', 'string3']

def concat_strings(array)
  x = array.join
end

p concat_strings(array)