tests
testReplacedObject2
	"Capture a StringMorph whose font will be proxied."
	| stringMorph restored |
	stringMorph := StringMorph contents: 'foo' font: TextStyle defaultFont.
	restored := self captureAndRestore: stringMorph.
	self assert: stringMorph font == restored font.