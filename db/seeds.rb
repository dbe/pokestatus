# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

now = DateTime.now
r = Random.new

#Status.create!(:status => "down", :time => now)
#Status.create!(:status => "intermittent", :time => now - 22.hours)
#Status.create!(:status => "up", :time => now - 36.hours)
#Status.create!(:status => "down", :time => now - 48.hours)

100.times do |i|
  Report.create!(:status => r.rand(0..2), :time => now - r.rand(86400).seconds)
end
