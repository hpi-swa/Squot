reflection
reflect: aCollectionElementOrDictionaryEntry removeFrom: aDictionary
	"Remove the reference from the object."
	^ aCollectionElementOrDictionaryEntry removeFrom: aDictionary reflectedIn: self
		