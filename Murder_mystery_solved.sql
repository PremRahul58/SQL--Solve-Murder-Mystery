use solve_mystery;

-- checking crime scene reports for witness whereabouts and details

select * from crime_scene_report;
select * from crime_scene_report where date = 20180115 and city= 'SQL City';

-- Getting two witness details and witness statements

select * from person where address_street_name = 'Northwestern Dr' or name like 'Annabel%' and address_street_name= 'Franklin Ave' order by address_number desc;
select * from interview where person_id in (14887,16371);

-- Cross Checking Witness Statements with gym database

select * from get_fit_now_member;
select * from get_fit_now_member where membership_start_date < 20180109 and membership_status = 'gold' and id like '48Z%';
select * from get_fit_now_check_in where membership_id in ('48Z7A','48Z55');
-- Both were present in the gym on 9 Jan, But Joe Germuska had alibi for 15 Jan where as Jeremy Bowers did not.
select * from facebook_event_checkin where person_id in (28819,67318); -- Alibi for Joe Germuska
-- Based on the above Conclusions
-- Murderer is 'Jeremy Bowers'
-- But he is just a hit man, there is real mastermind behind him. Here is the proof to that:

select * from person where name= 'Jeremy Bowers';
select * from interview where person_id= 67318;

-- Now based on his transcript i will find the woman who hired him. By cross checking the description in the transcript.

select * from drivers_license;
select * from drivers_license where car_make= 'Tesla' and car_model= 'Model S' and hair_color= 'red' and height between 65 and 67 ; -- based on the description by Jeremy.
select *  from person where license_id in (202298,291182,918773); -- It comes down to three females.
select * from facebook_event_checkin where person_id in (78881,90700,99716); -- she attended Event three times in december 2017.

-- Based on the transcript of Jeremy Bowers he was paid by women and based on the descriptions, my conclusions come down to one person
-- 'Miranda Priestly' is the one who hired Jeremy Boowers.

-- alter table solution drop column user;
-- alter table solution add Hired_By varchar(20);
-- alter table solution rename column murderer to Murderer;
-- alter table solution modify column user int(2), modify column value varchar(20);
-- delete from solution ;
insert into solution(Murderer, Hired_By) values ( 'Jeremy Bowers','Miranda Priestly');

select * from solution;









