private sending
encodeRawCommandLine: aCommandString
	
	"
	a Command sent to the git server has the following form:
		FFFFCommandName Arguments
		
	FFFF being the length of the whole command
	"

	self openConnection.
	^ self writePktLine: aCommandString