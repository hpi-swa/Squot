converting
snapshot
	"Evaluate my blocks immediately."
	^ (self copyWithDifferentContent: self content)
		storeInfo: self storeInfo;
		yourself