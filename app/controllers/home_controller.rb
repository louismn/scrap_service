class HomeController < ApplicationController
  

  def index
  	if Cryptodb.first == nil
  	StartScrap.new.save
  end
  	@crypto = Cryptodb.new

  end

  def show
	@crypto_id = Cryptodb.find(params[:cryptodb][:id].to_f)
  end

end
