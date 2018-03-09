DROP TABLE IF EXISTS recipes;

CREATE TABLE recipes (

	id SERIAL NOT NULL PRIMARY KEY, 
	name varchar(512), 
	method varchar(512), 
	ingredients varchar(512), 
	cuisine varchar(256), 
	portions int,
	image varchar(256)

);

INSERT INTO recipes (name, method, ingredients, cuisine, portions, image) VALUES ('Spagetti Bolognese', 'Mix them all', 'Tomatoes, beef, onions, peppers', 'Italian', 3, '/images/spagetti.jpeg');
INSERT INTO recipes (name, method, ingredients, cuisine, portions, image) VALUES ('Burrito', 'Wrap it up', 'Chicken, rice, peppers, onions', 'Mexican', 4, '/images/burrito.jpeg');
INSERT INTO recipes (name, method, ingredients, cuisine, portions, image) VALUES ('Cullen Skink', 'Cook it', 'Smoked fish, milk, cream, potatoes, leeks', 'Scottish', 4, '/images/cullenskink.jpeg');
INSERT INTO recipes (name, method, ingredients, cuisine, portions, image) VALUES ('Beef Stew', 'Cook it for ages', 'Beef, onions, potatoes', 'Irish', 5, '/images/beefstew.jpeg');
INSERT INTO recipes (name, method, ingredients, cuisine, portions, image) VALUES ('Jalfrezi Curry', 'Cook it for ages', 'Onions, chicken, peppers', 'Indian', 4, '/images/jalfrezi.jpeg');
INSERT INTO recipes (name, method, ingredients, cuisine, portions, image) VALUES ('Pork Ribs', 'Cook it for ages', 'Pork', 'American', 4, '/images/porkribs.jpeg');
INSERT INTO recipes (name, method, ingredients, cuisine, portions, image) VALUES ('Creme Brulee', 'Oven in bain marie', 'Cream, milk, sugar, vanilla', 'French', 4, '/images/cremebrulee.jpeg');
INSERT INTO recipes (name, method, ingredients, cuisine, portions, image) VALUES ('Pizza Crunch', 'Fry', 'Pizza, oil', 'Scottish', 4, '/images/pizzacrunch.jpeg');
INSERT INTO recipes (name, method, ingredients, cuisine, portions, image) VALUES ('Chilli con Carne', 'Cook it for ages', 'Beef, onions, peppers', 'Mexican', 4, '/images/chilli.jpeg');