def welcome
puts "Welcome to Pod-if-i"
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

def friends_menu
  puts "Welcome to the Friends Menu. Select from the following: "
  puts "1. Select Friend -- type 'select' "
  puts "2. See All Friends -- type 'all' "
  puts "3. See All Friends' Subscriptions -- type 'allsubs' "
end

def find_menu 
  puts "Welcome to the Find Menu. Select from the following: "
  puts "1. Search Podcasts by Name -- type 'name' "
  puts "2. Search Podcasts by Length -- type 'length' "
  puts "3. See Most Popular Podcasts -- type 'popular' "
end