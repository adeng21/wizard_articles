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

  CSV.open('articles.csv', 'a') do |csv|
    # values = @new_article.instance_variables.map{|variable| @new_article.instance_variable_get(variable)}
    csv << @new_article.to_csv_array
  end

  redirect '/'
end


get '/article-summary' do
  @articles_csv = []

#put these in own class
  CSV.foreach('articles.csv') do |row|
    @articles_csv << row[0]
  end

  erb :index_summary
end

get '/:article_title' do

  @article_title = params["article_title"]
  #how come params["article body"] doesn't work here

  @author = ""
  @body = ""
  CSV.foreach('articles.csv') do |row|
    if row[0]== @article_title
      @body += row[2]
      @author += row[1]
    end
  end

  erb :index_title

end
