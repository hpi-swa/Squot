moving
requestNewRepositoryLocation
	| start |
	start := SquotPathUtilities ancestorThatExists: self fsReference.
	start := FileDirectory on: start printString.
	^ (UIManager default
		chooseDirectory: 'New repository location:'
		from: start) ifNotNil: #asFSReference