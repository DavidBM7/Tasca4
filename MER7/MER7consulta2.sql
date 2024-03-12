USE MER7;
select Ticket.Num_factura, Ticket.Data, Empleat.Nom, Empleat.Cognom
from Ticket, Empleat, Linia_ticket, Producte
where Producte.ID = Linia_ticket.Producte_ID and Ticket.Num = Linia_ticket.Ticket_Num and Empleat.ID = Ticket.Empleat_ID and Producte.Nom = "Poma";