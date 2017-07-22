testing
testReplacedObject2
	"Patch a StringMorph whose font will be proxied."
	| stringMorph1 stringMorph2 |
	stringMorph1 := StringMorph contents: 'foo' font: TextStyle defaultFont.
	stringMorph2 := StringMorph contents: 'bar' font: TextStyle defaultFont.
	self patch: stringMorph1 to: stringMorph2.
	self assert: stringMorph1 font == stringMorph2 font.