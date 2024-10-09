git porcelain - external
handleTerminalCommandTemplateCharacter: aCharacter from: aReadStream into: aWriteStream withCommand: aString
	| command replacements |
	aCharacter = ${ ifFalse: [^ aWriteStream nextPut: aCharacter].
	aReadStream peek = ${ ifTrue: [^ aWriteStream nextPut: aReadStream next].
	replacements := (aReadStream upTo: $}) splitBy: ','.
	command := aString.
	(replacements includes: 'no-key') ifFalse: [command := command, '; read -n 1 -p "Press any key to continue..."'].
	command := 'sh -c ', (GSTextUtilities quote: command).
	replacements do: [:each |
		command := self performTerminalCommandTemplateReplacement: each in: command].
	aWriteStream nextPutAll: command.