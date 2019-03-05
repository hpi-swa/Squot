I keep a list of objects that can find artifacts in a file tree.

Classes that can locate artifacts should register an instance of themselves like this:

	SquotArtifactLocatorRegistry current add: self new