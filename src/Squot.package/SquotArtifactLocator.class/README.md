I inspect files and directories for Squot artifacts (files that represent tracked Smalltalk objects). The search algorithm is run by SquotFileSearchForArtifacts. This is necessary when a repository is inspected that does not have the Squot metadata files, such as a table of contents. So the objects must be discovered in the file tree.

My intended usage is that you create an extension method on SquotFileSystemStore with the following pragma:
	<squotArtifactLocatorFor: #ClassOfObjectsToBeFound priority: 100>
...and return an instance of me from the method. This has the store try the thus registered locator instance when searching for yet unknown artifacts.