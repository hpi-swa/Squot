showing
show: aReference
	self push: aReference.
	self whileNotDoneDo: [ | reference |
		reference := self pop.
		(self isUnmapped: reference path) ifTrue: [
			reference isFile
				ifTrue: [self block value: reference]
				ifFalse: [self pushAll: reference children]]].