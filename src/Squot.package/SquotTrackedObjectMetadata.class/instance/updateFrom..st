patching
updateFrom: otherMetadata
	"As metadata with transient properties, overwrite my properties, but preserve those transient properties."
	otherMetadata keysAndValuesDo: [:key :value | self at: key put: value].