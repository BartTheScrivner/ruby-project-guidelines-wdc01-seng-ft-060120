class User < ActiveRecord::Base 
 has_many :followed_users, foreign_key: :followee_id, class_name: 'Follow'
 has_many :followers, through: :followed_users
 has_many :following, foreign_key: :follower_id, class_name: 'Follow'
 has_many :followees, through: :following 
 has_many :subscriptions
 has_many :podcasts, through: :subscriptions

 def see_user_rating(podcast)
  sub = Subscription.all.find{|sub| sub.podcast_id == podcast.id && sub.user_id == self.id}
  sub.rating
 end

 def print_subs
  puts "*" * 20
  self.podcasts.each do |podcast|
    puts "#{podcast.name}  || Your Rating: #{self.see_user_rating(podcast)}" 
    puts "*" * 20
  end
end

 def search_podcasts(podcast_name)
  podcast = Podcast.where('lower(name) = ?', podcast_name.downcase).first
  if podcast == nil
    puts "Sorry we can't find that one."
  else
    self.print_podcast_details(podcast)
    podcast
  end
 end

 def print_podcast_details(podcast)
  puts "\n"
  puts "#{podcast.name}"
  puts "-" * 20
  puts "Avg. Episode Length: #{podcast.episode_length_in_minutes} min."
  puts "Avg. Rating: #{podcast.average_rating}"
  puts "Number of Listeners: #{podcast.number_of_listeners}"
 end

 def subscribe_by_name(podcast_name)
  podcast = search_podcasts(podcast_name)
  if !podcast.nil?
    Subscription.find_or_create_by(user_id: self.id, podcast_id: podcast.id)
  end
 end

 def search_by_length(length_in_minutes)
  arr_of_pod = Podcast.where(episode_length_in_minutes: length_in_minutes)
  arr_of_pod.each do |podcast|
    self.print_podcast_details(podcast)
  end
 end

 def update_rating(podcast_name, rating)
    podcast_id = search_podcasts(podcast_name).id
    unrated_podcast = Subscription.find_or_create_by(user_id: self.id, podcast_id: podcast_id)
    unrated_podcast.rating = rating  
    unrated_podcast.save
 end

 def find_friend_by_name(name)
  puts "...searching...\n"
  puts "*" * 20
    friend = self.followees.find {|followee| followee.name.downcase == name}
    if friend == nil
      puts "Sorry, you're not friends with #{name.capitalize} yet. Try using 'follow'... "
    else
      puts "#{friend.name}: "
      puts "-" * 20 
      friend.podcasts.map {|podcast| podcast.name}.each do |podcast_name|
        puts podcast_name
      end
      puts "*" * 20
    end
 end

 def follow_person(name) 
    friend = User.where('lower(name)=?', name.downcase).first
    if friend == nil
      puts "Sorry, looks like #{name.capitalize} isn't using Pod-if-i yet."
    else
      Follow.find_or_create_by(follower_id: self.id, followee_id: friend.id)
      self.reload
      puts "You are now following #{friend.name}"
    end
 end

 def show_friends
  puts "*" * 20
  self.followees.map{|followee| followee.name}.each do |followee_name|
    puts followee_name
    puts "*" * 20
  end
 end

 def most_popular_among_friends
  podcasts = self.followees.map do |followee|
    followee.podcasts
  end
  most_popular = podcasts.flatten.max_by{|podcast| podcasts.flatten.count(podcast)}
  puts "\n"
  puts "#{most_popular.name}"
  puts "-" * 20
  puts "Rating: #{most_popular.average_rating}"
  puts "Listeners: #{most_popular.number_of_listeners}"
 end

 def friends_list 
  puts "*" * 20
  self.followees.map do |followee|
    puts "#{followee.name}: " 
    puts "-" * 20
    followee.podcasts.map {|podcast| podcast.name}.each do |podcast_name|
      puts podcast_name
    end
    puts "*" * 20
  end
 end


end