User.destroy_all
Podcast.destroy_all
Subscription.destroy_all

kosi = User.create(name: "Kosi")
dave = User.create(name: "Dave")
bob = User.create(name: "Bob") 
linda = User.create(name: "Linda")
gene = User.create(name: "Gene")
louise = User.create(name: "Louise")
tina = User.create(name: "Tina")

allthings = Podcast.create(name: "All Things Considered", episode_length_in_minutes: 60)
hdtgm = Podcast.create(name: "How Did This Get Made", episode_length_in_minutes: 60)
harmon = Podcast.create(name: "Harmontown", episode_length_in_minutes: 120)
clh = Podcast.create(name: "Command Line Heroes", episode_length_in_minutes: 30)
mfm = Podcast.create(name: "My Favorite Murder", episode_length_in_minutes: 60)
replyall = Podcast.create(name: "Reply All", episode_length_in_minutes: 60)
tal = Podcast.create(name: "This American Life", episode_length_in_minutes: 60)
invisibilia = Podcast.create(name: "Invisibilia", episode_length_in_minutes: 60)
cth = Podcast.create(name: "Chapo Trap House", episode_length_in_minutes: 60)

dave_hdtgm = Subscription.create(user_id: dave.id, podcast_id: hdtgm.id, rating: 4)
kosi_allthings = Subscription.create(user_id: kosi.id, podcast_id: allthings.id, rating: 5)
bob_harmon = Subscription.create(user_id: bob.id, podcast_id: harmon.id, rating: 4)
linda_clh = Subscription.create(user_id: linda.id, podcast_id: clh.id, rating: 5)
gene_mfm = Subscription.create(user_id: gene.id, podcast_id: mfm.id, rating: 4)
louise_replyall = Subscription.create(user_id: louise.id, podcast_id: replyall.id, rating: 5)
tina_tal = Subscription.create(user_id: tina.id, podcast_id: tal.id, rating: 5)