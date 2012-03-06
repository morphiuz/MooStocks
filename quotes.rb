# quotes.rb
require 'sinatra'
require 'open-uri'
require 'csv'

#class
class Stock
  def initialize(symbol)
    @symbol = symbol.upcase
    get_info
  end
  attr_reader :row0, :row1, :row2, :row3, :row4, :row6, :row7
  private
    #Get info about specific stock
    def get_info
      url = "http://download.finance.yahoo.com/d/quotes.csv?s=#{@symbol}&f=sl1d1t1c1ohgv&e=.csv"
      csv = CSV.prase(open(url).read)
      #parse csv data
      csv.each do |row|
        @row0 = row[0]
        @row1 = row[1]
        @row2 = row[2]
        @row3 = row[3]
        @row4 = row[4]
        @row5 = row[5]
        @row6 = row[6]
        @row7 = row[7]
        end
      end
end

#get new Stock Symbol
get '/' do
  erb :new
end

#Display stock details
get '/show' do
  @stock = Stock.new(params[:symbol])
  erb :show
end
