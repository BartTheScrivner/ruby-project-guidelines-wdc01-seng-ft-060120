class User < ActiveRecord::Base 
 has_many :followed_users, foreign_key: :followee_id, class_name: 'Follow'
 has_many :followers, through: :followed_users
 has_many :following, foreign_key: :follower_id, class_name: 'Follow'
 has_many :followees, through: :following 
 has_many :subscriptions
 has_many :podcasts, through: :subscriptions

 def search_podcasts(podcast_name)
  podcast = Podcast.where('lower(name) = ?', podcast_name.downcase).first
  if podcast == nil
    puts "Sorry we can't find that one."
  else
    podcast
  end
 end

 def subscribe_by_name(podcast_name)
  podcast = search_podcasts(podcast_name)
  if !podcast.nil?
    Subscription.create(user_id: self.id, podcast_id: podcast.id)
  end
 end

 def search_by_length(length_in_minutes)
  Podcast.where(episode_length_in_minutes: length_in_minutes)
 end

 def update_rating(podcast_name, rating)
    podcast_id = search_podcasts(podcast_name).id
    #binding.pry
   unrated_podcast = Subscription.find_or_create_by(user_id: self.id, podcast_id: podcast_id)
   unrated_podcast.rating = rating  
   unrated_podcast.save
 end

 def find_friend_by_name(name)
    friend = self.followees.find {|followee| followee.name == name}
    pp friend.podcasts
 end

 def follow_person(name)
    friend2 = User.where('lower(name)=?', name.downcase).first
    binding.pry
        Follow.create(follower_id: self.id, followee_id: friend2.id)
 end

 def show_friends
  self.followees.map{|followee| followee.name}
 end

 def friends_list ##TODO format list
  self.followees.map {|followee| pp followee.podcasts}
 end


end