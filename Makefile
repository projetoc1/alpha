SEGNIX= ./Segnix
NAVIOAUX= ./NavioAux
AUX= ./teste
BOARD= Raspberry_Pi_Model_BPlus
#BOARD= Raspberry_Pi_Rv2
all:
	
	git clone https://github.com/emlid/Navio2.git
	git clone https://github.com/itead/Segnix.git
#	git clone https://github.com/wilsons1978/teste.git
	#git clone https://github.com/gpogor/teste.git # comentado por Luis
	git clone https://projetoc1@github.com/projetoc1/NavAux.git # nova versao NavAux
	sudo cp $(AUX)/Segnix-master/Makefile -r -f $(SEGNIX)/Makefile
	sudo cp $(AUX)/Segnix-master/lib/c/itead_serial.c -r -f $(SEGNIX)/lib/cpp/itead_serial.c
	sudo cp $(AUX)/Segnix-master/lib/cpp/itead_serial.cpp -r -f $(SEGNIX)/lib/cpp/itead_serial.cpp
	sudo cp $(AUX)/Segnix-master/libraries/itead_Nextion/NexHardware.cpp -r -f $(SEGNIX)/libraries/itead_Nextion/NexHardware.cpp
	sudo cp $(AUX)/Segnix-master/libraries/itead_Nextion/NexVariable.cpp -r -f $(SEGNIX)/libraries/itead_Nextion/NexVariable.cpp
	sudo cp $(AUX)/Segnix-master/libraries/itead_Nextion/NexVariable.h -r -f $(SEGNIX)/libraries/itead_Nextion/NexVariable.h
	sudo cp $(AUX)/Segnix-master/libraries/itead_Nextion/Nextion.h -r -f $(SEGNIX)/libraries/itead_Nextion/Nextion.h
	sudo cp $(AUX)/Segnix-master/libraries/itead_Nextion/Makefile -r -f $(SEGNIX)/libraries/itead_Nextion/Makefile

	#sudo cp $(AUX)/NavioAux/Backup/config.txt -r -f /boot/config.txt
	sudo cp $(AUX)/NavioAux -r -f $(NAVIOAUX)
	#sudo cp $(AUX)/main.cpp -r -f main.cpp # comentado por Luis
	#sudo cp $(AUX)/Makefile -r -f Makefile # comentado por Luis
	sudo rm -r $(AUX)
	sudo chown pi:pi -R *
	
	$(MAKE) -C $(SEGNIX) $(BOARD)
	$(MAKE) -C $(SEGNIX)
	$(MAKE) -C $(SEGNIX) install
