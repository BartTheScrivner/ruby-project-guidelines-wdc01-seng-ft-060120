require_relative '../config/environment.rb'

describe User do 
    jennifer = User.create(name: "Jennifer") 
    hmay = Podcast.create(name: "How Married Are You", episode_length_in_minutes: 60)
    jennifer_hmay = Subscription.create(user_id: jennifer.id, podcast_id: hmay.id, rating: 4)

    it 'has a name' do 
        expect(jennifer.name).to eq("Jennifer")
    end

    it "can subscribe to and rate a podcast" do 
        expect(jennifer.podcasts).to include(hmay)
    end

    it "can update a rating" do
        jennifer.update_rating("How Married Are You", 5)
        jennifer_hmay.reload
        expect(jennifer.see_user_rating(hmay)).to eql(5)
 
    end
end


    
