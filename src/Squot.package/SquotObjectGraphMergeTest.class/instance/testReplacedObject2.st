tests
testReplacedObject2
	"Capture a StringMorph whose font will be proxied."
	| stringMorph merge stringMorphMerge |
	stringMorph := StringMorph contents: 'foo' font: TextStyle defaultFont.
	merge := self mergeOf: stringMorph withChanges: [stringMorph contents: 'bar'].
	stringMorphMerge := merge mergeAt: (objectRegistry nameOf: stringMorph).
	self assert: (stringMorphMerge modifications noneSatisfy: [:each | each reference name = 'font']).