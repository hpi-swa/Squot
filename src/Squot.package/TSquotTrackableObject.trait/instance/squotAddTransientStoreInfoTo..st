Squot-trackable
squotAddTransientStoreInfoTo: aDictionary
	"Add properties to aDictionary that should not be stored in a repository
	because this property is only relevant in the currently running object memory.
	Don't forget to call super!"
	super squotAddTransientStoreInfoTo: aDictionary.