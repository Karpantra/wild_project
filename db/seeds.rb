require 'open-uri'
require 'nokogiri'


html_file = open("http://lieuxatypiques.com/properties-search-results-2/?sort=newest&search_city=&search_lat=&search_lng=&search_type=24&search_min_area=&search_max_area=&search_bedrooms=&search_bathrooms=")
# p html_file
html_doc = Nokogiri::HTML(html_file)

products = []

html_doc.search('a .img').each do |element|
  user = User.new(name: Faker::Name.first_name, email: Faker::Internet.email, password: "123456")
  user.save!
  product = Product.new(address: Faker::Address.street_address, city: Faker::Address.city, description: Faker::Lorem.sentence)
  product.user = user
  product.seed_picture = element.attr("style").split("(")[1].split(")")[0]
  products << product
end

html_doc.search("a h2").each_with_index do |element, index|
  products[index].title = element.text
  products[index].save!
end
