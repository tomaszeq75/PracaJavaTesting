
-- wszystkie marki, modele, wersje

select `ma`.`id` as `ma`, `mo`.`id` as `mo`, `ve`.`id` as `ve`, `ma`.`name` as `marka`, `mo`.`name` as `model`, `ve`.`name` as `wersja`
FROM vehicle_marks AS `ma`
JOIN vehicle_models AS `mo` ON ma.id = mo.vehicle_mark_id
LEFT JOIN vehicle_versions AS `ve` ON mo.id = ve.vehicle_model_id
-- WHERE `ma`.`id`=3 		-- marka
WHERE `mo`.`id`=44	 		-- model
order by `model` ASC, `wersja` ASC LIMIT 200



-- dodawanie wersji do modelu

insert into `vehicle_versions` (`id`, `vehicle_model_id`, `name`, `created_at`, `updated_at`) VALUES
(NULL, 'xx', 'W201 (1985-1993)', CURRENT_TIME(), CURRENT_TIME())



-- Wyświetlenie podstawowych danych użytkowników
select `id`, `email`,`name`, `city` ,`remember_token`, `verification_hash`, `verified_at`, `is_active`, `created_at`, `updated_at`, `autopanel`, `invoice_data`, `automarket`, `akol`, `saldo`, `num_1`, `num_2`, `promo_code_status`, `promo_code_date` FROM `users`
where id=23
order by `users`.`promo_code_date` DESC



-- zliczenie ilości ogłoszeń na użytkownika 
-- tylko pojazdy, bez części (category<13)
-- tylko aktywne (status=1, 0,2-nie widać, 3-nieaktywne, 4-zakończone)
-- mające więcej niż x ogłoszeń

select `a`.`user_id`, `u`.`email`, count(`user_id`) AS `ilosc`, `u`.`autopanel`, `u`.`automarket`, `u`.`akol`, `u`.`verified_at`, `u`.`created_at`, `u`.`updated_at`,
`u`.`remember_token`, `u`.`verification_hash`, `u`.`promo_code_status`, `u`.`promo_code_date`
FROM `advertisements` AS `a`
INNER JOIN `users` AS `u` ON `a`.`user_id`=`u`.`id`
WHERE `category_id`<13 AND `status`=1
AND `remember_token` is not null 	-- zapamiętane hasło w przeglądarce jest 25
GROUP BY `user_id`
HAVING `ilosc`>4
ORDER BY `ilosc` DESC
limit 200


-- adresy do XLSX

select `id`, `name`, `email`, `company_name`, `postal`, `city`, `address`, `phone_1`, `remember_token`, `created_at`, `autopanel`, `automarket`, `akol`, `saldo` FROM `users`
where remember_token is null


-- temp - adresey mail z ogłoszeń użytkowników
select email, id
from `advertisements`
where 
-- email is NOT null AND email NOT LIKE '' AND
status=1 AND
user_id=312