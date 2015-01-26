Page.create!(name: "Test Page")

page = Page.first

page.contents.create!(words: "This is a test. Really a test.")