resolving conflicts
resetChoice
	choice := nil.
	previousContent ifNotNil: 
		[content := previousContent.
		previousContent := nil].
	resetBlock value.