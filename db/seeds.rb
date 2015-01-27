page = Page.create!(name: "Test Page") 

5.times do |n|
    page.contents.create!(words: "This is test #{n}")
end

page.contents.create!(words: "This is my final form.")