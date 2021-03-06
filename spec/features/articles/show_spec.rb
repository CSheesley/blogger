require 'rails_helper'

RSpec.describe Article, type: :feature do
  describe "as a user" do
    context "when I visit and article show page" do
      it 'displays the information of that article' do

        article = Article.create(title: "Test Article", body: "Hopefully this works!")

        visit articles_path

        click_link("Test Article")

        expect(current_path).to eq(article_path(article))
        expect(page).to have_content(article.title)
        expect(page).to have_content(article.body)
      end
    end

    context 'when I click on the delete button' do
      it 'should return me to the home page where this books info no longer exists' do

        article_1 = Article.create(title: "Test Article", body: "Hopefully this works!")
        article_2 = Article.create(title: "Title 2", body: "Body 2")

        visit article_path(article_1)

        click_on "Delete"

        expect(page).to have_content("Article 'Test Article' Deleted!")

        expect(current_path).to eq(articles_path)
        expect(page).to have_content(article_2.title)
      end
    end

    context 'when I click on the edit button' do
      it 'should direct me to a form to enter different information, which should show as updated after I hit submit' do

        article = Article.create(title: "Test Article", body: "Hopefully this works!")

        visit article_path(article)

        click_on "Edit"

        expect(current_path).to eq(edit_article_path(article))
        fill_in "article[title]", with: "An Updated Title"
        fill_in "article[body]", with: "An updated body of text"

        click_on "Update Article"

        expect(page).to have_content("Article 'An Updated Title' Updated!")

        expect(current_path).to eq(article_path(article))

        expect(page).to have_content("An Updated Title")
        expect(page).to have_content("An updated body of text")
      end
    end
  end
end
