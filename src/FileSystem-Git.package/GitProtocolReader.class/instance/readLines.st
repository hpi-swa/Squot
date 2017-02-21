receiving
readLines
	^ String streamContents: [:string | self readLines: [:each | string nextPutAll: each; cr]].