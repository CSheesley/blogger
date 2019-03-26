require "rails_helper"

RSpec.describe Article, type: :feature do
  describe "as a user" do
    describe "when I visit /articles" do
      it "displays all articles" do

        article_1 = Article.create!(title: "Title 1", body: "Body 1")
        article_2 = Article.create!(title: "Title 2", body: "Body 2")

        visit articles_path

        expect(page).to have_content(article_1.title)
        expect(page).to have_content(article_2.title)
        expect(page).to have_content(article_1.body)
        expect(page).to have_content(article_2.body)
      end
    end
  end
end
