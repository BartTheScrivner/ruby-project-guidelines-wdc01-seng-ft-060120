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
    puts self.all.group_by{|podcast| podcast.average_rating}.max
  end

end