objects
allObjects
	"You should not use this, it can load a huge amount of data at once."
	| all |
	all := Dictionary new.
	self objectCache hashesWithObjectsDo: [:hash :each | all at: hash put: each].
	objectStores do: [:each |
		each objectNamesDo: [:eachHash |
			(all includesKey: eachHash)
				ifFalse: [all at: eachHash put: (self objectNamed: eachHash)]]].
	^ all values asOrderedCollection