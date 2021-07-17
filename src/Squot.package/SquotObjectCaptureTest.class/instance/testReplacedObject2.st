testing
testReplacedObject2
	"Capture a StringMorph whose font will be proxied."
	| graph stringMorph fontShadow nameOfFontObject |
	stringMorph := StringMorph contents: 'foo' font: TextStyle defaultFont.
	graph := capturer captureGraph: stringMorph.
	nameOfFontObject := graph delegateRegistry nameOf: stringMorph font.
	fontShadow := graph shadowNamed: nameOfFontObject.
	self assert: fontShadow value class ~= stringMorph font class;
		deny: (fontShadow isMemberOf: SquotObjectShadow).
	self assert: (graph objectNamed: nameOfFontObject) == stringMorph font
		description: 'object by name should answer the original object'.