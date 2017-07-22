as yet unclassified
mergeWith: otherMetadata
	otherMetadata keysAndValuesDo: [:key :value | self at: key put: value].