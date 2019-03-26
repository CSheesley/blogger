require 'rails_helper'

RSpec.describe Article, type: :feature do
  describe "as a user" do
    describe "when I visit and article show page" do
      it 'displays the information of that article' do

        article = Article.create(title: "Test Article", body: "Hopefulyy this works!")

        visit articles_path

        click_link("Test Article")

        expect(current_path).to eq(article_path(article))
        expect(page).to have_content(article.title)
        expect(page).to have_content(article.body)
      end
    end
  end
end
