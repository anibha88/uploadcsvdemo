class ProductsController < ApplicationController
  def index
  	@products = Product.all
  end

#import function which takes in csv file as the input parameter
  def import
  	begin #This might fail if input is incorrect. So put it in the begin block
  		Product.import(params[:file]) #Refer to the import method defined in the product model
  		redirect_to root_url, notice: "Products imported successfully" #Give a success flash message if import is successful.
    rescue #Catch the failure here by displaying the suitable error message.
    	redirect_to root_url, notice: "Please upload valid csv" #Give a failure message if import is unsuccessful
  	end
  end
end
