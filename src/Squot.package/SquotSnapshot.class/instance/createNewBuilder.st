patching
createNewBuilder
	"Answer a builder for a new snapshot that initially has all my artifacts."
	^ self class builder
		addAll: artifacts values;
		loadOrder: self loadOrder;
		yourself