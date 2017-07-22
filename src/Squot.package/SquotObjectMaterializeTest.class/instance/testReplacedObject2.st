testing
testReplacedObject2
	"Capture a StringMorph whose font will be proxied."
	| stringMorph restored |
	stringMorph := StringMorph contents: 'foo' font: TextStyle defaultFont.
	restored := self captureAndRestoreWithoutEqualityTest: stringMorph.
	self assert: stringMorph font == restored font.