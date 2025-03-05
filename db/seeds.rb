# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end



# Suppression des anciennes catégories
#Category.delete_all

# Création des catégories principales
#men = Category.create(name: 'Men')
#women = Category.create(name: 'Women')
#kids = Category.create(name: 'Kids')

# Création des sous-catégories pour 'Men'
#shirts = Category.create(name: 'Shirts', parent_category: men)
#pants = Category.create(name: 'Pants', parent_category: men)
#shoes_women = Category.create(name: 'Shoes', parent_category: women)

# Création des sous-catégories pour 'Women'
#dresses = Category.create(name: 'Dresses', parent_category: women)
#skirts = Category.create(name: 'Skirts', parent_category: women)
#handbags = Category.create(name: 'Handbags', parent_category: women)

# Création des sous-catégories pour 'Kids'
#toys = Category.create(name: 'Toys', parent_category: kids)
#clothes = Category.create(name: 'Clothes', parent_category: kids)
#shoes_kids = Category.create(name: 'Shoes', parent_category: kids)

#puts "Categories and subcategories created successfully!"
