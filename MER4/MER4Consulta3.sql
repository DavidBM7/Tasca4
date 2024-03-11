use MER4;
SELECT Client.Nom, Client.Cognoms, Vendedor.Nom, Vendedor.Cognoms, Polissa.Num_polissa, Tipus_polissa.Nom
FROM Client, Vendedor, Polissa, Tipus_polissa
WHERE Client.DNI = Polissa.Client_DNI and Vendedor.DNI=Polissa.Vendedor_DNI and
      Tipus_polissa.ID = Polissa.Tipus_polissa_ID;