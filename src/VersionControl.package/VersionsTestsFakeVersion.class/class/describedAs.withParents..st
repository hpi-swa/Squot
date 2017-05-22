instance creation
describedAs: aString withParents: aCollection
	^ self new
		text: aString;
		parents: aCollection;
		yourself