git porcelain - external
terminalCommand: aString
	^ '{1} sh -c ''{2}; read -n 1 -p "Press any key to continue..."''' format: {self terminalCommand. aString}