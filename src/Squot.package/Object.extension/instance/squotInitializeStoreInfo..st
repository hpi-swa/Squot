*Squot
squotInitializeStoreInfo: aDictionary
	"Initialize metadata about me when stored in an artifact.
	Subclasses may override to add additional properties. Do not forget to call super!"
	aDictionary
		at: #objectClassName put: self class name;
		at: #serializer put: self squotPreferredSerializer name.
	self squotPreferredLoader ifNotNil: [:loader | aDictionary at: #loader put: loader name].
	