*Squot-Tools
squotChangeAsStringOrText
	| stream workingText incomingText |
	stream := WriteStream on: (Text new: 100).
	working do: [:each | stream nextPutAll: each; cr].
	workingText := stream contents.
	stream reset.
	incoming do: [:each | stream nextPutAll: each; cr].
	incomingText := stream contents.
	stream reset.
	stream nextPutAll: 'Different load orders:'; cr;
		nextPutAll: ((TextDiffBuilder buildDisplayPatchFrom: workingText to: incomingText) addAttribute: (TextIndent amount: 1)).
	stream nextPutAll: 'In working copy:'; cr; nextPutAll: (workingText copy addAttribute: (TextIndent amount: 1)).
	stream nextPutAll: 'In incoming version:'; cr; nextPutAll: (incomingText copy addAttribute: (TextIndent amount: 1)).
	^ stream contents