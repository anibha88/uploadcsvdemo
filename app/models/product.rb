class Product < ActiveRecord::Base
	require 'csv' #Making the Product model to accept csv and process it.

	def self.import(file) #Take the input parameter which is the csv file
		CSV.foreach(file.path, headers:true) do |row| #Iterate each record to get the row

			product_hash = row.to_hash #Convert row to hash
			product = Product.where(id: product_hash["id"]) #find out whether that product already exists 

			if product.count == 1
				product.first.update_attributes(product_hash.except("price")) #If that is already there, then update the attributes.
			#In the above line the product_hash.except("price") will prevent the price from
			#getting updated. When you want to prevent a specific attribute from getting updated
			#you can do this. Just add that attribute name inside the except method.
			#If you want all the attributes to get updated,then it would be something like
			#	 product.first.update_attributes(product_hash)
			else
				Product.create!(product_hash) #create the records if it doesnot already exists
			end
		end
	end
end
