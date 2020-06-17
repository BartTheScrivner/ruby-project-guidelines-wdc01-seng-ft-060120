def welcome
puts "Welcome Pod-if-i"
end

def menu_options
  puts "Select from the following:"
  puts "1. My Subscriptions -- type 'subs' "
  puts "2. My Friends -- type 'friends' "
  puts "3. Find Podcasts -- 'find' "
end

def get_menu_selection
  selection = gets.chomp()
  selection.downcase 
end
