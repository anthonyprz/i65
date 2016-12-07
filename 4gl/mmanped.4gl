globals
   "../admcopys/globales.4gl"


define r_cpe            record like fcomcpe.*,
       #desped           like fcomcpe.cp030,
       descli           like fcomcli.cl020,
       desalm           like falmpal.pa010,
       agrup_alb        char(1) # Se trata del campo fcomcpe.cp735
                             # 1-Por Pedido
                             # 2-Por Cliente
                             # 3-Por Su Pedido

define ult_ped          like fcomcpe.cp010

define abre_manped      smallint

define abierto_query    smallint

define m_8005N,
       m_8052N          char(30)


function fmanped() # Función principal del módulo de Mnto de Pedidos

   # Inicializar las variables principales
   initialize ult_ped to null
   let abre_manped = 0
   let abierto_query = 0

   call fopen_escritorio()

   # Cargar los últimos 4 documentos
   #call fdoc_manped()

   # Definir las opciones específicas del programa
   call fher_manped()

   menu "" #Programa de Prueba de Mantenimiento de Pedidos
      before menu
         call fmanped_hide()
         # Activar las opciones del menú que puedan estar activas
         call fshow(m_8005N)
         call fshow(m_8052N)
         if usu_gem = admuser then call fshow(m_protecciones) end if

      popup m_archivo
         command key (control-n) m_nuevo bitmap "bot_nuevo"
            call fmenu_opciones(c_nue)
         command key (control-a) m_modificar bitmap "bot_modif"
            call fmenu_opciones(c_mod)
         command key (control-o) m_consultar bitmap "bot_consul"
            call fmenu_opciones(c_con)
         command key (control-e) m_eliminar bitmap "bot_elim"
         command "---"
         command key (accept)    m_aceptar bitmap "bot_guardar"
         command key (esc)       m_cancelar bitmap "bot_cancel"
         command "---"
         command key (control-j) m_configurar
         command key (control-p) m_imprimir bitmap "bot_impr"
         command key (control-w) m_vista_previa
         command "---"
         command key (control-s) m_enviar
   #      command m_separador
   #      command key (f61) {docyyy}[1]
   #         call fmenu_opciones({c_do1})
   #      command key (f62) {docyyy}[2]
   #         call fmenu_opciones({c_do2})
   #      command key (f63) {docyyy}[3]
   #         call fmenu_opciones({c_do3})
   #      command key (f60) {docyyy}[4]
   #         call fmenu_opciones({c_do4})
         command "---"
         command key (interrupt) m_salir
            exit menu
      end popup

      popup m_buscar
         command key (f2) m_repetir_codigo bitmap "bot_f2"
         command "---"        # Éstas utilidades se referirán al query de la clave1 o
                              # al query conjunto según la opción en la que estemos
         command key(control-f) m_primero
         command key(f3)  m_anterior  bitmap "bot_f3"
         command key(f4)  m_siguiente bitmap "bot_f4"
         command key(control-u) m_ultimo
         command "---"
         command key(control-r) m_busqueda_ant
      end popup

      popup m_herramientas
         command m_8005N
            call fmodif_text(8005,"N") # Mantenimiento de la descripción auxiliar de Clase de Pedido
         command "---"
         command m_8052N
            call fmodif_text(8052,"N") # Mantenimiento de la descripción auxiliar de Clase de Tipo de Pedido
         command "---"
         command key (control-t) m_protecciones
            if usu_gem = admuser then
               call fcarga_prot()
            end if
      end popup

      popup m_ayuda
         command key (f1) m_ayuda_de bitmap "bot_ayuda"
            call fhelp_pg("admpru","mmanped")
         command "---"
         command key (control-y) m_en_el_web
            call fen_el_web()
         command "---"
         command key (control-q) m_acerca_de
            call facercade()
      end popup

   end menu



end function




private function fmenu_opciones(op_act)

   define op_act smallint,
          op_ant smallint

   let op_ant = c_con

   while true

      initialize op_sig to null
      case
      when op_act = c_nue
         if fautoridad(ref_opc,"A") then let op_sig = fnuevo_manped() end if
         let op_ant = c_nue

      when op_act = c_mod
         if fautoridad(ref_opc,"M") then let op_sig = fmodif_manped() end if
         let op_ant = c_mod
      when op_act = c_con
         if fautoridad(ref_opc,"C") then let op_sig = fcons_manped() end if
         if op_sig = c_mod then
            let ult_ped = r_cpe.cp010
         end if
         let op_ant = c_con
      when op_act = c_int
         call ffinishlog()
         exit program
      {when op_act = c_do1 or op_act = c_do2 or op_act = c_do3 or op_act = c_do4
         case
         when op_act = c_do1
            let codclave1 = codyyy[1].yy010
            let codclave2 = codyyy[1].yy020
         when op_act = c_do2
            let codclave1 = codyyy[2].yy010
            let codclave2 = codyyy[2].yy020
         when op_act = c_do3
            let codclave1 = codyyy[3].yy010
            let codclave2 = codyyy[3].yy020
         when op_act = c_do4
            let codclave1 = codyyy[4].yy010
            let codclave2 = codyyy[4].yy020
         end case

         #select campo1 from tabla
         #   where campo1 = empresa and
         #         campo2 = codclave1 and
         #         campo3 = codclave2
         if status = notfound then
            let op_sig = c_nue
         else
            if op_ant = c_mod then
               let op_sig = c_mod
            else
               let op_sig = c_con
            end if
         end if
         #let ult_ped = codclave1
         #let ult_clave2 = codclave2}

      otherwise
         if abre_manped = 1 then
            close window w_manped
            let abre_manped = 0
         end if

         exit while
      end case

      let op_act = op_sig

   end while

   # Se debe activar el menú. Debe ir lo mismo que se tiene en el "before menu"
   call fmanped_hide()
   call fshow(m_8005N)
   call fshow(m_8052N)

   if usu_gem = admuser then call fshow(m_protecciones) end if

   #call fdoc_manped()
   initialize ult_ped to null

end function





private function fnuevo_manped()

   call fabre_manped()
   call ftitulo(fmsp_text(021,"","","","",""))

   while true

#      call fdoc_{manyyy}()

      initialize r_cpe.* to null

      if ult_ped is null then
         call fcap_manped("N") returning op_val,op_sig
      else
         let r_cpe.cp010 = ult_ped
         initialize ult_ped to null
         let op_val = c_ace
      end if

      if op_val = c_can then
         clear form
         call fmanped_clearform()
         exit while
      end if

      display by name r_cpe.cp010,r_cpe.cp030#,desped

      select *
         from fcomcpe
         where cp000 = empre and
               cp010 = r_cpe.cp010

      if sqlca.sqlcode <> notfound then
         # La información existe
         call ferror(fmsp_errs(001,"","","","",""),8)
         clear form
         call fmanped_clearform()
         continue while
      end if

      call finput_manped("N") returning op_val,op_sig

      if op_val = c_ace then
         call fgraba_manped("N")
      end if

      clear form
      call fmanped_clearform()

      case
      when op_sig = c_que next key "f5" continue while
      when op_sig = c_pri next key "control-f" continue while
      when op_sig = c_pre next key "f3" continue while
      when op_sig = c_sig next key "f4" continue while
      when op_sig = c_ult next key "control-u" continue while
      when op_sig = c_req next key "control-r" continue while
      end case

      if op_sig is not null then exit while end if

   end while

   return op_sig

end function




private function fmodif_manped()

   call fabre_manped()
   call ftitulo(fmsp_text(022,"","","","",""))

   while true
      #call fdoc_{manyyy}()

      initialize r_cpe.* to null

      if ult_ped is null then
         call fcap_manped("M") returning op_val,op_sig
      else
         let r_cpe.cp010 = ult_ped
         initialize ult_ped to null
         let op_val = c_ace
      end if

      if op_val = c_can then
         clear form
         call fmanped_clearform()
         exit while
      end if

      display by name r_cpe.cp010,r_cpe.cp030 # desped


      # Bloquear Pedido
      call fbloquear(0,"fcomcpe",empre,r_cpe.cp010,"","","","","","") returning sw
      case
      when sw = 0      # Bloqueo No Conseguido
         call fcommit(null)
         clear form
         call fmanped_clearform()
         continue while
      when sw = 2      # El registro no existe
         call ferror(fmsp_errs(002,"","","","",""),8)
         clear form
         call fmanped_clearform()
         continue while
      end case

      call fcarga_valores()


      call finput_manped("M") returning op_val,op_sig

      if op_val = c_ace then

         call fgraba_manped("M")

      end if

      # Desbloquear Pedido
      call fdesbloquear("fcomcpe",empre,r_cpe.cp010,"","","","","","")


      call fnew_cod(tty,10,"",r_cpe.cp010)

      #let nuevo_doc = {campo1},"-",{campon}
      #call fnew_doc(empre,nuevo_doc)

      clear form
      #call fmanped_clearform()


      case
      when op_sig = c_que next key "f5" continue while
      when op_sig = c_pri next key "control-f" continue while
      when op_sig = c_pre next key "f3" continue while
      when op_sig = c_sig next key "f4" continue while
      when op_sig = c_ult next key "control-u" continue while
      when op_sig = c_req next key "control-r" continue while
      end case

      if op_sig is not null then exit while end if

   end while

   return op_sig

end function



private function fcons_manped()

   call fabre_manped()
   call ftitulo(fmsp_text(023,"","","","",""))

   while true

      #call fdoc_{manyyy}()

      initialize r_cpe.* to null

      if ult_ped is null then
         call fcap_manped("C") returning op_val,op_sig
      else
         let r_cpe.cp010 = ult_ped
         initialize ult_ped to null
         let op_val = c_ace
      end if

      if op_val = c_can then
         clear form
         call fmanped_clearform()
         exit while
      end if

      select * into r_cpe.*
         from fcomcpe
         where cp000 = empre and
               cp010 = r_cpe.cp010

      display by name r_cpe.cp010,r_cpe.cp030 # desped

      if sqlca.sqlcode = notfound then # La información no existe
         call ferror(fmsp_errs(002,"","","","",""),8)
         clear form
         call fmanped_clearform()
         continue while
      end if

      call fcarga_valores()

      call fdisplay_manped() returning op_val,op_sig

      call fnew_cod(tty,10,"",r_cpe.cp010)

      #let nuevo_doc = {campo1},"-",{campon}
      #call fnew_doc(empre,nuevo_doc)

      clear form
      call fmanped_clearform()

      case
      when op_sig = c_que next key "f5" continue while
      when op_sig = c_pri next key "control-f" continue while
      when op_sig = c_pre next key "f3" continue while
      when op_sig = c_sig next key "f4" continue while
      when op_sig = c_ult next key "control-u" continue while
      when op_sig = c_req next key "control-r" continue while
      end case

      if op_sig is not null then exit while end if

   end while

   return op_sig

end function




private function fcap_manped(opcion)

   define opcion char(1)
   define aux_codped like fcomcpe.cp010,
          aux_desped like fcomcpe.cp030,
          sw_ok      smallint # 0- KO / 1-OK

   initialize op_val,op_sig to null

   let quit_flag = 0

   # Activar las opciones que estén activas en la captura de la clave
   call fmanped_hide()

   call fshow(m_aceptar)
   call fshow(m_cancelar)
   #call fshow(m_repetir_codigo)
   if abierto_query then
      call fshow("query")
   end if

   input by name r_cpe.cp010 without defaults

      after field cp010
         if r_cpe.cp010 is not null then
            call fdesped_su_pedido(r_cpe.cp010) returning sw_ok,aux_desped
            if sw_ok = 0 then # No existe
               if opcion <>"N" then # En la opción nuevo no debe existir, eso es lo correcto
                  initialize r_cpe.cp010 to null
               end if
            else              # Si existe
               let r_cpe.cp030 = aux_desped
            end if
         else
            initialize r_cpe.cp030 to null
         end if
         display by name r_cpe.cp010,r_cpe.cp030

      on key (f1)
         call fhelp_pg("admpru","mmanped")
      #on key (help)
      #   call fdichlp({"tabla"},fgl_fieldfocus())
      on key (control-y)
         call fen_el_web()
      on key (esc)                  # Cancelar
         let op_val = c_can
         let op_sig = null
         exit input
      on key (interrupt)            # Salir (sistema)
         let op_val = c_can
         let op_sig = fquit()
         exit input
      on key (control-q)
         call facercade()

      on key (f2)
         call flast_cod(tty,10) returning sw,r_cpe.cp010
         if r_cpe.cp010 is not null then
            let op_val = c_ace
            let op_sig = null
            exit input
         end if

      on key (control-r)
         if abierto_query then
            call fquery_re(8004)
                 returning sw,aux_codped,cod_te1,cod_te1,cod_te1,cod_te1,
                           cod_te1,cod_te1,cod_te1
            if sw then
               let r_cpe.cp010 = aux_codped
               let op_val = c_ace
               let op_sig = null
               exit input
            end if
         end if
      on key (control-f)
         if abierto_query then
            call fquery_pri(8004)
                 returning sw,aux_codped,cod_te1,cod_te1,cod_te1,
                              cod_te1,cod_te1,cod_te1,cod_te1
            let r_cpe.cp010 = aux_codped
            let op_val = c_ace
            let op_sig = null
            exit input
         end if
      on key (f3)
         if abierto_query then
            call fquery_pre(8004)
                 returning sw,aux_codped,cod_te1,cod_te1,cod_te1,cod_te1,
                           cod_te1,cod_te1,cod_te1
            if sw then
               let r_cpe.cp010 = aux_codped
               let op_val = c_ace
               let op_sig = null
               exit input
            end if
         end if
      on key (f4)
         if abierto_query then
            call fquery_sig(8004)
                 returning sw,aux_codped,cod_te1,cod_te1,cod_te1,cod_te1,
                           cod_te1,cod_te1,cod_te1
            if sw then
               let r_cpe.cp010 = aux_codped
               let op_val = c_ace
               let op_sig = null
               exit input
            end if
         end if
      on key (control-u)
         if abierto_query then
            call fquery_ult(8004)
                 returning sw,aux_codped,cod_te1,cod_te1,cod_te1,cod_te1,
                           cod_te1,cod_te1,cod_te1
            let r_cpe.cp010 = aux_codped
            let op_val = c_ace
            let op_sig = null
            exit input
         end if

      on key (f5)
         call fquery_do(8004,fdisp_nomcol("fcomcpe","cp010"),"P")
              returning sw,aux_codped,cod_te1,cod_te1,cod_te1,cod_te1,
                           cod_te1,cod_te1,cod_te1
         if sw = 1 then
            let abierto_query = 1
            let r_cpe.cp010 = aux_codped
            call fdesped_su_pedido(r_cpe.cp010) returning sw,aux_desped
            if sw = 0 then # ko
               initialize r_cpe.cp010 to null
            else
               let r_cpe.cp030 = aux_desped
            end if
            let op_val = c_ace
            let op_sig = null
            exit input
         end if

      after input       # Guardar / aceptar
         if r_cpe.cp010 is null then
            call ferror(ftraduce_errs(001,"","","","",""),8)
            next field cp010
         end if
         let op_val = c_ace

      on key (control-n)       # Nuevo
         let op_val = c_can
         let op_sig = c_nue
         exit input
      on key (control-a)       # Modificar
         let op_val = c_can
         let op_sig = c_mod
         exit input
      on key (control-o)       # Consultar
         let op_val = c_can
         let op_sig = c_con
         exit input

   end input

   return op_val,op_sig

end function



private function finput_manped(opcion)

   define opcion        char(1) # "M" --> Modificar
                                # "N" --> Nuevo

   define foco          char(15)

   define aux_codcli    like fcomcpe.cp020,
          aux_descli    like fcomcli.cl020,
          hoy           date

   initialize op_val,op_sig to null

   let quit_flag = 0

   call fmanped_hide()
   call fshow(m_aceptar)
   call fshow(m_cancelar)
   if opcion = "M" then
      call fshow(m_eliminar)
   end if
   if abierto_query then
      call fshow("query")
   end if

   let hoy = f_today()

   if opcion = "N" then
      # valores por defecto
      let agrup_alb = "1"
      let r_cpe.cp050 = hoy
      let r_cpe.cp060 = hoy+1
      let r_cpe.cp070 = hoy+1
   end if

   # Activar botones
   display true to buscar_cli
   display true to buscar_alm


   input by name r_cpe.cp030,r_cpe.cp020,r_cpe.cp040,r_cpe.cp050,r_cpe.cp060, r_cpe.cp070,r_cpe.cp105,r_cpe.cp140,agrup_alb without defaults

      after field cp020 # Código cliente
         if r_cpe.cp020 is not null then
            let descli = fnomcli(r_cpe.cp020)
            if length(descli clipped) = 0 then
               call ferror(ftraduce_errs(002,"","","","",""),8)
               initialize r_cpe.cp020 to null
               display by name descli
               next field cp020
            end if
         else
            initialize descli to null
         end if
         display by name descli


      after field cp050 # Fecha Pedido
         if opcion = "M" then continue input end if
         if r_cpe.cp050 < hoy then
            call ferror(ftraduce_errs(003,"","","","",""),8)
            initialize r_cpe.cp050 to null
            next field cp050
         end if


      after field cp060 # Fecha Entrega Exigida
         if opcion = "M" then continue input end if
         if r_cpe.cp060 <= hoy then
            call ferror(ftraduce_errs(004,"","","","",""),8)
            initialize r_cpe.cp060 to null
            next field cp060
         end if

      after field cp070 # Fecha Entrega Prevista
         if opcion = "M" then continue input end if
         if r_cpe.cp070 <= hoy then
            call ferror(ftraduce_errs(005,"","","","",""),8)
            initialize r_cpe.cp070 to null
            next field cp070
         end if


      after field cp140 # Código de Almacén

      on key (f20) # Buscar Clientes
         call fquery_do(8000,fdisp_nomcol("fcomcpe","cp020"),"")
              returning sw,aux_codcli,aux_descli,cod_te1,cod_te1,cod_te1,
                           cod_te1,cod_te1,cod_te1
         if sw = 1 then
            let r_cpe.cp020 = aux_codcli
            let descli = aux_descli
            display by name r_cpe.cp020,descli
            next field cp020
         end if


      on key (f21) # Buscar almacenes


      on key (f1)              # Manual
         call fhelp_pg("admpru","mmanped")

      on key (help)            # Ayuda localizada: diccionario
         let foco = fgl_fieldfocus()
         if foco ="agrup_alb" then
            call fdichlp("fcomcpe","cp735")
         else
            call fdichlp("fcomcpe",foco)
         end if

      on key (control-y)
         call fen_el_web()

      on key (control-q)
         call facercade()

      on key (esc)             # Cancelar
         call facepta_captura(null) returning op_val,op_sig

      on key (interrupt)       # Salir (Sistema)
         call facepta_captura(fquit()) returning op_val,op_sig

      on key (control-n)       # Nuevo
         call facepta_captura(c_nue) returning op_val,op_sig

      on key (control-a)       # Modificar
         call facepta_captura(c_mod) returning op_val,op_sig

      on key (control-o)       # Consultar
         call facepta_captura(c_con) returning op_val,op_sig

      #on key (control-e)       # Eliminar
      #   if opcion = "N" then continue input end if
      #   let op_val = fbaja_{yyy}({r_yyy.campo1,r_yyy.campon})
      #   if op_val = c_ace then
      #      let op_val = c_can
      #      let op_sig = null
      #      let op_key = "f10"
      #      next key "f10"
      #   end if

      on key (control-f)
         if abierto_query then
            call facepta_captura(c_pri) returning op_val,op_sig
         end if

      on key (control-u)
         if abierto_query then
            call facepta_captura(c_ult) returning op_val,op_sig
         end if

      on key (f3)
         if abierto_query then
            call facepta_captura(c_pre) returning op_val,op_sig
         end if

      on key (f4)
         if abierto_query then
            call facepta_captura(c_sig) returning op_val,op_sig
         end if

      on key (f5)
         call facepta_captura(c_que) returning op_val,op_sig

      on key (control-r)
         if abierto_query then
            call facepta_captura(c_req) returning op_val,op_sig
         end if

#      on key (f61)
#         call facepta_captura(c_do1) returning op_val,op_sig
#      on key (f62)
#         call facepta_captura(c_do2) returning op_val,op_sig
#      on key (f63)
#         call facepta_captura(c_do3) returning op_val,op_sig
#      on key (f60)
#         call facepta_captura(c_do4) returning op_val,op_sig
#
      on key (f10)
         if op_key = "f10" then
            initialize op_key to null
            exit input
         end if

      after input
#         case
#         otherwise
            initialize op_key to null
            call fvalida_manped() returning op_val
            if op_val = c_can then continue input end if
#         end case
         let op_val = c_ace
   end input

   # Desactivar botones
   display false to buscar_cli
   display false to buscar_alm


   return op_val,op_sig

end function




private function fdisplay_manped()

   define consulta char(1)

   initialize op_val,op_sig to null

   let quit_flag = 0

   call fmanped_hide()
   call fshow(m_cancelar)
   if abierto_query then
      call fshow("query")
   end if


   input by name consulta


      on key(f1)
         call fhelp_pg("admpru","mmanped")

      on key(control-y)
         call fen_el_web()

      on key(control-q)
         call facercade()

      on key(control-a)
         let op_val = c_can
         let op_sig = c_mod
         exit input

      on key(control-o)
         let op_val = c_can
         let op_sig = c_con
         exit input


      on key(esc)
         let op_val = c_can
         let op_sig = null
         exit input

      on key(accept)

      on key(interrupt)
         let op_val = c_can
         let op_sig = fquit()
         exit input

      on key (control-r)
         if abierto_query then
            let op_val = c_can
            let op_sig = c_req
            exit input
         end if

      on key (control-f)
         if abierto_query then
            let op_val = c_can
            let op_sig = c_pri
            exit input
         end if

      on key (f3)
         if abierto_query then
            let op_val = c_can
            let op_sig = c_pre
            exit input
         end if

      on key (f4)
         if abierto_query then
            let op_val = c_can
            let op_sig = c_sig
            exit input
         end if

      on key (control-u)
         if abierto_query then
            let op_val = c_can
            let op_sig = c_ult
            exit input
         end if

      on key (f5)
         let op_val = c_can
         let op_sig = c_que
         exit input

   end input

   return op_val,op_sig

end function



###########################################
## Funciones para grabar /Eliminat datos ##
###########################################
private function fgraba_manped(opc)

   define opc     char(1)



   case
   when agrup_alb = "1"    let r_cpe.cp735 = 1
   when agrup_alb = "2"    let r_cpe.cp735 = 2
   when agrup_alb = "3"    let r_cpe.cp735 = 3
   end case


   case
   when opc = "N"

      let r_cpe.cp000 = empre

      whenever error continue
      insert into fcomcpe values(r_cpe.*)
      whenever error stop

   when opc = "M"
      whenever error continue
      update fcomcpe set * = r_cpe.*
         where cp000 = empre and
               cp010 = r_cpe.cp010
      whenever error stop
   end case




end function


#################################
## Funciones de Carga de Datos ##
#################################


private function fcarga_valores()

   whenever error continue
   select * into r_cpe.*
      from fcomcpe
         where cp000 = empre and
               cp010 = r_cpe.cp010

   whenever error stop

   let descli = fnomcli(r_cpe.cp020)

   case r_cpe.cp735
   when 1   let agrup_alb = "1"
   when 2   let agrup_alb = "2"
   when 3   let agrup_alb = "3"
   end case

   display by name r_cpe.cp020,descli,r_cpe.cp040,r_cpe.cp050,r_cpe.cp060,r_cpe.cp070,r_cpe.cp105,r_cpe.cp140,agrup_alb

end function


private function fdesped_su_pedido(codigo)

   define codigo     like fcomcpe.cp010

   define aux_desped like fcomcpe.cp030,
          sw_ok      smallint # 0- KO / 1-OK

   let sw_ok = 1 # por defecto OK

   whenever error continue
   select cp030 into aux_desped
      from fcomcpe
         where cp000 = empre and
               cp010 = codigo
   whenever error stop
   if sqlca.sqlcode = notfound then
      let sw_ok = 0 # ko
   end if

   return sw_ok,aux_desped

end function


private function fmanped_clearform()

   initialize descli to null
   initialize desalm to null
   initialize r_cpe.* to null

   display by name r_cpe.cp030,descli,desalm

end function


#############################
## Funciones de Validación ##
#############################
private function fvalida_manped()

   if r_cpe.cp030 is null then
      call ferror(fmsp_errs(003,fdisp_nomcol("fcomcpe","cp030"),"","","",""),8)
      call fgl_nextfield("cp030")
      return c_can
   end if

   if r_cpe.cp020 is null then
      call ferror(fmsp_errs(003,fdisp_nomcol("fcomcpe","cp020"),"","","",""),8)
      call fgl_nextfield("cp020")
      return c_can
   end if

   if r_cpe.cp040 is null then
      call ferror(fmsp_errs(003,fdisp_nomcol("fcomcpe","cp040"),"","","",""),8)
      call fgl_nextfield("cp040")
      return c_can
   end if

   if r_cpe.cp050 is null then
      call ferror(fmsp_errs(003,fdisp_nomcol("fcomcpe","cp050"),"","","",""),8)
      call fgl_nextfield("cp050")
      return c_can
   end if

   if r_cpe.cp060 is null then
      call ferror(fmsp_errs(003,fdisp_nomcol("fcomcpe","cp060"),"","","",""),8)
      call fgl_nextfield("cp060")
      return c_can
   end if


   if r_cpe.cp070 is null then
      call ferror(fmsp_errs(003,fdisp_nomcol("fcomcpe","cp070"),"","","",""),8)
      call fgl_nextfield("cp070")
      return c_can
   end if

##......mas validaciones


   if r_cpe.cp050 > r_cpe.cp060 then
      call ferror(ftraduce_errs(006,"","","","",""),8)
      call fgl_nextfield("cp050")
      return c_can
   end if


      if r_cpe.cp070 > r_cpe.cp060 then
      call ferror(ftraduce_errs(007,"","","","",""),8)
      call fgl_nextfield("cp070")
      return c_can
   end if

   return c_ace



end function



#########################
## funciones genéricas ##
#########################

private function fmanped_hide()

   call fhide(m_listado)
   call fhide(m_eliminar)

   call fhide("inicio")

   call fhide(m_8005N)
   call fhide(m_8052N)

end function



private function fher_manped()
   let m_8005N = fdisp_clave(8005)
   let m_8052N = fdisp_clave(8052)
end function



private function fcarga_prot()

   define titulo char(100)

   let titulo = fdime_tituprog()

   call fini_protecciones()

   # Cuando se estén protegiendo las opciones hay que tener en cuenta que
   # posteriormente al controlar el acceso a la opción correspondiente,
   # la llamada a la función fautoridad hay que hacerla con la misma letra
   # que se haya indicado aquí
   call fcarga_propro(titulo,null,-1)
   call fcarga_propro(fmsp_menu(1000),null,-2)   # Archivo
   call fcarga_propro(fmsp_menu(1010),"A",3)     # Nuevo
   call fcarga_propro(fmsp_menu(1020),"M",3)     # Modificar
   call fcarga_propro(fmsp_menu(1030),"C",3)     # Consultar
   call fcarga_propro(fmsp_menu(1040),"B",3)     # Eliminar

   call fcarga_propro(fmsp_menu(4000),null,-2)   # Herramientas
   # Al proteger las Desc.Auxiliares que se pueden modificar desde Herramientas
   # el código que se pone es:
   # MED
   # A: Si es una clave alfabética; N: Si es una clave numérica
   # El código de la descripción auxiliar, completada con 0 a la izquierda hasta
   # componer un char(6)
   call fcarga_propro(fdisp_clave(8005),"MEDN008005",3) # Texto 9999-A
   call fcarga_propro(fdisp_clave(8052),"MEDN008052",3) # Texto 9999-A

   call fman_propro()

end function



##########################
##APERTURA DE VENTANTAS ##
##########################

private function fabre_manped()

   # Abrir la ventana si no está ya abierta
   if abre_manped = 1 then
      current window is w_manped
      return
   end if

   let abre_manped = 1
   open window w_manped at 4,0
        with form "admpru_fmanped"
        attribute (border)

   call fgl_showcontrol("consulta",false)

   # Etiquetas
   display fdisp_nomcol_label("fcomcpe","cp010") to eti_cp010
   display fdisp_nomcol_label("fcomcpe","cp020") to eti_cp020
   display fdisp_nomcol_label("fcomcpe","cp040") to eti_cp040
   display fdisp_nomcol_label("fcomcpe","cp050") to eti_cp050
   display fdisp_nomcol_label("fcomcpe","cp060") to eti_cp060
   display fdisp_nomcol_label("fcomcpe","cp070") to eti_cp070
   display fdisp_nomcol_label("fcomcpe","cp105") to eti_cp105
   display fdisp_nomcol_label("fcomcpe","cp140") to eti_cp140


   #Listas
   call fcarga_liscombo("cp040",8005,"N","N",2,"N") # Clase
   call fcarga_liscombo("cp105",8052,"N","N",2,"N") # Tipo de Pedido


   #Radio
   call fgl_setcaption("agrup_alb",fdisp_desnum(1,8006,2,"N"),"1")# 1-Por Pedido
   call fgl_setcaption("agrup_alb",fdisp_desnum(2,8006,2,"N"),"2")# 2-Por Cliente
   call fgl_setcaption("agrup_alb",fdisp_desnum(3,8006,2,"N"),"3")# 3-Por Su Pedido

   #Botones
   call fcomments_buscar("buscar_ped",fdisp_nomcol("fcomcpe","cp010")) # Buscar Pedidos
   call fcomments_buscar("buscar_cli",fdisp_nomcol("fcomcpe","cp020")) # Buscar Pedidos
   call fcomments_buscar("buscar_alm",fdisp_nomcol("fcomcpe","cp140")) # Buscar Pedidos

   # Desactivar botones
   display false to buscar_cli
   display false to buscar_alm


end function



##################
## TRADUCCIONES ##
##################




private function ftraduce_errs(mensaje,p1,p2,p3,p4,p5)

   define mensaje smallint,
          p1,p2,p3,p4,p5 char(50)
   define TET char(300)

   case mensaje
   when 001 let TET="El Código de Pedido es obligatorio."
   when 002 let TET="El Cliente no existe."
   when 003 let TET="La Fecha de Pedido no puede ser anterior a hoy."
   when 004 let TET="La Fecha de Entrega Prevista no puede ser anterior a hoy."
   when 005 let TET="La Fecha de Entrega Exigida no puede ser anterior a hoy."
   when 006 let TET="La Fecha de Entrega Prevista no puede ser anterior a la Fecha de Pedido."
   when 007 let TET="La Fecha de Entrega Exigida no puede ser anterior a la Fecha de Entrega Prevista."
   otherwise let TET="ERROR"
   end case

   return ftraduce_mens_p(TET,"admpru","mmanped",p1,p2,p3,p4,p5) clipped

end function





















