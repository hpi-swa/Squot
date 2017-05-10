as yet unclassified
createNewRandomBranch
	| randomName |
	workingCopy / 'aFile' writeStreamDo: [:stream | stream nextPutAll: 'new file'].
	randomName := String streamContents: [:str |
		32 timesRepeat: [str nextPut: '0123456789abcdef' atRandom]].
	workingCopy branch: randomName message: 'random commit'.
	^ 'refs/heads/', randomName