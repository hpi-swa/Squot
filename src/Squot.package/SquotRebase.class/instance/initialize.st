accessing
initialize
	super initialize.
	self
		operations: OrderedCollection new;
		labels: Dictionary new;
		refsToUpdate: Dictionary new;
		originalHeadCommit: nil.