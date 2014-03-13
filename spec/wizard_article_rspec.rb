require 'rspec'
require_relative '../lib/wizard_article'

describe WizardArticle do

  let(:wizard_article) {WizardArticle.new("Harry Potter Arrives in Hogwart", "JK Rowling", "Harry Potter — Diagon Alley to create thousands of jobs like magic")}

  it 'has a title' do
    expect(wizard_article.title).to eq("Harry Potter Arrives in Hogwart")
  end

  it 'has an article' do
    expect(wizard_article.article).to eq("Harry Potter — Diagon Alley to create thousands of jobs like magic")
  end

  it 'has an author' do
    expect(wizard_article.author).to eq("JK Rowling")
  end

end
