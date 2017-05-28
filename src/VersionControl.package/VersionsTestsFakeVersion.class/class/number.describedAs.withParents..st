instance creation
number: aNumber describedAs: aString withParents: aCollection
	^ self new
		number: aNumber;
		text: aString;
		parents: aCollection;
		yourself