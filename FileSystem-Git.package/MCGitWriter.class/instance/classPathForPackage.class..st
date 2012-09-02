accessing
classPathForPackage: packageName class: className
	|path|
	
	path := self reference.
	
	($- split: packageName) do: [ :categorySegment|
		path := path / categorySegment].
	
	path := path / className, 'class'.
	path ensureDirectory.
	
	^ path