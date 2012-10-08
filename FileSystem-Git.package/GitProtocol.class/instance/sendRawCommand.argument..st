private
sendRawCommand: commandName argument: anArgument
	"don't automatically append a newline"
	^ self sendCommand: commandName, ' ', anArgument