*Squot-trackable
squotRemoveTransientStoreInfoFrom: aDictionary
	"Remove properties from aDictionary that should not be stored in a repository
	because this property is only relevant in the currently running object memory.
	Override in subclasses if appropriate.
	Don't forget to call super, in case something is added here!"