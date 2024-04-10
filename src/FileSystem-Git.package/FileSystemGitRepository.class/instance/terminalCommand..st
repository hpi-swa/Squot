git porcelain - external
terminalCommand: aString
	| template |
	template := self terminalCommand readStream.
	^ String streamContents: [:stream |
		[template atEnd] whileFalse: [
			self
				handleTerminalCommandTemplateCharacter: template next
				from: template
				into: stream
				withCommand: aString]]