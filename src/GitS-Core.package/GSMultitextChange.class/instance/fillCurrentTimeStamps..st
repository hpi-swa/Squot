ui
fillCurrentTimeStamps: aCollection
	| stamp |
	stamp := Utilities changeStamp.
	self sourceIndices doWithIndex: [:isTimeStamp :index |
		(self isSourceTimeStamp: index)
			ifTrue: [aCollection at: index put: stamp]].