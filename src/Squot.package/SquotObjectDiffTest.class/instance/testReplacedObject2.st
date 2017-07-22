testing
testReplacedObject2
	"Capture a StringMorph whose font will be proxied."
	| stringMorph diff stringMorphDiff |
	stringMorph := StringMorph contents: 'foo' font: TextStyle defaultFont.
	diff := self diff: stringMorph againstItselfAfter: [stringMorph contents: 'bar'].
	stringMorphDiff := diff diffForObjectNamed: (objectRegistry nameOf: stringMorph).
	self deny: (stringMorphDiff slotChanges includesKey: 'font').