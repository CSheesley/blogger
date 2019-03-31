require 'rails_helper'

RSpec.describe Article, type: :feature do
  describe 'as a user visiting the articles index page' do
    describe 'should have a link that I can click on, which redirect me to a form for creating a new article' do
      it 'when filled out creates a new article' do

        visit articles_path

        click_link "Create a New Article"

        expect(current_path).to eq(new_article_path)
        fill_in "article[title]", with: "A New Article"
        fill_in "article[body]", with: "Newly created body text"
        click_on "Create Article"

        expect(page).to have_content("Article 'A New Article' Created!")

        article = Article.last

        expect(current_path).to eq(article_path(article))
        expect(page).to have_content("A New Article")
        expect(page).to have_content("Newly created body text")
      end
    end
  end
end
