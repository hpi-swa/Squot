private
sendRawCommand: commandName argument: anArgument
	"don't automatically append a newline"
	^ self sendRawCommand: commandName, ' ', anArgument