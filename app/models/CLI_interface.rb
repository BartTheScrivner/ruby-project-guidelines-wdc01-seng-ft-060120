class Interface 
  attr_accessor :input, :current_user
  def welcome
  puts "*" * 20
  puts "Welcome to Pod-if-i"
  puts "*" * 20
  self.get_user
  custom_welcome
  self.menu_options
  end

  def goodbye
    puts "GOODBYE!"
  end

  def get_user
    puts "Enter user name: "
    user = gets.strip
    self.current_user = User.find_or_create_by(name: user)
  end

  def custom_welcome
    puts "Welcome, #{self.current_user.name}!"
  end


  def menu_options
    puts "\n"
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
    puts "\n"
    puts "Welcome to the Friends Menu. Select from the following or type 'menu' to get to main menu: "
    puts "1. Select Friend -- type 'select' "
    puts "2. See All Friends -- type 'all' "
    puts "3. See All Friends' Subscriptions -- type 'allsubs' "
    puts "4. Add New Friend -- type 'follow' "
    self.input = self.get_menu_selection
    self.friends_selection
  end

  def friends_selection
    while self.input != 'menu'
      if self.input == 'select'
        puts "Select a Friend: "
        self.input = self.get_menu_selection
        self.current_user.find_friend_by_name(self.input)
        self.friends_menu
      elsif self.input == 'all'
        self.current_user.show_friends
        self.friends_menu
      elsif self.input == 'allsubs'
        self.current_user.friends_list  
        self.friends_menu 
      elsif self.input == 'follow'
        self.input = self.get_menu_selection
        puts "...searching...\n"
        self.current_user.follow_person(self.input)
        self.friends_menu
      else
        puts "Improper selection. Please try again!"   
        self.friends_menu
      end
    end
  end


  def find_menu 
    puts "\n"
    puts "Welcome to the Find Menu. Select from the following or type 'menu' to get to main menu: "
    puts "1. Search Podcasts by Name -- type 'name' "
    puts "2. Search Podcasts by Length -- type 'length' "
    puts "3. See Most Popular Podcasts -- type 'popular' "
    puts "4. See Most Popular Podcast Among Friends -- type 'trending' "
    puts "5. Subscribe by Name -- type 'subscribe' "
    self.input = self.get_menu_selection
    self.find_options
  end

  def find_options
    while self.input != 'menu'
      if self.input == 'name'
        self.input = self.get_menu_selection
        puts "...searching..."
        self.current_user.search_podcasts(self.input)
        self.find_menu
      elsif self.input == 'length'
        puts "Select Length of Podcast in Minutes"
        self.input = self.get_menu_selection
        puts "...searching..."
        self.current_user.search_by_length(self.input)
        self.find_menu
      elsif self.input == 'popular'
        puts "\n"
        puts Podcast.most_popular_overall
        self.find_menu
      elsif self.input == 'trending'
        puts "\n"
        self.current_user.most_popular_among_friends
        self.find_menu
      elsif self.input == 'subscribe'
        self.input = self.get_menu_selection
        self.current_user.subscribe_by_name(self.input)
        self.find_menu
      else
        puts "Improper selection. Please try again!"
        self.find_menu
      end
    end
  end

  def run
    self.welcome
    # binding.pry
    while self.input != 'quit'
      if self.input == 'subs'
        self.current_user.print_subs
        menu_options
      elsif self.input == 'friends'
        self.friends_menu
        menu_options
      elsif self.input == 'find'
       self.find_menu
        menu_options
      else
        puts "Improper selection. Please try again."
        menu_options
      end
    end 
    self.goodbye
  end

end