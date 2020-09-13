instance creation
displayStatus: aString during: aBlock
	"SquotProgress displayStatus: 'No progress bar' during:
		[(Delay forMilliseconds: 1000) wait]"
	^ self new
		displayStatus: aString during: aBlock