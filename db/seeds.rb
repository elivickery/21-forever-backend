require 'faker'

User.destroy_all
Category.destroy_all
Goal.destroy_all

# categories seed data
environment_seed_file = File.join(Rails.root, 'db', 'seeds', "#{Rails.env}.rb")

def seed_image(file_name)
  File.join(Rails.root, "/app/assets/images/seed/#{file_name}.png")
end

categories = ["Health", "Productivity", "Finances", "Personal Growth", "Fitness"]

categories.each do |category|
  Category.create({ title: category,
                    badge_url: seed_image(category.downcase)})
end

# users seed data
10.times do
  username = Faker::Internet.user_name
  User.create({ username: username,
                email: Faker::Internet.free_email(username),
                password_digest: "password"})
end

#goals seed data
users = User.all
categories = Category.all

20.times do 
  Goal.create({ title: Faker::Hipster.sentence,
                completed: [true, false].sample,
                archived: [true, false].sample,
                category: categories.sample,
                user: users.sample})
end