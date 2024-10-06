parsing
fromInstVarStream: aStream oldVersion: aNumber
	"to be implemented by future updates for backwards-compatibility"
	self error: ('Unknown old version {1}' format: {aNumber}).