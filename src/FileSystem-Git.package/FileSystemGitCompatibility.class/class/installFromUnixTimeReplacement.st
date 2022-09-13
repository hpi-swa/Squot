installing
installFromUnixTimeReplacement
	"self installFromUnixTimeReplacement"
	| stamp |
	stamp := self category, ' ', (Utilities changeStampPerSe copyAfter: Character space).
	DateAndTime class
		compile: (self class >> #fromUnixTime:) getSourceFromFile
		classified: '*', self category, '-override'
		withStamp: stamp
		notifying: nil.