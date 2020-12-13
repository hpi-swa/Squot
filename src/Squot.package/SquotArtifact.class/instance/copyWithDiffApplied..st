copying
copyWithDiffApplied: aDiff
	self flag: #encapsulation. "Law of demeter violated on aDiff."
	^ self shallowCopy
		setContent: (aDiff content squotApplyTo: self content)
		storeInfo: (aDiff metadata squotApplyTo: self storeInfo);
		yourself