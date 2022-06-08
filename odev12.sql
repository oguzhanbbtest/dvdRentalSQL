--film tablosunda film uzunluğu length sütununda gösterilmektedir. 
---Uzunluğu ortalama film uzunluğundan fazla kaç tane film vardır?

SELECT COUNT(length) FROM film
Where length > ANY
(
SELECT AVG(length) FROM film
);

--film tablosunda en yüksek rental_rate değerine sahip kaç tane film vardır?
SELECT * FROM film
WHERE rental_rate = ANY
(
SELECT MAX(rental_rate) FROM film
);

--film tablosunda en düşük rental_rate ve en düşük replacement_cost değerlerine sahip filmleri sıralayınız.

SELECT * FROM film
WHERE rental_rate = 
(
SELECT MIN(rental_rate) FROM film
)
AND replacement_cost =
( 
SELECT MIN(replacement_cost) FROM film
)

--payment tablosunda en fazla sayıda alışveriş yapan müşterileri(customer) sıralayınız.

SELECT ( SELECT first_name FROM customer WHERE payment.customer_id = customer_id),
( SELECT last_name FROM customer WHERE payment.customer_id = customer_id), 
COUNT(payment_id) 
FROM payment
GROUP BY customer_id
ORDER BY COUNT(payment_id) DESC;


