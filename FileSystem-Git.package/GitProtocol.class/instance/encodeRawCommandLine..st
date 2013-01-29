accessing
encodeRawCommandLine: aCommandString
	
	"
	a Command sent to the git server has the following form:
		FFFFCommandName Arguments
	"

	self openConnection.
	^ self writePktLine: aCommandString