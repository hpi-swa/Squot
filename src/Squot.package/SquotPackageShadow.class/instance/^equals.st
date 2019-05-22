comparing
= other
	^ other packageName = packageName
		and: [(other diffWithLeftSnapshot: snapshot) squotHasChanges not]