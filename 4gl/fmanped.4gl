database datos
screen
{
[f000                                                  ]
 [eti1      |f001   |b1|f015                          ]
[f000                                                  ]
[f009                                                  ]
 [e000      |f002   |f0|e005                          ]
 [eti3      |f003      ]                            [a]
 [eti4      |f013      ]
 [e008      |f004      ]
 [e009      |f014      ]
 [e004      |f006      ]
 [e003      |f011   |f1|e010                          ]
[f009                                                  ]
[f012                                                  ]
  [f016                 ]
  [f016                  ]
  [f016                  ]
[f012                                                  ]
}
end
tables fcomcpe
attributes
a = formonly.consulta;
b1 = formonly.buscar_ped, control="button", class="icon", key="f5", picture="buscar";
e000 = formonly.eti_cp020, control="label", left; --PVCliente:
e003 = formonly.eti_cp140, control="label", left; --PVBuscar almacen
e004 = formonly.eti_cp105, control="label", left; --PVPunto pedido
e005 = formonly.descli, control="label", left; --PVDescripción Cliente
e008 = formonly.eti_cp060, control="label", left; --PVF.Exigida:
e009 = formonly.eti_cp070, control="label", left; --PVF.Pedido:
e010 = formonly.desalm, control="label", left; --PVDescripción Almacen
eti1 = formonly.eti_cp010, control="label", left; --PVPedido
eti3 = formonly.eti_cp040, control="label", left; --PVClase:
eti4 = formonly.eti_cp050, control="label", left; --PVF.Pedido:
f0 = formonly.buscar_cli, control="button", class="icon", key="f20", picture="buscar";
f000 = formonly.caja0, control="group";
f001 = fcomcpe.cp010, format="-<<<<<<<&";
f002 = fcomcpe.cp020, format="-<<<<<<<&";
f003 = fcomcpe.cp040, control="list", key="f49";
f004 = fcomcpe.cp060; --PVdd/mm/yyyy
f006 = fcomcpe.cp105, control="list";
f009 = formonly.caja1, control="group";
f011 = fcomcpe.cp140, format="-<<<<<&";
f012 = formonly.caja_agrup, control="group";
f013 = fcomcpe.cp050; --PVdd/mm/yyyy
f014 = fcomcpe.cp070; --PVdd/mm/yyyy
f015 = fcomcpe.cp030; --PVDescripción pedido
f016 = formonly.agrup_alb, control="radio", include=("1","2","3"); --PVagrup_alb
f1 = formonly.buscar_alm, control="button", class="icon", key="f21", picture="buscar";
end
