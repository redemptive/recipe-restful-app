class Recipe

	attr_accessor :id, :name, :ingredients, :method, :cuisine, :portions, :image

	def save

		conn = Recipe.open_connection

		if(!self.id)
			sql = "INSERT INTO recipes (name, ingredients, method, cuisine, portions) VALUES ('#{self.name}', '#{self.ingredients}', '#{self.method}', '#{self.cuisine}', '#{self.portions}')"
		else
			sql = "UPDATE recipes SET name='#{self.name}', ingredients='#{self.ingredients}', method='#{self.method}', cuisine='#{self.cuisine}', portions='#{self.portions}' WHERE id = #{self.id}"
		end

		conn.exec(sql)

	end

	def self.open_connection

		conn = PG.connect( dbname: "food")

	end

	def self.all

		conn = Recipe.open_connection

		sql = "SELECT id, name, ingredients, method, cuisine, portions, image FROM recipes ORDER BY id"

		results = conn.exec(sql)

		recipes = results.map do |tuple|
			self.hydrate(tuple)
		end

		recipes

	end

	def self.find(search_item, search_value)

		conn = self.open_connection

		sql = "SELECT * FROM recipes WHERE #{search_item} = '#{search_value}'"

		results = conn.exec(sql)

		recipes = results.map do |tuple|
			self.hydrate(tuple)
		end

		recipes

	end

	def self.destroy(id)

		conn = self.open_connection

		sql = "DELETE FROM recipes WHERE id = #{id}"

		conn.exec(sql)

	end

	def self.hydrate(recipe_data)

		recipe = Recipe.new

		recipe.id = recipe_data["id"]
		recipe.name = recipe_data["name"]
		recipe.ingredients = recipe_data["ingredients"]
		recipe.method = recipe_data["method"]
		recipe.cuisine = recipe_data["cuisine"]
		recipe.portions = recipe_data["portions"]
		recipe.image = recipe_data["image"]

		recipe

	end

end