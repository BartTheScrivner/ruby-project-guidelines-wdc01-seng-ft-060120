class User < ActiveRecord::Base 
 has_many :subscriptions
 has_many :podcasts, through: :subscriptions

 def search_podcasts(podcast_name)
  podcast = Podcast.find_by(name: podcast_name)
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


end