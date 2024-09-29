comparing
peekForNewLine: aStream
	"matches and consumes CR, LF, or CRLF"
	^ (aStream peekFor: Character cr) | (aStream peekFor: Character lf)