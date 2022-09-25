tests
testByteArray
	| array other holder merge |
	holder := ValueHolder new.
	"{1. 2} <=> {1. 2}"
	array := #[1 2].
	other := #[1 2] copy.
	holder contents: array.
	merge := self mergeOf: holder withChanges: [holder contents: nil "work around equals check in ValueHolder"; contents: other].
	self deny: (merge includesModificationAt: (objectRegistry nameOf: array)).
	"{2. 1} <=> {1. 2}"
	merge := self mergeOf: holder withChanges: [other swap: 1 with: 2].
	self assert: (merge includesModificationAt: (objectRegistry nameOf: other));
		assert: (merge incoming shadowNamed: (objectRegistry nameOf: other)) equals: (merge mergeAt: (objectRegistry nameOf: other)) result.