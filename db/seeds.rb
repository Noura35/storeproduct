# Clear existing data (optional)
Product.destroy_all
Subcategory.destroy_all
Category.destroy_all

# Creating Categories
men_category = Category.create!(name: "Men")
women_category = Category.create!(name: "Women")
kids_category = Category.create!(name: "Kids")

# Creating Subcategories for Men
shirts_subcategory = Subcategory.create!(name: "Shirts", category: men_category)
pants_subcategory = Subcategory.create!(name: "Pants", category: men_category)

# Creating Subcategories for Women
dresses_subcategory = Subcategory.create!(name: "Dresses", category: women_category)
skirts_subcategory = Subcategory.create!(name: "Skirts", category: women_category)

# Creating Subcategories for Kids
toys_subcategory = Subcategory.create!(name: "Toys", category: kids_category)
clothes_subcategory = Subcategory.create!(name: "Clothes", category: kids_category)

# Creating Products for Men
Product.create!(name: "Men's Formal Shirt", price: 50.00, description: "High-quality formal shirt.", subcategory: shirts_subcategory)
Product.create!(name: "Men's Casual Pants", price: 40.00, description: "Comfortable casual pants.", subcategory: pants_subcategory)

# Creating Products for Women
Product.create!(name: "Women's Summer Dress", price: 60.00, description: "Stylish summer dress.", subcategory: dresses_subcategory)
Product.create!(name: "Women's Skirt", price: 30.00, description: "Elegant skirt.", subcategory: skirts_subcategory)

# Creating Products for Kids
Product.create!(name: "Kids Toy Car", price: 20.00, description: "Fun toy car for kids.", subcategory: toys_subcategory)
Product.create!(name: "Kids T-shirt", price: 15.00, description: "Cool t-shirt for kids.", subcategory: clothes_subcategory)

puts "Seed data inserted successfully!"
