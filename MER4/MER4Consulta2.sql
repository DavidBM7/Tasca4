use MER4;
SELECT Polissa.Num_polissa, Tipus_polissa.Nom, Client.DNI, Client.Nom, Client.Cognoms
FROM Client, Polissa, Tipus_polissa 
WHERE Client.DNI = Polissa.Client_DNI and
      Tipus_polissa_ID = Polissa.Tipus_polissa_ID and
      Tipus_polissa.Nom = "Viaje";