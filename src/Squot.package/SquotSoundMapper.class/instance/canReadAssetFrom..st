version-io
canReadAssetFrom: aStream
	^ SampledSound
		perform: ('canRead{1}Stream:' format: {self encoding}) asSymbol
		with: aStream