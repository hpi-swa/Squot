importing
importFile: aReference getPath: aBlock
	| mapper |
	self activeWorkingCopy ifNil: [^ self inform: 'Please select a project first.'].
	mapper := (self chooseCompatibleMapper: aReference) ifNil: [^ self].
	mapper path: (aBlock value ifNil: [^ self]).
	self importMapper: mapper fromStream: aReference readStream.