use MER5;
SELECT Client.Nom, Vehicle.Marca, Tipus_Vehicle.Nom, Cita.Data, Cita.Lloc, Client_Vehicle.Data_darrera_revisio
FROM Client, Vehicle, Tipus_Vehicle, Cita, Client_Vehicle
WHERE Client.DNI=Client_Vehicle.Client_DNI AND
	Vehicle.Matricula=Client_Vehicle.Vehicle_Matricula AND
    Tipus_Vehicle.Nom=Vehicle.Tipus_Vehicle_Nom AND
    Client_Vehicle_ID=Cita.Client_Vehicle_ID AND
    Cita.Data>"2022-03-09";