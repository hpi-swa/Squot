accessing
update: aSymbol
	self specSelector ifNotNil: [aSymbol = self specSelector ifTrue: [self rebuild]].