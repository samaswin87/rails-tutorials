require 'faker'
# Creating 1000 records for demo
(0...50).each do |number|
  Record.create(first_name: Faker::Name.unique.first_name, last_name: Faker::Name.unique.last_name, email: Faker::Internet.unique.email)
end
