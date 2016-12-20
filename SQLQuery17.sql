use pubs;

select c.NombreCliente, c.ApellidoCliente, dbo.udf_clientes_NombreCliente(c.idCliente)
from cliente c

