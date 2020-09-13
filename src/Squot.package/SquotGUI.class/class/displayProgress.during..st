progress display
displayProgress: aString during: aBlock
	"SquotGUI displayProgress: 'Example: ' during:
		[:progress |
		(Delay forMilliseconds: 500) wait.
		progress update: 0.1 text: 'just starting'.
		(Delay forMilliseconds: 500) wait.
		progress update: 0.5 text: nil.
		(Delay forMilliseconds: 500) wait.
		progress update: '1.0' text: 'done'.
		(Delay forMilliseconds: 500) wait.]"
	"SquotGUI displayProgress: 'Count to three: ' during:
		[:progress | progress totalSteps: 3.
		progress stepWithText: '1'.
		(Delay forMilliseconds: 500) wait.
		progress stepWithText: '2'.
		(Delay forMilliseconds: 500) wait.
		progress stepWithText: '3'.
		(Delay forMilliseconds: 500) wait]"
	| progress |
	aBlock numArgs = 0
		ifTrue: [^ aString displaySequentialProgress: aBlock]
		ifFalse:
			[progress := SquotProgress new.
			^ aString displaySequentialProgress: [aBlock value: progress]]