public
referenceTo: aResolvable 
	"Answer a reference to the argument from the context of the receiver filesystem.  	Example: FSFilesystem onDisk referenceTo: 'plonk.taz'"

	^ FSReference 
		filesystem: self
		path: (self pathFromObject: aResolvable)