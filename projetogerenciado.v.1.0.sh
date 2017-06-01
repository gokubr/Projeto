#!/bin/bash

#Projeto de gerenciamento de arquivos,usuários,rede,dispositivos e pacotes.

#-----------------------------------------------------------------------------------
#-------------- INICIO DO CÓDIGO DE GERENCIAMENTO DE ARQUIVOS/DIRETÓRIOS -----------
#---------------------------------------------------------------------------------
#------------------------------------------------------------------------------
#------------------------ SUB MENU ARQUIVOS / DIRETORIOS -------------------------

GARQ(){
OPCAO=$(dialog								\
		--stdout						\
		--title 'Gerenciamento de Arquivos e Diretórios'	\
		--menu	'Escolha uma opção:'				\
		0 0 0							\
		1 'Criar arquvivo'					\
		2 'Apagar arquivo' 					\
		3 'Listar arquivos'					\
		4 'Renomear arquivo'					\
		5 'Mover arquivo'					\
		6 'Criar diretório' 					\
		7 'Apagar diretório'					\
		8 'Listar diretórios'				        \
		9 'Renomear diretório'					\
		10 'Mover diretório'					\
		11 'Voltar')

case $OPCAO in
	1) CARQ ;;
	2) AARQ ;;
	3) LARQ ;;
	4) RARQ ;;
	5) MARQ ;;
	6) CDIR ;;
	7) ADIR ;;
	8) LDIR ;;
	9) RDIR ;;
	10) MDIR ;;
	11) MENU ;;
	*) MENU ;;
esac
}

#---------------------------------------------------------------------------------
#----------------------- CRIAR ARQUIVOS -------------------------------------------

CARQ(){

CRIA=$(dialog	--stdout --title 'Criar novo arquivo'				\
		--inputbox 'Digite o nome do arquivo: '	0 0)

case $? in 1) GARQ ;; 255) GARQ ;; esac

LOCAL=$(dialog	--stdout --title 'Selecione o local para salvar:'		\
		--fselect /home/ 0 0)

case $? in 1) GARQ ;; 255) GARQ ;; esac


if [ -e "$LOCAL$CRIA" ]; then
	
              (dialog --title 'Atenção!'					\
		      --msgbox 'Esse arquivo já existe nesse diretório.'	\
		      0 0)
else
	> $LOCAL$CRIA
	      (dialog --title 'Parabéns!'					\
		      --msgbox 'Arquivo criado com sucesso.' 			\
		      0 0)
	
fi

GARQ
}

#-----------------------------------------------------------------------------------
#------------------------------ APAGAR ARQUIVOS ----------------------------------
AARQ(){

APAGA=$(dialog	--stdout --title 'Apagar arquivo'				\
		--inputbox 'Digite o nome do arquivo: '	0 0)

case $? in 1) GARQ ;; 255) GARQ ;; esac

LOCAL=$(dialog	--stdout --title 'Selecione o local do arquivo:'		\
		--fselect /home/ 0 0)

case $? in 1) GARQ ;; 255) GARQ ;; esac

rm -r $LOCAL$APAGA 2> /tmp/erro.txt
erro=$(cat /tmp/erro.txt)
[ -z $erro ] && dialog						\
		--title 'Parabéns!' 				\
		--msgbox 'Arquivo deletado com sucesso.' 	\
		 0 0 || dialog --title 'Atenção'		\
				 --msgbox "$erro" 0 0; rm /tmp/erro.txt

GARQ
}

#-----------------------------------------------------------------------------------
#------------------------LISTAR ARQUIVOS --------------------------------
#enter sai
#LARQ(){
#LIST=$(dialog 									\
#		--stdout --title 'Visualizar Arquivos / Diretorios'		\
#		--inputbox 'Digite o nome' 0 0)
#case $? in 1) GARQ ;; 255) GARQ ;; esac
#ls
#}
#GARQ
#enter sai
LARQ(){
LIST=$(dialog 									\
		--stdout --inputbox 'Digite o nome do arquivo' 0 0)
case $? in 1) GARQ ;; 255) GARQ ;; esac

LOCAL=$(dialog --stdout --inputbox 'Digite o Local do arquivo' 0 0) rm -rf

$LOCAL/$NOME PRESSIONE MENU

SUCESSO=$(dialog --stdout				\
		--title 'Listado'			\
		--msgbox 'Listado com sucesso!'		\
		0 0)				

GARQ
}

#----------------------------------------------------------------------------
#------------------------ RENOMEAR ARQUIVOS ---------------------------

RARQ(){
NOME=$(dialog	--stdout --title 'Renomear arquivo'				\
		--inputbox 'Digite o nome do arquivo: ' 0 0)

case $? in 1) GARQ ;; 255) GARQ ;; esac

NOVONOME=$(dialog --stdout --title 'Renomear arquivo'				\
		  --inputbox 'Digite o novo nome do arquivo: ' 0 0)

case $? in 1) GARQ ;; 255) GARQ ;; esac

mv $NOME $NOVONOME 2> /tmp/erro.txt
erro=$(cat /tmp/erro.txt)
[ -z $erro ] && dialog						\
		--title 'Parabéns!' 				\
		--msgbox 'Arquivo renomeado com sucesso.' 	\
		 0 0 || dialog --title 'Atenção'		\
				 --msgbox "$erro" 0 0; rm /tmp/erro.txt

GARQ
}

#-----------------------------------------------------------------------------------
#------------------------ MOVER ARQUIVOS----------------------------------------

MARQ(){
	
	MARQ=$(dialog 						\
	--stdout --title 'Mover Arquivo'			\
	--inputbox 'Digite o nome do Arquivo: '			\	
	0 0)
	
	NOME=$(dialog						\
	--stdout --title 'Mover Diretório'			\
	--inputbox 'Digite o nome do Diretório: '		\
		0 0)
mv $NOME $MARQ
GARQ


MARQ=$(dialog	--stdout --title 'Apagar arquivo'				\
		--inputbox 'Digite o nome do arquivo: '	0 0)

case $? in 1) GARQ ;; 255) GARQ ;; esac

     (dialog	--stdout --title 'Selecione o local do arquivo:'		\
		--fselect /home 0 0)

case $? in 1) GARQ ;; 255) GARQ ;; esac

rm -r $APAGA 2> /tmp/erro.txt
erro=$(cat /tmp/erro.txt)
[ -z $erro ] && dialog						\
		--title 'Parabéns!' 				\
		--msgbox 'Arquivo deletado com sucesso.' 	\
		 0 0 || dialog --title 'Atenção'		\
				 --msgbox "$erro" 0 0; rm /tmp/erro.txt

GARQ
}


#-----------------------------------------------------------------------------------
#--------------------- CRIAR DIRETORIOS--------------------------------------------

CDIR(){

CRIADIR=$(dialog --stdout --title 'Criar novo diretório'			\
		 --inputbox 'Digite o nome do diretório: '	0 0)

case $? in 1) GARQ ;; 255) GARQ ;; esac

LOCAL=$(dialog --stdout --title 'Selecione o local para salvar:'		\
		 --fselect /home/ 0 0)

case $? in 1) GARQ ;; 255) GARQ ;; esac


mkdir $LOCAL$CRIADIR 2> /tmp/erro.txt
erro=$(cat /tmp/erro.txt)
[ -z $erro ] && dialog						\
		--title 'Parabéns!' 				\
		--msgbox 'Diretório criado com sucesso.' 	\
		 0 0 || dialog --title 'Atenção'		\
				 --msgbox "$erro" 0 0; rm /tmp/erro.txt

GARQ
}

#-----------------------------------------------------------------------------------
#------------------------------ APAGAR DIRETÓRIOS ----------------------------------
ADIR(){

APAGADIR=$(dialog --stdout --title 'Apagar diretório'				\
		  --inputbox 'Digite o nome do diretório:'	0 0)

case $? in 1) GARQ ;; 255) GARQ ;; esac

LOCAL=$(dialog	--stdout --title 'Selecione o local do diretório:'		\
		--fselect /home 0 0)

case $? in 1) GARQ ;; 255) GARQ ;; esac

rmdir $LOCAL$APAGADIR 2> /tmp/erro.txt
erro=$(cat /tmp/erro.txt)
[ -z $erro ] && dialog						\
		--title 'Parabéns!' 				\
		--msgbox 'Diretório deletado com sucesso.' 	\
		 0 0 || dialog --title 'Atenção'		\
				 --msgbox "$erro" 0 0; rm /tmp/erro.txt

GARQ
}

#-----------------------------------------------------------------------------------
#------------------------LISTAR DIRETÓRIOS --------------------------------
#enter sai
#LARQ(){
#LIST=$(dialog 									\
#		--stdout --title 'Visualizar Arquivos / Diretorios'		\
#		--inputbox 'Digite o nome' 0 0)
#case $? in 1) GARQ ;; 255) GARQ ;; esac
#ls
#}
#GARQ
#enter sai
LARQ(){
LIST=$(dialog 									\
		--stdout --inputbox 'Digite o nome do arquivo' 0 0)
case $? in 1) GARQ ;; 255) GARQ ;; esac

LOCAL=$(dialog --stdout --inputbox 'Digite o Local do arquivo' 0 0) rm -rf

$LOCAL/$NOME PRESSIONE MENU

SUCESSO=$(dialog --stdout				\
		--title 'Listado'			\
		--msgbox 'Listado com sucesso!'		\
		0 0)				

GARQ
}

#-----------------------------------------------------------------------------------
#------------------------ RENOMEAR DIRETÓRIOS ---------------------------

RDIR(){

RNOME=$(dialog	--stdout --title 'Renomear diretório'				\
		--inputbox 'Digite o nome do diretório: ' 0 0)

case $? in 1) GARQ ;; 255) GARQ ;; esac

NOVONOME=$(dialog --stdout --title 'Renomear diretório'				\
		  --inputbox 'Digite o novo nome do diretório: ' 0 0)

case $? in 1) GARQ ;; 255) GARQ ;; esac

mv $RNOME $NOVONOME 2> /tmp/erro.txt
erro=$(cat /tmp/erro.txt)
[ -z $erro ] && dialog						\
		--title 'Parabéns!' 				\
		--msgbox 'Diretório renomeado com sucesso.' 	\
		 0 0 || dialog --title 'Atenção'		\
				 --msgbox "$erro" 0 0; rm /tmp/erro.txt

GARQ
}

#-----------------------------------------------------------------------------------
#------------------------ MOVER DIRETÓRIOS ----------------------------------------

MDIR(){
	
	MARQ=$(dialog 						\
	--stdout --title 'Mover Arquivo'			\
	--inputbox 'Digite o nome do Arquivo: '			\	
	0 0)
	
	NOME=$(dialog						\
	--stdout --title 'Mover Diretório'			\
	--inputbox 'Digite o nome do Diretório: '		\
		0 0)
mv $NOME $MARQ
GARQ
	
}

#-----------------------------------------------------------------------------------
#-----------------------------------------------------------------------------------
#-------------- FIM DO CÓDIGO DE GERENCIAMENTO DE ARQUIVOS/DIRETÓRIOS ---------------
#-----------------------------------------------------------------------------------

#-----------------------------------------------------------------------------------
#----------------- INICIO DO CÓDIGO DE GERENCIAMENTO DE USUÁRIOS/GRUPOS -------------
#----------------------------------------------------------------------------------
#----------------------------------------------------------------------------------
#-------------------SUB MENU USUÁRIO-----------------------------------------------

GUSR() {
USER=$(dialog							\
	--stdout						\
        --title 'Gerenciamento de Usuários e Grupos'            \
        --menu 'Escolha uma opção:' 0 0 0			\
	1 'Criar usuário'					\
	2 'Deletar usuário'					\
	3 'Alterar a senha do usuário'                          \
	4 'Listar usuários do sistema'				\
	5 'Criar grupo'						\
	6 'Deletar grupo'					\
	7 'Listar grupos do sistema'				\
	8 'Adicionar usuário a um grupo'			\
	9 'Remover usuário de um grupo'				\
	10 'Voltar')						\
	

case $USER in
	1) CUSR ;;
	2) DUSR ;;
	3) PUSR ;;
	4) LUSR ;;
	5) CGRU ;;
	6) DGRU ;;
	7) LGRU ;;
	8) AGRU ;;
	9) RGRU ;;
	10) MENU ;;
	*) dialog ; MENU ;;
esac
} 

#-----------------------------------------------------------------------------------
#-----------------------------CRIAR USUÁRIO-----------------------------------------

CUSR(){

NUSER=$(dialog  						\
		--stdout --title 'Criar novo usuário'		\
		--inputbox 'Digite o nome do usuário:'		\
		0 0)

case $? in 1) GUSR ;; 255) GUSR ;; esac

useradd $NUSER 2> /tmp/erro.txt
erro=$(cat /tmp/erro.txt)
[ -z $erro ] && dialog						\
		--title 'Parabéns!' 				\
		--msgbox 'Usuário criado com sucesso.' 		\
		0 0 || dialog --title 'Atenção'			\
				 --msgbox "$erro" 0 0; rm /tmp/erro.txt

GUSR

}

#-----------------------------------------------------------------------------------
#------------------DELETAR USUÁRIO-----------------------------------------

DUSR(){
DUSER=$(dialog  						\
		--stdout --title 'Deletar usuário'		\
		--inputbox 'Digite o nome do usuário:'		\
		0 0)

case $? in 1) GUSR ;; 255) GUSR ;; esac

userdel $DUSER 2> /tmp/erro.txt
erro=$(cat /tmp/erro.txt)
[ -z $erro ] && dialog						\
		--title 'Parabéns!' 				\
		--msgbox 'Usuário deletado com sucesso.' 	\
		 0 0 || dialog --title 'Atenção'		\
				 --msgbox "$erro" 0 0; rm /tmp/erro.txt
GUSR
}

#-----------------------------------------------------------------------------------
#------------------ALTERAR A SENHA DO USUÁRIO-----------------------------------------

PUSR(){
USR=$(dialog  						        \
		--stdout --title 'Alterar a senha do usuário'	\
		--inputbox 'Digite o nome do usuário:'		\
		0 0)

case $? in 1) GUSR ;; 255) GUSR ;; esac

PASS=$(dialog							\
               	--stdout --title 'Alterar a senha do usuário'	\
		--passwordbox 'Digite a senha:'		        \
		0 0)

case $? in 1) GUSR ;; 255) GUSR ;; esac

PASS2=$(dialog							\
               	--stdout --title 'Alterar a senha do usuário'	\
		--inputbox 'Digite a senha novamente:'	\
		0 0)

case $? in 1) GUSR ;; 255) GUSR ;; esac

(echo $PASS ; echo $PASS2) | passwd $USR
           
if ["$PASS == $PASS2" ]; then 

	(dialog						\
	--title 'Parabéns!' 				\
	--msgbox 'Senha alterada com sucesso.' 		\
	 0 0)	

   (dialog --yes-label Sim --no-label Não --yesno 'Senhas incorretas!' \
     0 0)
    entrada=$? 
	if (( $emtrada == 0 )); then
		USR
	  else
		GUSR
	  	
 fi  	
  
	
fi

GUSR
}

#-----------------------------------------------------------------------------------
#------------------LISTAR USUÁRIOS DO SISTEMA-----------------------------------------

LUSR(){
        tail -f /etc/passwd > out &
	dialog							\
		--title 'Listando todos os usuários'		\
		--tailbox out					\
		0 0
GUSR
}

#-----------------------------------------------------------------------------------
#------------------CRIAR GRUPO-----------------------------------------

CGRU(){

NGRUP=$(dialog  						\
		--stdout --title 'Criar novo grupo'		\
		--inputbox 'Digite o nome do grupo:'		\
		0 0)
case $? in 1) GUSR ;; 255) GUSR ;; esac

groupadd $NGRUP 2> /tmp/erro.txt
erro=$(cat /tmp/erro.txt)
[ -z $erro ] && dialog						\
		--title 'Parabéns!' 				\
		--msgbox 'Grupo criado com sucesso.' 		\
		 0 0 || dialog --title 'Atenção'		\
				 --msgbox "$erro" 0 0; rm /tmp/erro.txt
GUSR
}

#-----------------------------------------------------------------------------------
#------------------DELETAR GRUPO-----------------------------------------

DGRU(){

DGRUP=$(dialog  						\
		--stdout --title 'Deletar grupo'		\
		--inputbox 'Digite o nome do grupo:'		\
		0 0)
case $? in 1) GUSR ;; 255) GUSR ;; esac

groupdel $DGRUP 2> /tmp/erro.txt
erro=$(cat /tmp/erro.txt)
[ -z $erro ] && dialog						\
		--title 'Parabéns!' 				\
		--msgbox 'Grupo deletado com sucesso.' 	 	\
		 0 0 || dialog --title 'Atenção'		\
				 --msgbox "$erro" 0 0; rm /tmp/erro.txt
GUSR
}

#-----------------------------------------------------------------------------------
#------------------ LISTAR GRUPOS DO SISTEMA-----------------------------------------

LGRU(){
        tail -f /etc/group > out &
	dialog							\
		--title 'Listando todos os grupos'		\
		--tailbox out					\
		0 0
GUSR
}

#-----------------------------------------------------------------------------------
#------------------ADICIONAR USUÁRIO A UM GRUPO---------------------------------------


AGRU(){    
USR=$(dialog							        \
		--stdout						\
		--title 'Adicionar usuário'				\
		--inputbox 'Digite o nome do usuário:'		        \
		0 0)
case $? in 1) GUSR ;; 255) GUSR ;; esac
GRU=$(dialog								\
		--stdout						\
		--title 'Selecionar grupo'				\
		--inputbox 'Digite o nome do grupo:'			\
		0 0)
case $? in 1) GUSR ;; 255) GUSR ;; esac

gpasswd -a $USR $GRU 2> /tmp/erro.txt
erro=$(cat /tmp/erro.txt)
[ -z $erro ] && dialog							\
		--title 'Parabéns!' 					\
		--msgbox 'Usuário adicionado com sucesso.'  	 	\
		0 0 || dialog --title 'Atenção'				\
				 --msgbox "$erro" 0 0; rm /tmp/erro.txt
GUSR
}

#-----------------------------------------------------------------------------------
#------------------REMOVER USUÁRIO DE UM GRUPO---------------------------------------

RGRU(){
USR=$(dialog							        \
		--stdout						\
		--title 'Remover usuário'				\
		--inputbox 'Digite o nome do usuário:'		        \
		0 0)
case $? in 1) GUSR ;; 255) GUSR ;; esac
GRU=$(dialog								\
		--stdout						\
		--title 'Selecionar grupo'				\
		--inputbox 'Digite o nome do grupo:'			\
		0 0)
case $? in 1) GUSR ;; 255) GUSR ;; esac

gpasswd -d $USR $GRU 2> /tmp/erro.txt
erro=$(cat /tmp/erro.txt)
[ -z $erro ] && dialog							\
		--title 'Parabéns!' 					\
		--msgbox 'Usuário removido com sucesso.'   	 	\
		   0 0 || dialog --title 'Atenção'			\
				 --msgbox "$erro" 0 0; rm /tmp/erro.txt

GUSR
}

#-----------------------------------------------------------------------------------
#---------------------------------------------------------------------------------
#----------------- FIM DO CÓDIGO DE GERENCIAMENTO DE USUÁRIOS ------------------
#---------------------------------------------------------------------------------

#---------------------------------------------------------------------------------
#--------------- INICIO DO CÓDIGO DE GERENCIAMENTO DE DISPOSITIVOS -------------
#---------------------------------------------------------------------------------
#-----------------------------------------------------------------------
#---------------------------SUB MENU DISPOSITIVO----------------------
#--------------------------------------------------------------------
#---------------------------------------------------------------------

GDIS(){

POPO=$(dialog							\
	--stdout						\
	--title 'MENU'						\
	--menu 'Gerenciamento de dispositvos:' 0 0 0 		\
	1 'Unidades de disco'					\
	2 'Partições'						\
	3 'Mapeamento de dispositivos'				\
	4 'voltar'						)

case $POPO in
	1) COCO  ;;
	2) CACA	 ;;
	3) FEZES ;;
	4) dialog ; MENU ;;
	*) dialog ; MENU ;;
esac
}

#--------------------------------------------------------------------------
#------------------- MAPEAMNETO DO SISTEMA ------------------------------------

FEZES(){
	cat /proc/cpuinfo > out &
	dialog							\
		--title 'listando dispositivos'			\
		--tailbox out					\
		0 0
GDIS
}

#--------------------------------------------------------------------------
#------------------------ LISTANDO PARTIÇÕES DO SISTEMA -------------------------

CACA(){
	cat /proc/partitions > out &
	dialog							\
		--title 'listando partições'			\
		--tailbox out					\
		0 0
GDIS
}

#--------------------------------------------------------------------------
#---------------------------- LISTANDO HD ----------------------------------

COCO(){
	df -h > out &
	dialog							\
		--title 'listando partições de discos'		\
		--tailbox out					\
		0 0
GDIS
}

#---------------------------------------------------------------------------------
#----------------- FIM DO CÓDIGO DE GERENCIAMENTO DE DISPOSITIVOS ------------------
#---------------------------------------------------------------------------------
	
#---------------------------------------------------------------------------------
#----------------- INICIO DO CÓDIGO DE GERENCIAMENTO DE PACOTES ------------------
#---------------------------------------------------------------------------------
#------------------------SUB MENU PACOTES----------------------------------------

GPAC(){
OPCAO=$(dialog						\
	--stdout					\
	--title " Gerenciamento de Pacote "		\
	--menu "Escolha abaixo"				\
	0 0 0						\
	1 "Instalar Pacote"				\
	2 "Remover Pacote"				\
	3 "Listar Pacote"				\
	4 "Atualizar Pacote"				\
	5 "Sair")

case $OPCAO in
	1) IPAC ;;
	2) RPAC ;;
	3) LPAC ;;
	4) APAC ;;
	5) clear; exit 0 ;;
esac

GPAC
}


#---------------------------------------------------------
#---------------------INSTALAR PACOTE---------------------

IPAC(){
INSTA=$( dialog						\
	--stdout					\
	--title " Instalação de pacote "		\
	--inputbox " Qual pacote deseja instalar? "	\
	0 0)
case $? in 1) GPAC ;; 255) GPAC ;; esac
IPAC2
}

IPAC2(){
	dialog						\
	--title " Instalando... "			\
	--infobox " Aguarde... "			\
	0 0
case $? in 1) GPAC ;; 255) GPAC ;; esac

	apt-get install $INSTA &> /dev/null 
	IPAC3

}

IPAC3(){
	dialog						\
	--title " Sucesso! "				\
	--msgbox "$INSTA Instalado com sucesso"		\
	0 0
	GPAC
}

#--------------------------------------------------------
#---------------------REMOVER PACOTE---------------------

RPAC(){
REM=$(dialog						\
	--stdout					\
	--title " Removendo Pacote "			\
	--inputbox "Qual pacote deseja remover?"	\
	0 0)
case $? in 1) GPAC ;; 255) GPAC ;; esac
REM2
}

REM2(){
	dialog						\
	--stdout					\
	--title " Removendo... "			\
	--infobox " Aguarde um instante... "		\
	0 0
case $? in 1) GPAC ;; 255) GPAC ;; esac

	apt-get remove $REM &> /dev/null 		\
	sleep 2
	REM3
}

REM3(){
	apt-get purge -y $REM &> /dev/null
	sleep 2
	REM4
}

REM4(){
	dialog						\
	--title " Sucesso! "				\
	--msgbox "$REM Removido com sucesso!"		\
	0 0
	GPAC

}

#--------------------------------------------------------
#----------------------LISTA PACOTE----------------------

LPAC(){
	apt list --installed > /tmp/aptlist.txt
	cat -n /tmp/aptlist.txt > /tmp/aptlist2.txt
	dialog						\
	--textbox /tmp/aptlist2.txt			\
	20  70
case $? in 1) GPAC ;; 255) GPAC ;; esac
GPAC
}

#-------------------------------------------------------
#---------------------ATUALIZAR PACOTE------------------

APAC(){
ATU=$(dialog --stdout					\
	--title " Atualizar Pacote "			\
	--yesno "Atualizar Pacote do sistema"		\
	0 0)
case $? in 1) GPAC ;; 255) GPAC ;; esac

ATU=$?
if [ $? == 0 ]; then

dialog 	--infobox "Aguarde um instante..." 0 0

apt-get update &> /dev/null

case $? in 1) GPAC ;; 255) GPAC ;; esac
	dialog						\
	--infobox "Atualizado com sucesso!"		\
	0 0
	sleep 2
	GPAC
else
GPAC
fi
}

#-------------------------------------------------------------------------------
#---------------------------------------------------------------------------------
#----------------- FIM DO CÓDIGO DE GERENCIAMENTO DE PACOTES ------------------
#---------------------------------------------------------------------------------

#-------------------------------------------------------------------------------
#---------------------------------------------------------------------------------
#----------------- INICIO DO CÓDIGO DE INFO. DO SISTEMA -------------------------
#---------------------------------------------------------------------------------
#---------------------------- SUB MENU INFO. DO SISTEMA --------------------------
#-------------------------------------------------------------------------------

INFO(){
OPCAO=$(dialog							\
		--stdout					\
		--title 'Informações do sistema'		\
		--menu 'Escolha uma opção: '			\
		0 0 0						\
		1 'Calendário'					\
		2 'Horário'					\
		3 'Informações de Login'			\
		4 'Voltar')

case $OPCAO in
	1) CONFD ;;
	2) CONFH ;;
	3) INFOL ;;
	4) MENU ;;
	*) MENU ;;
esac
}

#-------------------------------------------------------------------------------
#---------------------------- CALENDÁRIO --------------------------

CONFD(){
	(dialog	--title 'Calendário' --calendar ' ' 0 0)	\

case $? in 1) INFO ;; 255) INFO ;; esac	

INFO	
}

#-------------------------------------------------------------------------------
#--------------------------- HORÁRIO ------------------------------------------

CONFH(){
	(dialog	--title 'Ajuste o Relógio' 			\
		--timebox '\nDICA: Use as setas e o TAB' 0 0)		

case $? in 1) INFO ;; 255) INFO ;; esac	

INFO	
}

#-------------------------------------------------------------------------------
#------------------------INFO. DE LOGIN ------------------------------------------

INFOL(){
	(dialog	--title 'Usuário logado no momento' 			\
		--msgbox who -la 0 0)		

case $? in 1) INFO ;; 255) INFO ;; esac	

INFO	
}

#-------------------------------------------------------------------------------
#---------------------------------------------------------------------------------
#----------------- FIM DO CÓDIGO DE INFO. DO SISTEMA -------------------------
#---------------------------------------------------------------------------------

#------------------------------------------------------------------------------
#---------------------MENU PRINCIPAL--------------------------------------------
#-------------------------------------------------------------------------------

MENU(){
OPCAO=$(dialog						\
	--stdout --title 'MENU'				\
	--menu 'Escolha uma opção do menu: '		\
	0 0 0						\
	1 'Gerenciar Arquivos / Diretórios'		\
	2 'Gerenciar Usuarios / Grupos'			\
	3 'Gerenciar Rede'				\
	4 'Gerenciar Dispositivos'			\
	5 'Gerenciar Pacotes'				\
	6 'Informações do sistema'			\
	7 'Sair do programa')

case $OPCAO in
	1) GARQ ;;
	2) GUSR ;;
	3) GRED ;;
	4) GDIS ;;
	5) GPAC ;;
	6) INFO ;;
	7) FIM	;;
	*) FIM ;;
esac
}
#-------------------------------------------------------------------------------
#------------------------ FIM DO MENU PRINCIPAL --------------------------------
#-------------------------------------------------------------------------------

#-------------------------------------------------------------------------------
#---------------------- FIM DO PROGRAMA------------------------------------------

FIM(){ (dialog								\
	--stdout --title 'Finalizado'					\
	--msgbox 'Até breve. Volte sempre!' 	   			\
	  0 0)
	exit 0
}

#-------------------------------------------------------------------------------
#-------------------------------------------------------------------------------

#-------------------------------------------------------------------------------
#-----------------------------USUARIO E SENHA / TELA INICIAL--------------------

USER=""
PASS=""
USUARIO=$(dialog							\
		--stdout						\
		--title 'Usuário'					\
		--inputbox 'Digite o nome do seu usuário: '		\
		0 0)
case $? in 1) FIM ;; 255) FIM ;; esac

SENHA=$(dialog								\
		--stdout						\
		--title 'Senha'						\
		--passwordbox ' Digite a sua senha: '			\
		0 0)
case $? in 1) FIM ;; 255) FIM ;; esac
[ $USUARIO == $USER ] && [ $SENHA == $PASS ] && MENU || FIM

#-------------------------------------------------------------------------------
#-------------------------------------------------------------------------------
