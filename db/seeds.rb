puts 'Creating events'

unless Event.any?
  Event.create!(title: 'Rubyconf talk', description: 'Talk about immutability on Ruby', start_at: DateTime.new(2016, 3, 20, 8, 0, 0))
  Event.create!(title: 'JS conf talk', description: 'Talk about JS 2015', start_at: DateTime.new(2016, 3, 21, 8, 0, 0))
  Event.create!(title: 'Hackaton', description: 'Some random hackaton', start_at: DateTime.new(2016, 3, 30, 8, 0, 0))
  Event.create!(title: 'Meetup', description: 'Some random meetup', start_at: DateTime.new(2016, 4, 20, 8, 0, 0))
end
