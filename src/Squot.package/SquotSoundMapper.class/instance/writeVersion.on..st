version-io
writeVersion: aSound on: aStream
	aSound
		perform: ('store{1}SamplesOn:' format: {self encoding}) asSymbol
		with: aStream.