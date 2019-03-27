require 'rails_helper'

RSpec.describe Article, type: :feature do
  describe "as a user" do
    context "when I visit and article show page" do
      it 'displays the information of that article' do

        article = Article.create(title: "Test Article", body: "Hopefulyy this works!")

        visit articles_path

        click_link("Test Article")

        expect(current_path).to eq(article_path(article))
        expect(page).to have_content(article.title)
        expect(page).to have_content(article.body)
      end

    context 'when I click on the delete button'
      it 'should return me to the home page where this books info no longer exists' do

        article_1 = Article.create(title: "Test Article", body: "Hopefulyy this works!")
        article_2 = Article.create(title: "Title 2", body: "Body 2")

        visit article_path(article_1)

        click_on "Delete"

        expect(current_path).to eq(articles_path)
        expect(page).not_to have_content(article_1.title)
        expect(page).to have_content(article_2.title)
      end
    end
  end
end
