USE MER7;
Select count(Linia_ticket.ID)
from Linia_ticket, Ticket, Empleat
where Ticket.Num = Linia_ticket.Ticket_Num and Empleat.ID = Ticket.Empleat_ID and Empleat.Nom like "10%";