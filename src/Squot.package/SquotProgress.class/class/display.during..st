instance creation
display: aString during: aBlock
	"SquotProgress display: 'Example: ' during:
		[:progress |
		(Delay forMilliseconds: 500) wait.
		progress update: 0.1 text: 'just starting'.
		(Delay forMilliseconds: 500) wait.
		progress update: 0.5 text: nil.
		(Delay forMilliseconds: 500) wait.
		progress update: '1.0' text: 'done'.
		(Delay forMilliseconds: 500) wait.]"
	"SquotProgress display: 'Count to three: ' during:
		[:progress | progress totalSteps: 3.
		progress stepWithText: '1'.
		(Delay forMilliseconds: 500) wait.
		progress stepWithText: '2'.
		(Delay forMilliseconds: 500) wait.
		progress stepWithText: '3'.
		(Delay forMilliseconds: 500) wait]"
	^ self new
		display: aString during: aBlock;
		yourself