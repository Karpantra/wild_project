# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'open-uri'
require 'nokogiri'


html_file = open("http://www.louerunlieu.com/tous-les-lieux")
html_doc = Nokogiri::HTML(html_file)

products = []

#images
html_doc.search('.wp2imgpreloader').each do |element|
  title = element.text
end

#titles
html_doc.search("").each do |element|
  image = element.text
end
