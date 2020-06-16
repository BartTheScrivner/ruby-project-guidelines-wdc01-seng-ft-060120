User.destroy_all
Podcast.destroy_all
Subscription.destroy_all

kosi = User.create(name: "Kosi")
dave = User.create(name: "Dave")
bob = User.create(name: "Bob") 
linda = User.create(name: "Linda")
gene = User.create(name: "Gene")
loise = User.create(name: "Louise")
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

dave_hdtgm = Subscription.create(user: dave, podcast: hdtgm, rating: 4)
kosi_allthings = Subscription.create(user: kosi, podcast: allthings, rating: 5)
bob_harmon = Subscription.create(user: bob, podcast: harmon, rating: 4)
linda_clh = Subscription.create(user: linda, podcast: clh, rating: 5)
gene_mfm = Subscription.create(user: gene, podcast: mfm, rating: 4)
louise_replyall = Subscription.create(user: louise, podcast: replyall, rating: 5)
tina_tal = Subscription.create(user: tina, podcast: tal, rating: 5)