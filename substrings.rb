def substrings(text, dictionary)
  result = Hash.new(0)  # Initialize a hash with a default value of 0
  text.downcase!        # Convert text to lowercase

  dictionary.each do |word|
    matches = text.scan(word).length  # Count how many times the word appears in the text
    result[word] += matches if matches > 0
  end

  result
end

# Example usage can change below, to test manually or run the tests with rspec.
dictionary = ["below","go","go","go","go","go","go","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]
puts substrings("below", dictionary)
puts substrings("Howdy partner, sit down! How's it going?", dictionary)
