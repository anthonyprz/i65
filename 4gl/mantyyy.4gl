globals
   "../admcopys/globales.4gl"

define r_cpe               record like fcomcpe.*,
       descli              like fcomcli.cl020,
       desalm              like falmpal.pa010,
       agrup_alb           char(1)

define abre_antyyy         smallint
define abierto_query       smallint


define ult_clave1 like fxxxyyy.yy010,        # Ultimo "clave1-clave2"
       ult_clave2 like fxxxyyy.yy020
define nuevo_doc char(50)

#define cp030              char(50)



function fantyyy()

   # Inicializar las variables principales
   let abre_antyyy = 0
   #initialize ult_{clave1},ult_{clave2} to null
   let abierto_query = 0
   #let abierto_{query_conjunto} = 0

   call fopen_escritorio()
   # Cargar los últimos 4 documentos
 #  call fdoc_antyyy()

   # Definir las opciones específicas del programa
 #  call fher_antyyy()

   menu "" #PROGRAMA DE PRUEBA "Poner el titulo al que se corresponde el programa
      before menu
         call fantyyy_hide()
         ## Activar las opciones del menú que puedan estar activas
         call fshow(m_nuevo)
         #call fshow(m_listado)
         #call fshow(m_{Nº Descripción Auxiliar}{A:Alfabética/N:Numérica}
         if usu_gem = admuser then call fshow(m_protecciones) end if

      popup m_archivo
         command key (control-n) m_nuevo bitmap "bot_nuevo"
            call fmenu_opciones(c_nue)
         command key (control-a) m_modificar bitmap "bot_modif"
            #call fmenu_opciones(c_mod)
         command key (control-o) m_consultar bitmap "bot_consul"
            #call fmenu_opciones(c_con)
         command key (control-e) m_eliminar bitmap "bot_elim"
         command key (control-k) m_listado
            #call fmenu_opciones(c_lis)
         command "---"
         command key (accept)    m_aceptar bitmap "bot_guardar"
         command key (esc)       m_cancelar bitmap "bot_cancel"
         command "---"
         command key (control-j) m_configurar
         command key (control-p) m_imprimir bitmap "bot_impr"
         command key (control-w) m_vista_previa
         command "---"
         command key (control-s) m_enviar
         command m_separador
         #command key (f61) {docyyy}[1]
            #call fmenu_opciones({c_do1})
         #command key (f62) {docyyy}[2]
            #call fmenu_opciones({c_do2})
         #command key (f63) {docyyy}[3]
            #call fmenu_opciones({c_do3})
         #command key (f60) {docyyy}[4]
            #call fmenu_opciones({c_do4})
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
 #        command m_{Nº Descripción Auxiliar}{A:Alfabética/N:Numérica}
 #           call fmodif_text({Nº Descripción Auxiliar},{"A":Alfabética/"N":Numérica})  # Mantenimiento de la descripción auxiliar
         #command "---"
         command key (control-t) m_protecciones
            if usu_gem = admuser then
               call fcarga_prot()
            end if
      end popup

      popup m_ayuda
         command key (f1) m_ayuda_de bitmap "bot_ayuda"
            call fhelp_pg("admpru","mantyyy")#siempre la carpeta del modulo y el Main <m------> sin (.4gl)
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
#   define codclave1 like {tabla.campo},
#          codclave2 like {tabla.campo}

   let op_ant = c_con

   while true

      initialize op_sig to null
      case
      when op_act = c_nue
         if fautoridad(ref_opc,"A") then let op_sig = fnuevo_antyyy() end if
         let op_ant = c_nue

#      when op_act = c_mod
       #  if fautoridad(ref_opc,"M") then let op_sig = fmodif_antyyy() end if
 #        let op_ant = c_mod
 #     when op_act = c_con
       #  if fautoridad(ref_opc,"C") then let op_sig =  fcons_antyyy() end if
         {if op_sig = c_mod then
            let ult_clave1 = r_yyy.yy010
            let ult_clave2 = r_yyy.yy020
         end if}
#         let op_ant = c_con
 #     when op_act = c_lis
        { if abre_antyyy = 1 then
            close window w_antyyy
            let abre_antyyy = 0
         end if}

       #  if fautoridad(ref_opc,"L") then let op_sig = flist_antyyy() end if
        # let op_ant = c_lis
      when op_act = c_int
         call ffinishlog()
         exit program
      when op_act = c_do1 or op_act = c_do2 or op_act = c_do3 or op_act = c_do4
        { case
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
         end case}
        # select {campo1} from {tabla}
        #    where {campo1} = {empresa} and
        #          {campo2} = codclave1 and
        #          {campo3} = codclave2
         #if status = notfound then
            #let op_sig = c_nue
         #else
            #if op_ant = c_mod then
               #let op_sig = c_mod
            #else
               #let op_sig = c_con
            #end if
         #end if
         #let ult_clave1 = codclave1
         #let ult_clave2 = codclave2
      otherwise
         if abre_antyyy = 1 then
            close window w_antyyy
            let abre_antyyy = 0
         end if
         exit while
      end case

      let op_act = op_sig

   end while

   # Se debe activar el menú. Debe ir lo mismo que se tiene en el "before menu"

   call fantyyy_hide()
     #para que al darle a la X vuelva a activar la opcion nuevo
   call fshow(m_nuevo)
   #PRUEBA para que al dar a nuevo desactive los botones de anterior y siguiente
   #let abierto_query = 0

 #  call fshow(m_listado)
 #  call fshow(m_{Nº Descripción Auxiliar}{A:Alfabética/N:Numérica})
   if usu_gem = admuser then call fshow(m_protecciones) end if

  # call fdoc_antyyy()
 #  initialize ult_clave1,ult_clave2 to null

end function



private function fnuevo_antyyy()

   call fabre_antyyy()
   call ftitulo(fmsp_text(021,"","","","",""))

   while true

 #     call fdoc_antyyy()

      initialize r_cpe.* to null

    #  if ult_clave1 is null or ult_clave2 is null then
         #if ult_clave1 is not null then
            #let r_yyy.yy010 = ult_clave1
            #initialize ult_clave1 to null
         #end if
        # call fcap_antyyy("N") returning op_val,op_sig,op_sig,r_yyy.yy010,r_yyy.yy020 #problem here
        call fcap_antyyy("N") returning op_val,op_sig
      #else
         #let r_yyy.yy010  = ult_clave1
         #let r_yyy.yy020 = ult_clave2 = ult_clave2
         #initialize ult_clave1,ult_clave2 to null
         #let op_val = c_ace
      #end if

      if op_val = c_can then
         clear form
        # call fmanyyy_clearform()
         exit while
      end if
#------------------------------------------------------
      display by name r_cpe.cp010
      #display by name r_cpe.cp010,r_cpe.cp030#,desped
#------------------------------------------------------

      select *
         from fcomcpe
         where cp000 = empre and
               cp010 = r_cpe.cp010

      if sqlca.sqlcode <> notfound then
                        # mensaje La información YA EXISTE
         call ferror(fmsp_errs(001,"","","","",""),8)
         clear form
      #   call fmanyyy_clearform()
         continue while
      end if

      call finput_antyyy("N") returning op_val,op_sig

    {  if op_val = c_ace then

         call fgraba_yyy(r_yyy.*)

         call fnew_cod(tty,9999,"",r_yyy.yy010)

         let nuevo_doc = r_yyy.yy010 using "#####&","-",r_yyy.yy020 clipped
         call fnew_doc(empre,nuevo_doc)
      end if
}
      clear form
#      call fmanyyy_clearform()
 #     let abierto_query = 0

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




private function fcap_antyyy(opcion)

   define opcion char(1)

   define aux_codped      like fcomcpe.cp010,
          aux_desped      like fcomcpe.cp030,
          sw_ok         smallint

   initialize op_val,op_sig to null

   let quit_flag = 0

   # Activar las opciones que estén activas en la captura de la clave
   call fantyyy_hide()
 #  call fshow(m_listado)
   call fshow(m_aceptar)
   call fshow(m_cancelar)
#   call fshow(m_repetir_codigo)
   if abierto_query then
      call fshow("query")
   end if

                 #la etiqueta en la pantalla fantyyy.per
   input by name r_cpe.cp010 without defaults

      #after field cp010
         #if r_cpe.cp010 is not null then
            ##obtener el valor
            #call fdame_des_cp010(r_cpe.cp010) returning sw_ok, aux_desped
               #if sw_ok= 1 then #ok
                  #let cp030 = aux_desped
               #else             #ko                 listo
                  #initialize r_cpe.cp010 to null     #listo
               #end if                              #listo
         #else
            ##limpiar el valor de la descripcion
            #initialize r_cpe.cp030 to null
         #end if
      ##displayarlo
      #display by name cp030 #listo
      after field cp010
               if r_cpe.cp010 is not null then
                  call fdesped_su_pedido(r_cpe.cp010) returning sw_ok,aux_desped
                  if sw_ok = 0 then # No existe
                  call ferror("sw_ok = 0",9)
                     if opcion <>"N" then # En la opción nuevo no debe existir, eso es lo correcto
                        initialize r_cpe.cp010 to null
                        let r_cpe.cp030 = aux_desped

                     end if
                  else              # Si existe
                     let r_cpe.cp030 = aux_desped
                  end if
               else
               call ferror("sw_ok = 1",9)
                  initialize r_cpe.cp030 to null
               end if
         display by name r_cpe.cp010,r_cpe.cp030


      on key (f1)
         call fhelp_pg("admpru","mantyyy")#siempre la carpeta del modulo y el Main <m------> sin (.4gl)
      on key (help)
         call fdichlp("fcomcpe",fgl_fieldfocus())
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

     # on key (f2)
         #call flast_cod(tty,8004) returning sw,r_cpe.cp010
         #if r_cpe.cp010 is not null then
            #let op_val = c_ace
            #let op_sig = null
            #exit input
         #end if

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
         #call fquery_do(8004,fdisp_nomtab("fcomcpe"),"P") #busqueda asociada a fcomcpe = 8004
         call fquery_do(8004,fdisp_nomcol("fcomcpe","cp010"),"P")
              returning sw,aux_codped,cod_te1,cod_te1,cod_te1,cod_te1,
                           cod_te1,cod_te1,cod_te1
         if sw = 1 then
            let abierto_query = 1
            let r_cpe.cp010 = aux_codped
            #-----------------------------------------
             call fdesped_su_pedido(r_cpe.cp010) returning sw,aux_desped
                        if sw = 0 then # ko
                           initialize r_cpe.cp010 to null
                        else
                           let r_cpe.cp030 = aux_desped
            end if
            #-----------------------------------------
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

#cliente = 8000
#almacen = 1503

function finput_antyyy(opcion)

   define opcion      char(1) # "M" --> Modificar
                              # "N" --> Nuevo

   define aux_codcli         like fcomcpe.cp020,
          aux_descli         like fcomcli.cl020

#   define aux_descli         char(50)

#   define aux_codalm        like fcomcpe.cp140
#   define aux_descodalm     char(50)



   initialize op_val,op_sig to null

   let quit_flag = 0

   call fantyyy_hide()
   call fshow(m_aceptar)
   call fshow(m_cancelar)

   display true to buscar_cli
   display true to buscar_alm

   if abierto_query then
      call fshow("query")
   end if
   #definir el orden de la tabulacion de los campos
   #input by name r_cpe.cp030,r_cpe.cp020,r_cpe.cp040,r_cpe.cp050,r_cpe.cp060,
   #              r_cpe.cp070,r_cpe.cp105,r_cpe.cp140,agrup_alb without defaults

   input by name r_cpe.cp030,r_cpe.cp020,r_cpe.cp040,r_cpe.cp050,r_cpe.cp060,
                 r_cpe.cp070,r_cpe.cp105,r_cpe.cp140,agrup_alb without defaults

      on key (f1)              # Manual
         call fhelp_pg("admpru","mantyy")
      on key (help)            # Ayuda localizada: diccionario
         if fgl_fieldfocus() = "agrup_alb" then
            call fdichlp("fcomcpe","cp735")
          else
         call fdichlp("fcomcpe",fgl_fieldfocus())
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
         #if opcion = "N" then continue input end if
         #let op_val = fbaja_antyyy({r_yyy.campo1,r_yyy.campon})
         #if op_val = c_ace then
            #let op_val = c_can
            #let op_sig = null
            #let op_key = "f10"
            #next key "f10"
         #end if
      #on key (control-k)       # Listado
      #   call facepta_captura(c_lis) returning op_val,op_sig
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
      on key (f61)
         call facepta_captura(c_do1) returning op_val,op_sig
      on key (f62)
         call facepta_captura(c_do2) returning op_val,op_sig
      on key (f63)
         call facepta_captura(c_do3) returning op_val,op_sig
      on key (f60)
         call facepta_captura(c_do4) returning op_val,op_sig

      on key (f10)
         if op_key = "f10" then
            initialize op_key to null
            exit input
         end if

      on key (f20)#Buscar Clientes
               call fquery_do(8000,fdisp_nomcol("fcomcpe","cp020"),"") #busqueda asociada a fcomcpe = 8000
                    returning sw,aux_codcli,aux_descli,cod_te1,cod_te1,cod_te1,
                                 cod_te1,cod_te1,cod_te1
               if sw = 1 then
                  #let abierto_query = 1
                  let r_cpe.cp020 = aux_codcli
                  let descli = aux_descli
                  display by name r_cpe.cp020,descli
               end if

          #on key (f21)#Buscar almacen
                        #call fquery_do(1503,fdisp_nomtab("falmpal"),"") #busqueda asociada a fcomcpe = 1503
                             #returning sw,aux_codalm,aux_descodalm,cod_te1,cod_te1,cod_te1,
                                          #cod_te1,cod_te1,cod_te1
                        #if sw = 1 then
                           ##let abierto_query = 1
                           #let r_cpe.cp140 = aux_codalm
                           #let des_cp140 = aux_descodalm
                           #display by name r_cpe.cp140,des_cp140
         #end if




      after input
         #case
         #otherwise
            #initialize op_key to null
            #call fvalida_antyyy() returning op_val
            #if op_val = c_can then continue input end if
         #end case
         let op_val = c_ace
   end input
   display false to buscar_cli
   display false to buscar_alm

   return op_val,op_sig

end function


#########################
##Otras funciones########
#########################
   #private function fdame_des_cp010(codped)
      #define codped     like fcomcpe.cp010
      #define desped     like fcomcpe.cp030,
             #sw_ok      smallint

      #let sw_ok = 1
      #whenever error continue
         #select cp030 into desped
          #from fcomcpe
           #where cp000 = empre and
                 #cp010 = codped
      #whenever error stop

      #if sqlca.sqlcode = notfound then
         #call ferror(fmsp_errs(002,"","","","",""),8)
         #let sw_ok = 0
      #end if
      #return sw_ok, desped

   #end function
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



#########################
## funciones genéricas ##
#########################

private function fantyyy_hide()


   #call fhide(m_nuevo) #prueba

   # Opciones principales
   call fhide(m_nuevo)
   call fhide(m_modificar)
   call fhide(m_consultar)
   call fhide(m_eliminar)
   call fhide(m_listado)


   # Opciones de botonera
   call fhide("inicio")

   # Otras opciones
   #call fhide(m_9999A) # Descripciones auxiliares en Herramientas

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
   call fcarga_propro(fmsp_menu(1050),"L",3)     # Listado

   #call fcarga_propro(fmsp_menu(4000),null,-2)   # Herramientas
   # Al proteger las Desc.Auxiliares que se pueden modificar desde Herramientas
   # el código que se pone es:
   # MED
   # A: Si es una clave alfabética; N: Si es una clave numérica
   # El código de la descripción auxiliar, completada con 0 a la izquierda hasta
   # componer un char(6)
   #call fcarga_propro(fdisp_clave1({Nº Descripcion Auxiliar}),{"MEDA009999"},3) # Texto 9999-A

   call fman_propro()

end function





##########################
##APERTURA DE VENTANTAS ##
##########################

private function fabre_antyyy()

   # Abrir la ventana si no está ya abierta
   if abre_antyyy = 1 then
      current window is w_antyyy
      return
   end if

   let abre_antyyy = 1
   open window w_antyyy at 4,0
        with form "admpru_fantyyy"
        attribute (border)

   #etiqueta de la pantalla



#para escribir texto en una etiqueta las etiquetas
   display fdisp_nomcol_label("fcomcpe","cp010") to eti_cp010 #pedido
   display fdisp_nomcol_label("fcomcpe","cp020") to eti_cp020 #cliente
   display fdisp_nomcol_label("fcomcpe","cp040") to eti_cp040 #Clase
   display fdisp_nomcol_label("fcomcpe","cp050") to eti_cp050#F.Pedido

   display fdisp_nomcol_label("fcomcpe","cp060") to eti_cp060#F.Exigido
   display fdisp_nomcol_label("fcomcpe","cp070") to eti_cp070#F.previsto
   display fdisp_nomcol_label("fcomcpe","cp105") to eti_cp105#Tipo de pedido
   display fdisp_nomcol_label("fcomcpe","cp140") to eti_cp140 #almacen
#FIN texto en etiquetas


#datos en los campos a rellenar

   call fcomments_buscar("buscarped", fdisp_nomtab("fcomcpe")) #cabecera de pedido ???
   call fcomments_buscar("buscar_cli", fdisp_nomtab("fcomcli"))
   #call fgl_setcomments("buscarped", ftraduce_text(001,"","","","",""))
   #call fgl_setcomments("buscar_cli", ftraduce_text(001,"","","","",""))


   #call fcarga_liscombo({"lista"},{D.A.},{"N"/"A"},{Nulo:"N"/"S"},{Orden: 1/2/3/4},{Cod y Desc:"S"/"N"})
   #lista desplegable 8005-N
   call fcarga_liscombo("cp040",8005,"N","N",2,"N")#Clase
   #lista desplegable 8052-N
   call fcarga_liscombo("cp105",8052,"N","N",2,"N") #Tipo de pedido

   #aqui estan los radio buttons
   call fgl_setcaption("cp735",fdisp_desnum(1,8006,2,"N"),1)#por pedido
   call fgl_setcaption("cp735",fdisp_desnum(2,8006,2,"N"),2)#por cliente
   call fgl_setcaption("cp735",fdisp_desnum(3,8006,2,"N"),3)#por su pedido
# FIN datos en los campos a rellenar

   #desactivar botones
   display false to buscar_cli
   display false to buscar_alm


end function






###############
#TRADICCUIONES#
###############



private function ftraduce_errs(mensaje,p1,p2,p3,p4,p5)

   define mensaje smallint,
          p1,p2,p3,p4,p5 char(50)
   define TET char(300)

   case mensaje
   when 001 let TET="El Código de Pedido es obligatorio."
   otherwise let TET="ERROR"
   end case

   return ftraduce_mens_p(TET,"admpru","mantyy",p1,p2,p3,p4,p5) clipped

end function






private function ftraduce_text(mensaje,p1,p2,p3,p4,p5)

   define mensaje smallint,
          p1,p2,p3,p4,p5 char(50)
   define TTT char(300)

   case mensaje
   when 001 let TTT="Buscar Pedido."
   otherwise let TTT="ERROR"
   end case

   return ftraduce_mens_p(TTT,"admpru","mantyy",p1,p2,p3,p4,p5) clipped

end function




