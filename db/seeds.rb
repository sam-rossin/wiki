35.times do |j|
  page = Page.create!(name: "Test#{j}") 
  2.times do |n|
    page.contents.create!(words: "This is test #{n}")
  end
  page.contents.create!(words: "This is my final form.")
end
