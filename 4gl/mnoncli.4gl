###########################################################################
## Devuelve el Nombre Comercial del Cliente     - mnomcli.4gl
###########################################################################
globals
   "../admcopys/globales.4gl"

# INC 106414
public
# FIN INC 106414
function fnomcli(cod)

   define cod like fcomcli.cl010,
          nom like fcomcli.cl070

   select cl070 into nom from fcomcli where cl000 = emprelf and cl010 = cod

   if sqlca.sqlcode <> notfound and nom is null then return " " end if

   return nom

end function


function fcabeza_agrup(cli)
  define cli,agrup like fcomcli.cl010

  whenever error continue

  select cl217 into agrup
  from fcomcli
  where cl000 = emprelf and
        cl010 = cli

  if sqlca.sqlcode < 0 then call fperdi(sqlca.sqlcode) end if

  whenever error stop

  if cli = agrup then
   return "S"
  else
   return "N"
  end if

end function


################################################################################
# - Funcion : fnomdir
# - Funcion que busca la descripcion de una dirección de envío.
# - Parámetros : cli : código del cliente al que pertenece la dirección
#                dir : código de la dirección de envío
# - Returning  : La descripción de la dirección. Null si no existe.
###############################################################################
public function fnomdir(cli,dir)

   define cli    like fcomenv.en010,
          dir    like fcomenv.en020,
          nomdir like fcomenv.en030

   whenever error continue

      select en030 into nomdir
         from fcomenv
         where en000 = empre and
               en010 = cli and
               en020 = dir

      if sqlca.sqlcode = notfound then
         return null
      else
         return nomdir
      end if

   whenever error continue

end function
