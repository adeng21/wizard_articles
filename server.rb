require 'sinatra'
require 'shotgun'
require 'pry'
require 'CSV'

require_relative 'lib/wizard_article'


get '/' do
  erb :index
end

post '/create-article' do

  @new_article = WizardArticle.new(params["article_title"], params["article_author"], params["article_body"])

  @new_article.to_csv_array('articles.csv')

  redirect '/'
end


get '/article-summary' do
  @articles_csv = WizardArticle.get_articles_from_csv('articles.csv')

  erb :index_summary
end

get '/:article_title' do

  articles = WizardArticle.get_articles_from_csv('articles.csv')

  @article_contents = WizardArticle.find_by_title(params["article_title"], articles)

  erb :index_title

end
