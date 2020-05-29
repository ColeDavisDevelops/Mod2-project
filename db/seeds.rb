# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


Comment.destroy_all
User.destroy_all
Post.destroy_all
Subreddit.destroy_all
UserSubreddit.destroy_all
Favorite.destroy_all

u1 = User.create(name: "Josh", password: "123", bio: "Hi my name is josh", profile_img_url: "photo here")
u2 = User.create(name: "Ally", password: "123", bio: "Hi my name is Ally", profile_img_url: "photo here")
u3 = User.create(name: "Steve", password: "123", bio: "Hi my name is Steve", profile_img_url: "photo here")

sub1 = Subreddit.create(name:"Flatiron", description:"Learn to code", user_id: u1.id)
sub2 = Subreddit.create(name:"Crypto Kitties", description:"Trade, Sell, Discuss, and Appreciate your crypto pals", user_id: u1.id)
sub3 = Subreddit.create(name:"Memes", description:"Post em'", user_id: u1.id)

u_s1 = UserSubreddit.create(user_id: u1.id, subreddit_id: sub2.id)
u_s2 = UserSubreddit.create(user_id: u2.id, subreddit_id: sub2.id)
u_s3 = UserSubreddit.create(user_id: u3.id, subreddit_id: sub1.id)
u_s4 = UserSubreddit.create(user_id: u3.id, subreddit_id: sub3.id)
u_s5 = UserSubreddit.create(user_id: u1.id, subreddit_id: sub3.id)

p1 = Post.create(title: "Why crypto kitties will moon", content: "random random random random ", image_url: "https://picsum.photos/id/#{rand(1..300)}/200", reputation: 0, user_id: u1.id, subreddit_id: sub2.id)  
p2 = Post.create(title: "Litecoin is a scam", content: "Charlie lee hit a lick ", image_url: "https://picsum.photos/id/#{rand(1..300)}/200", reputation: 0, user_id: u2.id, subreddit_id: sub2.id)  
p3 = Post.create(title: "My time at Flatiron", content: "It was fun ", image_url: "https://picsum.photos/id/#{rand(1..300)}/200", reputation: 0, user_id: u3.id, subreddit_id: sub1.id)  
p4 = Post.create(title: "Why I like memes", content: "I have a good personality ", image_url: "https://picsum.photos/id/#{rand(1..300)}/200", reputation: 0, user_id: u3.id, subreddit_id: sub3.id)  

c1 = Comment.create(content: "This post is nice", reputation: 0, user_id: u1.id, post_id: p1.id)
c2 = Comment.create(content: "This post is bad", reputation: 0, user_id: u2.id, post_id: p2.id)
c3 = Comment.create(content: "This post is very outstanding", reputation: 0, user_id: u3.id, post_id: p3.id)
c4 = Comment.create(content: "This post is very very bad", reputation: 0, user_id: u3.id, post_id: p4.id)

# f1 = Favorite.create(post_id: p1.id, user_id: u1.id)
# f2 = Favorite.create(post_id: p2.id, user_id: u2.id)
# f3 = Favorite.create(post_id: p3.id, user_id: u3.id)
# f4 = Favorite.create(post_id: p3.id, user_id: u1.id)

    

30.times do
    
    # (2..6).to_a.sample.times do 
      user = User.create({
        name: Faker::Name.name,
        bio: Faker::Hipster.paragraph,
        password: 123,
        profile_img_url: "https://picsum.photos/id/#{rand(1..300)}/200"
   
      })
    # end
    
    subreddit = Subreddit.create({
        name: Faker::Hipster.sentence(word_count: 3),
        description: Faker::Hipster.sentence(word_count: 3),
        user_id: user.id
    })
    
  
    (2..6).to_a.sample.times do 

      Post.create({
        title: Faker::Hipster.sentence(word_count: 3),
        content: Faker::Hipster.paragraphs(number: 4),
        reputation: 0,
        user_id: user.id,
        subreddit_id:  subreddit.id,
        image_url: "https://picsum.photos/id/#{rand(1..300)}/200"

      })
    end

    
  end

