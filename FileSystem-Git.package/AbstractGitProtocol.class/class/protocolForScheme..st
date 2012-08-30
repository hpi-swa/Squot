as yet unclassified
protocolForScheme: aScheme
	^ self allSubclasses detect: [ :class| class schemes includes: aScheme ]