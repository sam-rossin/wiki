50.times do |j|
  name = Faker::App.name
  page = Page.create!(name: name + j.to_s) 
  3.times do |n|
    page.contents.create!(words: Faker::Lorem.paragraph)
  end
  page.contents.create!(words: Faker::Lorem.paragraph(10))
end
