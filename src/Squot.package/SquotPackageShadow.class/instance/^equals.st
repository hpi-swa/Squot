comparing
= other
	^ other packageName = packageName
		and: [(other diffToBase: self withSnapshot: snapshot) squotHasChanges not]