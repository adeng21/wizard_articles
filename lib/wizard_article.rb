require 'csv'
require 'pry'
class WizardArticle

  attr_reader :author, :title, :article

  def initialize(title, author, article)
    @title = title
    @author = author
    @article = article
  end

  def to_csv_array(csv)
    CSV.open(csv, 'a') do |line|
      line << [@title, @author, @article]
    end
  end

  class << self

    def get_articles_from_csv(csv)
      articles = []
      CSV.foreach(csv) do |row|
        articles << WizardArticle.new(row[0], row[1], row[2])
      end
      articles
    end

    def find_by_title(title, array)
      article_contents = []

      array.each do |row|
        if row.title == title
          article_contents.push(row.title, row.author, row.article)
        end
      end
      article_contents
    end

  end
end

