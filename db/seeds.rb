# db/seeds.rb

# Create users
if User.count.zero?
  users = User.create([
    { name: "Alice" },
    { name: "Bob" },
    { name: "Charlie" },
    { name: "John" },
    { name: "Jane" },
    { name: "Sarah" },
    { name: "Mary" },
    { name: "Smith" },
    { name: "Katy" },
    { name: "Wanderlust" }
  ])
end

# Create profiles for users
if Profile.count.zero?
  users.each do |user|
    user.create_profile(bio: "Profile for #{user.name}")
  end
end

# Create categories
if Category.count.zero?
  categories = Category.create([
    { name: 'Technology' },
    { name: 'Travel' },
    { name: 'Science' },
    { name: 'Software' },
    { name: 'Movies' },
    { name: 'Marketing' },
    { name: 'History' },
    { name: 'Programming' },
    { name: 'Cooking' },
    { name: 'Chemistry' }
  ])
end

# Create posts associated with users and categories
if Post.count.zero?
  users.each do |user|
    3.times do |i|
      user.posts.create(
        title: "Post #{i + 1} by #{user.name}",
        content: "Content for post #{i + 1}"
      )
    end
  end
end

# Seed Categorizations (Assign Posts to Categories)
if Categorization.count.zero?
  categories = Category.all
  posts = Post.all
  posts.each do |post|
    post.categories << categories.sample(rand(1..2))
  end
end

# Create note associated with posts
if Comment.count.zero?
  posts.each do |post|
    2.times do
      post.comments.create(content: "Comment for post #{post.id}")
    end
  end
end

# Create relationships (follows)
if Relationship.count.zero?
  User.all.each_with_index do |user, index|
    following_users = User.all.reject { |u| u == user || u.followers.include?(user) }
    following_users.sample(rand(0..3)).each do |followed_user|
      user.follow(followed_user)
    end
  end
end

if Sti::Vehicle.count.zero?
  Sti::Car.create(make: "Toyota", model: "Camry", year: 2022, color: "Red")
  Sti::Truck.create(make: "Ford", model: "F-150", year: 2020, towing_capacity: "5000 lbs")
  Sti::Motorcycle.create(make: "Harley-Davidson", model: "Sportster", year: 2019, engine_size: "1200cc")
end

if DelegatedType::Entry.count.zero?
  5.times do |i|
    DelegatedType::Entry.create! entryable: DelegatedType::Message.new(subject: "Message #{i}", body: "Body #{i}")
  end

  5.times do |i|
    DelegatedType::Entry.create! entryable: DelegatedType::Note.new(content: "Content #{i}")
  end  
end