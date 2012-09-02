legacy
writeLegacyVersion: aVersion
	|buffer|
	"lazy... write all formats then later on decide on what to load"
	"self writeInfo: aVersion info.
	self writeLegacySnapshot: aVersion snapshot."
	
	buffer := ByteArray streamContents: [ :s|
			aVersion fileOutOn: s].
	
	(self reference / (aVersion info name, '.mcz')) writeStreamDo: [ :s| 
		s nextPutAll: buffer ].