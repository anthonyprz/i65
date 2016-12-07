database datos
screen
{
[f002                                                                              ]
 [eti1   ][f001 |b1] [f011                          ]

[f002                                                                              ]
[f008                                              ][f010                         ]
 [eti3   ][f003    |f0|e000              ]              [agrup         ]
 [eti4   ][f009          ]                              [agrup         ]
 [eti5   ][f004      ]                                  [agrup         ]
 [e001   ][f000      ]
 [e002   ][f005      ]
 [e003   ][f006          ]
 [e004   ][f007    |f1|e005              ]


[f008                                              ][f010                         ]
}
end
tables fcomcpe
attributes
agrup = formonly.agrup_alb, control="radio", include=("1","2","3");
b1 = formonly.buscarped, control="button", class="icon", key="f5", picture="buscar";
e000 = formonly.des_cp020, control="label", left; --PVDescripcion Cliente
e001 = formonly.eti_cp060, control="label", left; --PVF.Exigida
e002 = formonly.eti_cp070, control="label", left; --PVF.Ent Prev
e003 = formonly.eti_cp105, control="label", left; --PVTipo Pedido
e004 = formonly.eti_cp140, control="label", left; --PVAlmacén
e005 = formonly.des_cp140, control="label", left; --PVDescripcion Cliente
eti1 = formonly.eti_cp010, control="label", left;
eti3 = formonly.eti_cp020, control="label", left; --PVCliente:
eti4 = formonly.eti_cp040, control="label", left; --PVClase
eti5 = formonly.eti_cp050, control="label", left; --PVF.Pedido
f0 = formonly.buscar_cli, control="button", class="icon", key="f20", picture="buscar";
f000 = fcomcpe.cp060; --PVdd/mm/yyyy
f001 = fcomcpe.cp010, format="-<<<<<<&";
f002 = formonly.caja0, control="group";
f003 = fcomcpe.cp020, format="-<<<<<<&";
f004 = fcomcpe.cp050; --PVdd/mm/yyyy
f005 = fcomcpe.cp070; --PVdd/mm/yyyy
f006 = fcomcpe.cp105, control="list";
f007 = fcomcpe.cp140, format="-<<<<<&";
f008 = formonly.caja1, control="group";
f009 = fcomcpe.cp040, control="list";
f010 = formonly.f000, control="group";
f011 = fcomcpe.cp030;
f1 = formonly.buscar_alm, control="button", class="icon", picture="buscar";
end
