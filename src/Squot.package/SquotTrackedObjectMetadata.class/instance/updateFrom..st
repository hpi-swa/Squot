patching
updateFrom: otherMetadata
	otherMetadata keysAndValuesDo: [:key :value | self at: key put: value].