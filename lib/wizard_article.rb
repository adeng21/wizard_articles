class WizardArticle

  attr_accessor :title, :article
  attr_reader :author

  def initialize(title, author, article)
    @title = title
    @author = author
    @article = article
  end

  def to_csv_array
    [@title, @author, @article]

  end
end
