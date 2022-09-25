tests
testObjects
	"Graph merge records all changes to objects and knows of transitive/deep changes."
	| a b c shadow1 shadow2 merge mergeOfC |
	a := SquotObjectForDiffTests new var1: nil; var2: nil.
	b := SquotObjectForDiffTests new var1: 1; var2: 2.
	c := SquotObjectForDiffTests new var1: a; var2: b.
	shadow1 := capturer captureGraph: c.
	b var1: 3.
	shadow2 := capturer captureGraph: c.
	merge := shadow1 squotMergeWith: shadow2 basedOn: shadow1.
	self assert: merge hasChanges.
	mergeOfC := merge mergeOfStartObject.
	self assert: (mergeOfC modifications anySatisfy: [:each | each reference name = 'var2']). "deep change marker"
	self deny: (merge includesModificationAt: (objectRegistry nameOf: a)).
	self deny: (mergeOfC modifications anySatisfy: [:each | each reference name = 'var1']).
	self assert: (merge includesMergeAt: (objectRegistry nameOf: b)).