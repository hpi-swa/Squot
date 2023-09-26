ui
changesTreeKeyStroke: aCharacter
	(self selectedChange ifNil: [^ self])
		keyStroke: aCharacter.