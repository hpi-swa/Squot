private receiving
fourByteLookahead
	^ fourByteLookahead ifNil: [ fourByteLookahead := self stream next: 4 ]