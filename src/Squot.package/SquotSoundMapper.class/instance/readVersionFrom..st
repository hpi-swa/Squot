version-io
readVersionFrom: aStream
	^ SampledSound
		perform: ('from{1}Stream:' format: {self encoding}) asSymbol
		with: aStream