as yet unclassified
apply: aDiff fromGraphDiff: anObjectGraphDiff toLoadedObjectNamed: name
	| target |
	target := objectRegistry at: name.
	self apply: aDiff toLoaded: target.