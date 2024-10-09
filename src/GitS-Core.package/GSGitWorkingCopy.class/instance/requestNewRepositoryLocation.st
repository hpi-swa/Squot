moving
requestNewRepositoryLocation
	| start |
	start := GSPathUtilities ancestorThatExists: self fsReference.
	start := FileDirectory on: start printString.
	^ (UIManager default
		chooseDirectory: 'New repository location:'
		from: start) ifNotNil: #asFSReference