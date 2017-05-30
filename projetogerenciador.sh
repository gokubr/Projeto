#!/bin/bash

#Projeto de gerenciamento de arquivos,usuários,rede,dispositivos e pacotes.

#-----------------------------------------------------------------------------------
#----------------- INICIO DO CÓDIGO DE GERENCIAMENTO DE AQUIVOS -------------------
#---------------------------------------------------------------------------------
#------------------------------------------------------------------------------
#------------------------SUB MENU ARQUIVOS / DIRETORIOS-------------------------
GARQ(){
OPCAO=$(dialog								\
		--stdout						\
		--title 'Gerenciamento de Arquivos e Diretórios'	\
		--menu	'Escolha uma opção: '				\
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
#-----------------------CRIAR ARQUIVOS--------------------------------------------

CARQ(){

CRIA=$(dialog	--stdout --title 'Criar novo arquivo'				\
		--inputbox 'Digite o nome do arquivo: '	0 0)

     (dialog	--stdout --title 'Selecione o local para salvar:'		\
		--fselect /home 0 0)

DIR= /

if [ -e "$DIR$CRIA" ]; then
	       
              (dialog --title 'Atenção!'					\
		      --msgbox 'Esse arquivo já existe no sistema' 		\
		      0 0)
else
	> $CRIA
	      (dialog --title 'Parabéns!'					\
		      --msgbox 'Arquivo criado com sucesso' 			\
		      0 0)
	
fi

GARQ
}

#-----------------------------------------------------------------------------------
#----------------CRIA DIRETORIOS--------------------------------------------

CDIR(){
clear
CRIADIR=$(dialog								\
		--stdout --title 'Criar Diretório'				\
		--inputbox 'Digite o nome do Diretório: ' 0 0)
mkdir $CRIADIR
	if [ $? -ne 0 ];then GARQ 
else 	dialog --msgbox 'Criado!' 0 0
	fi && GARQ; }

#-----------------------------------------------------------------------------------
#--------------------APAGA ARQUIVOS/DIRETORIOS-----------------------------------
AARQ(){
clear
APAGA=$(dialog	--stdout --title 'Apagar arquivo'				\
		--inputbox 'Digite o nome do arquivo: '	0 0)

case $? in 1) GARQ ;; 255) GARQ ;; esac

if [ $APAGA == $CRIA ]; then
	rm -rf $APAGA 
if [ $? != $CRIA ]; then
	dialog --msgbox 'Deletado!' 0 0
fi

elif [ $APAGA == $CRIADIR ]; then
	rm -rf $APAGA
	dialog	--msgbox 'Deletado! tbm' 0 0
else 
	dialog	--msgbox 'Nao encontrado!' 0 0	
fi
GARQ
}

#-----------------------------------------------------------------------------------
#------------------------LISTA ARQUIVOS/DIRETORIOS--------------------------------
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
#------------------------RENOMEAR ARQUIVOS/DIRETORIOS---------------------------
#enter sai
RARQ(){
clear

RNOME=$(dialog									\
		--stdout --inputbox 'Digite o nome do arquivo: ' 0 0)
case $? in 1) GARQ ;; 255) GARQ ;; esac

NOVONOME=$(dialog				   				\
		--stdout --inputbox 'Digite um novo nome: ' 0 0)
case $? in 1) GARQ ;; 255) GARQ ;; esac

mv $RNOME $NOVONOME
dialog	--msgbox 'Renomeado com sucesso!' 0 0
GARQ
}

#-------------------------------------------------------------------------
#------------------------MOVER DIRETORIOS ou ARQUIVOS----------------------------

#MARQ(){
#clear
#NOME=$(dialog									\
#		--stdout							\
#		--title 'Mover Diretório'					\
#		--inputbox 'Digite o nome do Diretório: '			\
#		0 0)
#dialog	--title 'Mover'	--msgbox 'Feito!' 0 0					\
#mv $NOME
#GARQ
#}
#-----------------------------------------------------------------------------------
#------------------------MOVER ARQUIVO OU DIRETORIO----------------------------

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
	
}

#-----------------------------------------------------------------------------------
#-----------------------------------------------------------------------------------
#----------------- FIM DO CÓDIGO DE GERENCIAMENTO DE ARQUIVOS ---------------------
#-----------------------------------------------------------------------------------

#-----------------------------------------------------------------------------------
#----------------- INICIO DO CÓDIGO DE GERENCIAMENTO DE USUÁRIOS ------------------
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

PASS2=$(dialog							\
               	--stdout --title 'Alterar a senha do usuário'	\
		--passwordbox 'Digite a senha novamente:'	\
		0 0)

(echo $PASS ; echo $PASS2) | passwd $USR

                  dialog					\
		--title 'Parabéns!' 				\
		--msgbox 'Senha alterada com sucesso.' 		\
		 0 0 || dialog 
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
#------------------LISTAR GRUPOS DO SISTEMA-----------------------------------------

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
#----------------- INICIO DO CÓDIGO DE GERENCIAMENTO DE PACOTES ------------------
#---------------------------------------------------------------------------------
#------------------------SUB MENU PACOTES----------------------------------------

GPAC(){
OPCAO=$(dialog							\
		--stdout					\
		--title 'Gerenciamento de Pacotes'		\
		--menu 'Escolha uma opção: '			\
		0 0 0						\
		1 'Instalar Pacotes'				\
		2 'Remover Pacotes'				\
		3 'Atualizar Pacotes'			 	\
		4 'Sair')

case $OPCAO in
	1) IPAC ;;
	2) RPAC ;;
	3) APAC ;;
	*) MENU ;;
esac
}

#-----------------------------------------------------------------------------
#------------------------------INSTALAR PACOTES---------------------------

IPAC(){
INSTALAR=$(dialog --stdout --inputbox 'Digite um pacote' 0 0)

case $? in 1) GPAC ;; 255) GPAC ;; esac		

for i in {1..100}
do
	sleep 0.032 &&
	echo $i
done | dialog --title 'Instalando...' --guage "$INSTALAR" 10 60	
apt-get install $INSTALAR

dialog		--msgbox 'Instalado com sucesso!' 0 0
GPAC
}

#------------------------------------------------------------------------
#---------------------------REMOVER PACOTES------------------------------

RPAC(){
REMOVER=$(dialog --stdout --inputbox 'Qual pacote deseja desinstalar? ' 0 0)
case $? in 1) GPAC ;; 255) GPAC ;; esac		

for i in {1..100}
do
	sleep 0.05 &&
	echo $i
done | dialog --title "Removendo" --guage "$REMOVER" 10 60	
apt-get remove $REMOVER
				
dialog	--msgbox 'Removido com sucesso!' 0 0

GPAC
}

#------------------------------------------------------------------------
#-------------------------ATUALIZAR PACOTES------------------------------

APAC(){
ATUALIZAR=$(dialog						\
		--stdout  --yes-label Sim --no-label Não	\
		--title 'Atualizar Pacotes'			\
		--yesno 'Deseja realmente atualizar o pacote?'	\ 
		0 0)
case $? in 1) GPAC ;; 255) GPAC ;; esac		

ATUALIZAR=$?
if [ $ATUALIZAR = 0 ]; then

apt-get update $ATUALIZAR 
 
AT=$(dialog --stdout 						\
	    --title 'Atualizar'					\
	    --msgbox 'Atualizado com sucesso!'			\
	    0 0)
fi
GPAC
}

#----------------------------------------------------------------------
#---------------------------------------------------------------------------------
#----------------- FIM DO CÓDIGO DE GERENCIAMENTO DE PACOTES ------------------
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
	6 'Sair do programa')

case $OPCAO in
	1) GARQ ;;
	2) GUSR ;;
	3) GRED ;;
	4) GDIS ;;
	5) GPAC ;;
	6) FIM	;;
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
