use MER4;
SELECT Client.Nom as "Nom Client", Client.Cognoms as "Cognoms del Client", Polissa.Num_polissa as "Numero de la polissa" 
FROM Client, Polissa 
WHERE Client.DNI = Polissa.Client_DNI and Client.Nom="Ayoub" and Client.Cognoms="Achboune";