private
emptyRootCommit
	"Create a root commit for an empty repository."
	^ GitCommit new
		repository: self;
		tree: (GitTree new
			repository: self)
		yourself