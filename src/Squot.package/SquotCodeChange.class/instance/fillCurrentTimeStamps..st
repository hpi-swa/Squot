ui
fillCurrentTimeStamps: aCollection
	| stamp |
	stamp := Utilities changeStamp.
	self sourcesIsTimeStamp doWithIndex: [:isTimeStamp :index |
		isTimeStamp ifTrue: [aCollection at: index put: stamp]].