public-configuration
configAt: aNameString put: value
	| config key sectionHead subNames file sectionName |
	file := self configFile.
	config := file exists ifFalse: [INIFile new] ifTrue: [file readStreamDo: [:stream | stream ascii. INIFile readFrom: stream]].
	subNames := aNameString splitBy: '.'.
	self assert: (aNameString includes: $.) description: 'config key must include section'.
	sectionHead := subNames first.
	key := subNames last.
	sectionName := subNames size = 2 ifTrue: [sectionHead]
		ifFalse: [sectionHead, ' "', (aNameString copyFrom: sectionHead size  + 2 to: aNameString size - key size  - 1), '"'].
	config section: sectionName at: key put: value asString.
	self configFile writeStreamDo: [:stream |
		stream lineEndConvention: #lf.
		config writeOn: stream.
		stream truncate].
	^ value