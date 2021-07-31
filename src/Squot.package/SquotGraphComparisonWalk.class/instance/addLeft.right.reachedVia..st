enumerating
addLeft: nextLeft right: nextRight reachedVia: aReference
	"Enqueue the pair of nextLeft and nextRight to the walk."
	"The mirror for nextLeft can be missing if nextRight is now closer to the start object than before."
	| diff |
	nextLeft ~= nextRight ifFalse: "Nothing to be compared" [^ SquotDiffOfEqualObjects instance].
	(mirrors includesKey: nextLeft undecorated) ifFalse:
		["Workaround: use the mirror for nextRight. Since both are supposed to be editions of the same object, they should be of the same kind and so it should be no problem to use the same mirror for them."
		mirrors at: nextLeft undecorated put: (mirrors at: nextRight undecorated)].
	self assert: (mirrors includesKey: nextLeft undecorated);
		assert: (mirrors includesKey: nextRight undecorated).
	walk
		add: {nextLeft. nextRight}
		reachedVia: aReference.
	diff := (mirrors at: nextLeft undecorated) newDiffFrom: nextLeft to: nextRight.
	^ diff