class Interface 
  attr_accessor :input, :current_user
  def welcome
  puts "*" * 20
  puts "Welcome to Pod-if-i"
  self.get_user
  self.menu_options
  end

  def goodbye
    puts "GOODBYE!"
  end

  def get_user
    puts "Enter user name: "
    user = gets.chomp()
    self.current_user = User.find_or_create_by(name: user)
  end

  def custom_welcome
    puts "Welcome, #{self.current_user.name}!"
  end


  def menu_options
    custom_welcome
    puts "Please select from the following or type 'quit' to exit:"
    puts "1. My Subscriptions -- type 'subs' "
    puts "2. My Friends -- type 'friends' "
    puts "3. Find Podcasts -- 'find' "
    self.input = self.get_menu_selection
  end

  def get_menu_selection
    selection = gets.chomp()
    selection.downcase 
  end

  def friends_menu
    puts "Welcome to the Friends Menu. Select from the following or type 'menu' to get to main menu: "
    puts "1. Select Friend -- type 'select' "
    puts "2. See All Friends -- type 'all' "
    puts "3. See All Friends' Subscriptions -- type 'allsubs' "
    self.input = self.get_menu_selection
  end

  def find_menu 
    puts "Welcome to the Find Menu. Select from the following or type 'menu' to get to main menu: "
    puts "1. Search Podcasts by Name -- type 'name' "
    puts "2. Search Podcasts by Length -- type 'length' "
    puts "3. See Most Popular Podcasts -- type 'popular' "
    self.input = self.get_menu_selection
  end

  def run
    self.welcome
    # binding.pry
    while self.input != 'quit'
      if self.input == 'subs'
        puts 'selected subs menu'
        menu_options
      elsif self.input == 'friends'
        puts 'selected friends menu'
        menu_options
      elsif self.input == 'find'
        puts 'selected find menu'
        menu_options
      else
        puts "Improper selection. Please try again."
        menu_options
      end
    end 
    self.goodbye
  end

end