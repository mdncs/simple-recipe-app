DROP DATABASE IF EXISTS recipes;
CREATE DATABASE recipes;

\c recipes


-- All tables

CREATE TABLE course (
    course_id SERIAL PRIMARY KEY,
    name VARCHAR NOT NULL
);

CREATE TABLE dishtype (
    dishtype_id SERIAL PRIMARY KEY,
    name VARCHAR NOT NULL
);

CREATE TABLE dish (
    dish_id SERIAL PRIMARY KEY,
    dish_name VARCHAR NOT NULL,
    course_id INT NOT NULL,
    FOREIGN KEY (course_id) REFERENCES course(course_id),
    dishtype_id INT,
    FOREIGN KEY (dishtype_id) REFERENCES dishtype(dishtype_id)
);

CREATE TABLE ingredients (
    ingredient_id SERIAL PRIMARY KEY,
    ingredient_name VARCHAR NOT NULL
);

CREATE TABLE methods (
    method_id SERIAL PRIMARY KEY,
    method_name VARCHAR NOT NULL
);

CREATE TABLE recipes (
    recipe_id SERIAL PRIMARY KEY,
    dish_id INT NOT NULL,
    ingredient_id INT NOT NULL,
    method_id INT NOT NULL,
    FOREIGN KEY (dish_id) REFERENCES dish(dish_id),
    FOREIGN KEY (ingredient_id) REFERENCES ingredients(ingredient_id),
    FOREIGN KEY (method_id) REFERENCES methods(method_id)
);

CREATE TABLE ingredients_methods (
    ingredients_methods_id SERIAL PRIMARY KEY,
    ingredient_id INT,
    method_id INT,
    FOREIGN KEY (ingredient_id) REFERENCES ingredients(ingredient_id),
    FOREIGN KEY (method_id) REFERENCES methods(method_id)
);

-- All inserts

INSERT INTO course 
    (name)
VALUES
    ('Starter'),
    ('Main'),
    ('Desert'),
    ('Drink');

SELECT * FROM course;

INSERT INTO dishtype
    (name) 
VALUES 
    ('Cocktail'),
    ('Pizza'),
    ('Pasta'),
    ('Wine'),
    ('Ice-cream'),
    ('Soup');

SELECT * FROM dishtype;

INSERT INTO dish 
    (dish_name, course_id, dishtype_id)
VALUES
    ('Minestrone', 1, 6),
    ('Veggie Pizza', 2, 2),
    ('Spaghetti with Homemade Tomato Sauce, Zucchini and Parmesan', 2, 3),
    ('Pistachio Gelato', 3, 5),
    ('Pinot Noir', 4, 4),
    ('Mojito', 4, 1);

SELECT * FROM dish;
SELECT * FROM dish WHERE dish.course_id = 2;

INSERT INTO ingredients 
    (ingredient_name)
VALUES
    ('Olive oil'),
    ('Tomato'),
    ('Potato'),
    ('Garlic'),
    ('Mint'),
    ('Parmesan'),
    ('Ice'),
    ('Basil'),
    ('Pistachios'),
    ('Celery'),
    ('Pesto'),
    ('Lime'),
    ('Wine'),
    ('Mozarella'),
    ('Mushrooms'),
    ('Beans'),
    ('Sugar'),
    ('Pepper'),
    ('Leek'),
    ('Milk'),
    ('Carrots'),
    ('Spiced Rum'),
    ('Courgette'),
    ('Onion'),
    ('Corn'),
    ('Spaghetti'),
    ('Eggs');

SELECT * FROM ingredients;

INSERT INTO methods
    (method_name)
VALUES
    ('wash'),
    ('chop'),
    ('pour'),
    ('grate'),
    ('peel'),
    ('add'),
    ('grind'),
    ('unshell'),
    ('juice'),
    ('shred'),
    ('stir'),
    ('drain'),
    ('whisk'),
    ('boil'),
    ('cut');

INSERT INTO recipes 
    (dish_id, ingredient_id, method_id)
VALUES 
    -- Minestrone ingredients
    (1, 1, 3), (1, 2, 1), (1, 2, 2), (1, 3, 5), (1, 3, 1), (1, 3, 2), 
    (1, 4, 5), (1, 4, 1), (1, 4, 2), (1, 6, 4), (1, 10, 1), (1, 10, 2), 
    (1, 11, 1), (1, 11, 2), (1, 16, 1), (1, 19, 1), (1, 19, 2), (1, 21, 5), 
    (1, 21, 1), (1, 23, 1), (1, 23, 2), (1, 24, 5), (1, 24, 1), (1, 24, 2),
    -- Veggie Pizza ingredients
    (2, 1, 3), (2, 2, 1), (2, 2, 2), (2, 4, 5), (2, 4, 1), (2, 6, 4), (2, 8, 1),
    (2, 8, 2), (2, 14, 10), (2, 15, 1), (2, 15, 2), (2, 25, 1), (2, 27, 13),
    -- Spaghetti with Homemade Tomato Sauce ingredients
    (3, 1, 3),  (3, 2, 1), (3, 2, 2), (3, 4, 5), (3, 4, 1), (3, 4, 2), (3, 6, 4),
    (3, 8, 1), (3, 8, 2), (3, 11, 1), (3, 11, 2), (3, 23, 1), (3, 23, 2), 
    (3, 26, 14), (3, 26, 12),
    -- Pistachio Gelato ingredients
    (4, 7, 6), (4, 9, 8), (4, 9, 14), (4, 9, 5), (4, 9, 7), (4, 17, 3), (4, 20, 3),
    -- Pinot Noir
    (5, 13, 3),
    -- Mojito ingredients
    (6, 5, 1), (6, 5, 2), (6, 7, 6), (6, 12, 15), (6, 12, 9), (6, 17, 3), 
    (6, 22, 3), (6, 22, 11);

INSERT INTO ingredients_methods
    (ingredient_id, method_id)
VALUES 
    (1, 3), (2, 1), (2, 2), (3, 5), (3, 1), (3, 2), (4, 5), (4, 1), 
    (4, 2), (5, 1), (5, 2), (6, 4), (7, 6), (8, 1), (8, 2), (9, 8),
    (9, 5), (9, 7), (10, 1), (10, 2), (11, 6), (12, 15), (12, 9),
    (13, 3), (14, 10), (15, 1), (15, 2), (16, 1), (17, 3), (18, 1),
    (18, 2), (19, 1), (19, 2), (20, 3), (21, 5), (21, 1), (22, 3), 
    (22, 11), (23, 1), (23, 2), (24, 5), (24, 1), (24, 2), (25, 1),
    (26, 14), (26, 12), (27, 13);


-- -- All recipes w/o methods

-- -- Return minestrone recipe + ingredients
-- SELECT ingredients.ingredient_name
-- FROM recipes 
-- JOIN dish ON dish.dish_id = recipes.dish_id 
-- JOIN ingredients ON ingredients.ingredient_id = recipes.ingredient_id
-- WHERE dish.dish_name = 'Minestrone';

-- -- Return pasta recipe + ingredients
-- SELECT ingredients.ingredient_name
-- FROM recipes 
-- JOIN dish ON dish.dish_id = recipes.dish_id 
-- JOIN ingredients ON ingredients.ingredient_id = recipes.ingredient_id
-- WHERE dish.dish_name = 'Spaghetti with Homemade Tomato Sauce, Zucchini and Parmesan';

-- -- Return pizza recipe + ingredients
-- SELECT ingredients.ingredient_name
-- FROM recipes 
-- JOIN dish ON dish.dish_id = recipes.dish_id 
-- JOIN ingredients ON ingredients.ingredient_id = recipes.ingredient_id
-- WHERE dish.dish_name = 'Veggie Pizza';

-- -- Return all dishes which use garlic
-- SELECT dish.dish_name
-- FROM recipes
-- JOIN dish ON dish.dish_id = recipes.dish_id 
-- JOIN ingredients ON ingredients.ingredient_id = recipes.ingredient_id
-- WHERE ingredients.ingredient_name = 'Garlic';

-- -- Return all dishes which use corn
-- SELECT dish.dish_name
-- FROM recipes
-- JOIN dish ON dish.dish_id = recipes.dish_id 
-- JOIN ingredients ON ingredients.ingredient_id = recipes.ingredient_id
-- WHERE ingredients.ingredient_name = 'Corn';

-- -- Return all dishes which use mint
-- SELECT dish.dish_name
-- FROM recipes
-- JOIN dish ON dish.dish_id = recipes.dish_id 
-- JOIN ingredients ON ingredients.ingredient_id = recipes.ingredient_id
-- WHERE ingredients.ingredient_name = 'Mint';

-- -- Return all dishes which use courgettes
-- SELECT dish.dish_name
-- FROM recipes
-- JOIN dish ON dish.dish_id = recipes.dish_id 
-- JOIN ingredients ON ingredients.ingredient_id = recipes.ingredient_id
-- WHERE ingredients.ingredient_name = 'Courgette';

-- -- Return all dishes which use at least 1 ingredient in a set
-- SELECT dish.dish_name
-- FROM recipes
-- JOIN dish ON dish.dish_id = recipes.dish_id 
-- JOIN ingredients ON ingredients.ingredient_id = recipes.ingredient_id
-- WHERE ingredients.ingredient_name = 'Courgette'
-- OR ingredients.ingredient_name = 'Garlic'
-- OR ingredients.ingredient_name = 'Tomato'
-- OR ingredients.ingredient_name = 'Mint';

-- -- Return all dishes of 1 course OR dishtype with at least 1 ingredient in a set
-- SELECT dish.dish_name
-- FROM recipes
-- JOIN dish ON dish.dish_id = recipes.dish_id 
-- JOIN ingredients ON ingredients.ingredient_id = recipes.ingredient_id
-- WHERE course_id = 2
-- AND (ingredients.ingredient_name = 'Courgette'
-- OR ingredients.ingredient_name = 'Garlic'
-- OR ingredients.ingredient_name = 'Tomato'
-- OR ingredients.ingredient_name = 'Mint'
-- OR ingredients.ingredient_name = 'Pistachios');

-- -- Return all dishes of 1 course AND dishtype with at least 1 ingredient in a set
-- SELECT dish.dish_name
-- FROM recipes
-- JOIN dish ON dish.dish_id = recipes.dish_id 
-- JOIN ingredients ON ingredients.ingredient_id = recipes.ingredient_id
-- WHERE course_id = 2 AND dishtype_id = 3
-- AND (ingredients.ingredient_name = 'Courgette'
-- OR ingredients.ingredient_name = 'Garlic'
-- OR ingredients.ingredient_name = 'Tomato'
-- OR ingredients.ingredient_name = 'Mint'
-- OR ingredients.ingredient_name = 'Pistachios');

-- -- All recipes w/ methods

-- -- Return all methods (+ dish name for reference) used for drinks (course id 4)
-- SELECT methods.method_name, dish.dish_name
-- FROM recipes 
-- JOIN dish ON dish.dish_id = recipes.dish_id 
-- JOIN ingredients ON ingredients.ingredient_id = recipes.ingredient_id
-- JOIN methods ON methods.method_id = recipes.method_id
-- WHERE course_id = 4;

-- -- Return all ingredients (+ method name for reference) that use method 'pour'
-- SELECT ingredients.ingredient_name
-- FROM recipes 
-- JOIN dish ON dish.dish_id = recipes.dish_id 
-- JOIN ingredients ON ingredients.ingredient_id = recipes.ingredient_id
-- JOIN methods ON methods.method_id = recipes.method_id
-- WHERE recipes.method_id = 3;

-- -- Return all ingredients that use more than one method

-- SELECT COUNT(methods.method_name), ingredient_name 
-- FROM ingredients_methods 
-- JOIN ingredients ON ingredients.ingredient_id = ingredients_methods.ingredient_id
-- JOIN methods ON methods.method_id = ingredients_methods.method_id
-- GROUP BY ingredient_name
-- HAVING COUNT(methods.method_name) > 2;


-- -- Returns all ingredients for a specific dish + methods
-- SELECT ingredients.ingredient_name, methods.method_name
-- FROM recipes 
-- JOIN dish ON dish.dish_id = recipes.dish_id 
-- JOIN ingredients ON ingredients.ingredient_id = recipes.ingredient_id
-- JOIN methods ON methods.method_id = recipes.method_id
-- WHERE dish.dish_name = 'Mojito';

-- -- Return all ingredients (+dishes for reference) for 1 dishtype with at least 
-- -- 1 ingredient in a set and not containing a certain ingredient (mushrooms)
-- SELECT dish.dish_name, 
-- FROM recipes
-- JOIN dish ON dish.dish_id = recipes.dish_id 
-- JOIN ingredients ON ingredients.ingredient_id = recipes.ingredient_id
-- WHERE dishtype_id = 2
-- AND (ingredients.ingredient_name = 'Courgette'
-- OR ingredients.ingredient_name = 'Garlic'
-- OR ingredients.ingredient_name = 'Tomato'
-- OR ingredients.ingredient_name = 'Mint'
-- OR ingredients.ingredient_name = 'Pistachios')
-- AND ingredients.ingredient_name != 'Mushrooms';
