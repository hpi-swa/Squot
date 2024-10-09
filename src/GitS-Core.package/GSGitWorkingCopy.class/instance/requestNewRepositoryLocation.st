moving
requestNewRepositoryLocation
	| start |
	start := GSPathUtilities ancestorOf: self fsReference that: #isDirectory.
	start := FileDirectory on: start printString.
	^ (UIManager default
		chooseDirectory: 'New repository location:'
		from: start) ifNotNil: #asFSReference