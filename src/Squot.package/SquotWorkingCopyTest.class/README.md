I test that working copy operations work with a certain repository type. Subclass me.
See SquotWorkingCopyTest targetClass how you can name my subclasses or overwrite it in yours.

Instance Variables
	workingCopy 		SquotWorkingCopy on which the tests will be run, see #newWorkingCopy
	classFactory 		used to create temporary classes during tests
	repositoryDirectory 	reference to the directory where a repository is initialized, see #repositoryRootDirectory
	repository 			repository created for the tests, see #newRepository
	store 				Store that is used to create snapshots during tests, see #newStore