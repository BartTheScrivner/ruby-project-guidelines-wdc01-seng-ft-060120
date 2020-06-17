class Podcast < ActiveRecord::Base 
  has_many :subscriptions
  has_many :users, through: :subscriptions

  

  def average_rating
    ratings = self.subscriptions.map {|sub| sub.rating}
    if ratings.compact.count == 0
      puts "#{self.name} hasn't been rated yet."
      return 0
    else
      ratings.compact.sum/ratings.compact.count
    end
  end

  def self.most_popular_overall
    arr_pod = self.all.group_by{|podcast| podcast.average_rating}.max
    print_results(arr_pod)
  end

  def number_of_listeners
    self.subscriptions.count
  end

   def print_results(arr_pod)
    arr_pod.each do |podcast|
      puts "#{podcast.name}."
      puts "-" * 20
      puts "Rating: #{podcast.average_rating}."
      puts "Number of Listeners: #{podcast.number_of_listeners}."
    end
   end



end