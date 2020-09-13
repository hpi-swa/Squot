progress display
displayProgress: aString during: aBlock
	"SquotGUI displayProgress: 'Example: ' during:
		[(Delay forMilliseconds: 500) wait.
		SquotGUI updateProgress: 0.1 text: 'just starting'.
		(Delay forMilliseconds: 500) wait.
		SquotGUI updateProgress: 0.5 text: nil.
		(Delay forMilliseconds: 500) wait.
		SquotGUI updateProgress: '1.0' text: 'done'.
		(Delay forMilliseconds: 500) wait.]"
	^ aString displaySequentialProgress: aBlock