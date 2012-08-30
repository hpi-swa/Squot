accessing
dependencies
	^ dependencies ifNil: [ dependencies := self loadDependencies ]