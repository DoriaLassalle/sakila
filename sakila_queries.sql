# 1.Oobtener todos los clientes dentro de city_id = 312? 
# Su consulta debe devolver el nombre, apellido, correo electrónico y dirección del cliente.

SELECT cu.first_name, cu.last_name, cu.email, ad.address, ci.city FROM customer cu 
JOIN address ad ON cu.address_id=ad.address_id
JOIN city ci ON ad.city_id=ci.city_id
WHERE ci.city_id=312;

# 2.  Obtener todas las películas de comedia? Su consulta debe devolver el título de la película, 
# la descripción, el año de estreno, la calificación, las características especiales y el género (categoría).

SELECT fi.title, fi.description, fi.release_year, fi.rating, fi.special_features, ca.name AS genero
FROM film_category fc
JOIN category ca ON fc.category_id=ca.category_id
JOIN film fi ON fc.film_id=fi.film_id
WHERE ca.name="Comedy";

# 3. Obtener todas las películas unidas por actor_id = 5? Su consulta debe devolver la identificación del actor, 
# el nombre del actor, el título de la película, la descripción y el año de lanzamiento.

SELECT ac.actor_id, CONCAT(ac.first_name, " ", ac.last_name)AS actor_name, fi.title, fi.description, fi.release_year
FROM film_actor fa 
JOIN actor ac ON fa.actor_id=ac.actor_id
JOIN film fi ON fa.film_id=fi.film_id
WHERE ac.actor_id=5;

#4. Obtener todos los clientes en store_id = 1 y dentro de estas ciudades (1, 42, 312 y 459)? 
# Su consulta debe devolver el nombre, apellido, correo electrónico y dirección del cliente.

SELECT s.store_id, first_name, cu.last_name, cu.email, ad.address, ci.city FROM customer cu 
JOIN address ad ON cu.address_id=ad.address_id
JOIN city ci ON ad.city_id=ci.city_id
JOIN store s ON cu.store_id=s.store_id
WHERE s.store_id=1 AND ci.city_id IN (1, 42, 312, 459);

# 5.obtener todas las películas con una "calificación = G" y "característica especial = detrás de escena", 
# unidas por actor_id = 15? Su consulta debe devolver el título de la película, la descripción, el año de lanzamiento,
# la calificación y la función especial. Sugerencia: puede usar la función LIKE para obtener la parte 'detrás de escena'.

SELECT fi.title, fi.description, fi.release_year, fi.rating, fi.special_features
FROM film_actor fa 
JOIN actor ac ON fa.actor_id=ac.actor_id
JOIN film fi ON fa.film_id=fi.film_id
WHERE fi.rating="G" AND fi.special_features LIKE "%behind%" AND ac.actor_id=15;

# 6. Obtener todos los actores que se unieron en el film_id = 369? 
# Su consulta debe devolver film_id, title, actor_id y actor_name.

SELECT fi.film_id, fi.title, ac.actor_id, CONCAT(ac.first_name," ", ac.last_name) AS actor_name
FROM film_actor fa 
JOIN actor ac ON fa.actor_id=ac.actor_id
JOIN film fi ON fa.film_id=fi.film_id
WHERE fi.film_id=369;

#7. Obtener todas las películas dramáticas con una tarifa de alquiler de 2.99? 
# Su consulta debe devolver el título de la película, la descripción, el año de estreno, la calificación, 
# las características especiales y el género (categoría).

SELECT fi.title, fi.description, fi.release_year, fi.rating, fi.special_features, ca.name AS genero, fi.rental_rate
FROM film_category fc
JOIN category ca ON fc.category_id=ca.category_id
JOIN film fi ON fc.film_id=fi.film_id
WHERE fi.rental_rate= 2.99 AND ca.name="Drama";

# 8. Obtener todas las películas de acción a las que se une SANDRA KILMER? 
# Su consulta debe devolver el título de la película, la descripción, el año de estreno, la calificación, 
# las características especiales, el género (categoría) y el nombre y apellido del actor.

SELECT fi.title, fi.description, fi.release_year, fi.rating, fi.special_features, ca.name AS genero,
CONCAT(ac.first_name," ", ac.last_name) AS actor_name
FROM film_actor fa 
JOIN actor ac ON fa.actor_id=ac.actor_id
JOIN film fi ON fa.film_id=fi.film_id
JOIN film_category fc ON fi.film_id=fc.film_id
JOIN category ca ON fc.category_id=ca.category_id
WHERE ca.name="Action" AND ac.first_name="Sandra" AND ac.last_name="Kilmer";

### END ###



