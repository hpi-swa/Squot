comparing
hash
	| hash sizeWithoutExcludedProperties |
	hash := self species hash.
	sizeWithoutExcludedProperties := self size.
	self size <= 10 ifTrue:
		[self associationsDo:
			[:assoc |
			assoc key ~= #objectsReplacedByNames
				ifTrue: [	hash := hash bitXor: assoc value hash]
				ifFalse: [sizeWithoutExcludedProperties := sizeWithoutExcludedProperties - 1]]].
	^hash bitXor: sizeWithoutExcludedProperties hash