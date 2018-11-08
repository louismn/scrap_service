class StartScrap

require 'nokogiri'
require 'open-uri'


	def initialize
	  @array = []
	  webpage = Nokogiri::HTML(open("https://coinmarketcap.com/all/views/all/"))
		  webpage.css('tbody>tr').each do |row|
		    hash = {}
		    hash['Currency'] = row.css('.currency-name')[0]['data-sort']
		    hash['Price'] = row.css('.text-right')[1]['data-sort']
		    @array << hash
		  end
	  @array
	end

	def perform 
		puts get_cryptos
	end



def save
	  @array.each do |currency|
         Cryptodb.create(name: currency["Currency"], price: currency["Price"])
       end

	end	

end