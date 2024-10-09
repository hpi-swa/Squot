importing
importFile: aReference getPath: aBlock
	| mapper |
	self activeWorkingCopyIfNilInformAnd: [^ self].
	mapper := (self chooseCompatibleMapper: aReference) ifNil: [^ self].
	mapper path: (aBlock value ifNil: [^ self]).
	self importMapper: mapper fromStream: aReference readStream.