SELECT * FROM villes_france_free ORDER BY ville_population_2012 LIMIT 10 DESC;
SELECT * FROM villes_france_free ORDER BY ville_surface LIMIT 50;
SELECT * FROM departement WHERE departement_code LIKE '97%';
SELECT ville_nom, departement_nom FROM villes_france_free LEFT JOIN departement ON ville_departement = departement_code ORDER BY ville_population_2012 DESC LIMIT 10;
SELECT departement_nom, departement_code, COUNT(ville_departement) FROM departement LEFT JOIN villes_france_free ON departement_code = ville_departement GROUP BY departement_nom, departement_code ORDER BY COUNT(ville_departement) DESC;
SELECT departement_nom, departement_code, SUM(ville_surface) FROM departement LEFT JOIN villes_france_free ON departement_code = ville_departement GROUP BY departement_nom, departement_code ORDER BY SUM(ville_surface) DESC LIMIT
SELECT COUNT(countsaint) FROM (SELECT * FROM villes_france_free WHERE ville_nom_reel LIKE 'Saint%') AS countsaint;
SELECT ville_nom, COUNT(*) AS usedtimes FROM villes_france_free GROUP BY ville_nom ORDER BY usedtimes DESC;
SELECT * FROM villes_france_free WHERE ville_surface > (SELECT AVG(ville_surface) FROM villes_france_free);
SELECT departement_nom FROM departement LEFT JOIN villes_france_free ON departement_code = ville_departement WHERE (SELECT SUM(ville_population_2010) FROM villes_france_free) >2000000 GROUP BY departement_nom;
SELECT ville_departement, SUM(ville_population_2010) FROM villes_france_free GROUP BY ville_departement HAVING SUM(ville_population_2010) > 2000000;
UPDATE villes_france_free SET ville_nom = REPLACE(ville_nom, '-', ' ') WHERE ville_nom LIKE 'SAINT-%';
