accessing
contents
	^ (filesystem instVarNamed: 'store')
		nodeAt: FSPath / 'giffle'
		ifPresent: [:bytes | bytes]
		ifAbsent: [self signalFailure: 'No file!']