*Squot-Tools
squotChangeAsStringOrText
	| stream workingText incomingText |
	SquotToggles useNewApi ifTrue: [self flag: #todo. "Must show something readable instead of UUIDs. Also during id changes the new ids are shown even though they will not get used."].
	stream := WriteStream on: (Text new: 100).
	working do: [:each | stream nextPutAll: each asStringOrText; cr].
	workingText := stream contents.
	stream reset.
	incoming do: [:each | stream nextPutAll: each asStringOrText; cr].
	incomingText := stream contents.
	stream reset.
	stream nextPutAll: 'Different load orders:'; cr;
		nextPutAll: ((TextDiffBuilder buildDisplayPatchFrom: workingText to: incomingText) addAttribute: (TextIndent amount: 1)).
	stream nextPutAll: 'In working copy:'; cr; nextPutAll: (workingText copy addAttribute: (TextIndent amount: 1)).
	stream nextPutAll: 'In incoming version:'; cr; nextPutAll: (incomingText copy addAttribute: (TextIndent amount: 1)).
	^ stream contents