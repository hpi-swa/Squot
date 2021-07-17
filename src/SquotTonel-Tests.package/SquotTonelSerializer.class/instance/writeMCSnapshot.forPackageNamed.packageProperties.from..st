serializing
writeMCSnapshot: aMonticelloSnapshot forPackageNamed: aString packageProperties: aDictionary from: anArtifact
	directory ensureDirectory / 'package.st' writeStreamDo:
		[:file | "Write package properties in advance, to the TonelWriter will pick up some settings."
		file nextPutAll: 'Package '.
		STON put: aDictionary onStream: file.
		file cr.
		self flag: #duplication. "TonelWriter>>writePackage:"].
	self writeMCSnapshot: aMonticelloSnapshot forPackageNamed: aString from: anArtifact.