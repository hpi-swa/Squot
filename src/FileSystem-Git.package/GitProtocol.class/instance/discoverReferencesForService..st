private
discoverReferencesForService: aServiceName
	| null |
	self openConnection.
	null := Character null asString.
	writer
		writeCommand: aServiceName
		arguments: (self repository, null, self hostInformation, null)
		withLineTerminator: false.
	self flush.
	refs := reader parseReferenceDiscoveryResponse.
	^ refs