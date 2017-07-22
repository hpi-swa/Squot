testing
testReplacedObject2
	"Capture a StringMorph whose font will be proxied."
	| graph stringMorph fontShadow nameOfFontObject |
	stringMorph := StringMorph contents: 'foo' font: TextStyle defaultFont.
	graph := capturer capture: stringMorph.
	nameOfFontObject := graph delegateRegistry nameOf: stringMorph font.
	fontShadow := graph shadowNamed: nameOfFontObject.
	self assert: fontShadow originalClass = stringMorph font class.
	self assert: fontShadow capturedClass ~= stringMorph font class.
	self assert: (graph objectNamed: nameOfFontObject) == stringMorph font
		description: 'object by name should answer the original object'.