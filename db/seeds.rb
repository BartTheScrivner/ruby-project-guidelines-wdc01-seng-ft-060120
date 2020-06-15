User.destroy_all
Podcast.destroy_all
Subscription.destroy_all

kosi = User.create(name: "Kosi")
dave = User.create(name: "Dave")

allthings = Podcast.create(name: "All Things Considered", episode_length_in_minutes: 60)
hdtgm = Podcast.create(name: "How Did This Get Made", episode_length_in_minutes: 60)

dave_hdtgm = Subscription.create(user: dave, podcast: hdtgm, rating: 4)
kosi_allthings = Subscription.create(user: kosi, podcast: allthings, rating: 5)