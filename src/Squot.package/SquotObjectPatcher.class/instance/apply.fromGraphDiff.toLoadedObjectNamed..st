as yet unclassified
apply: aDiff fromGraphDiff: anObjectGraphDiff toLoadedObjectNamed: name
	| target |
	target := patchedObjectGraph objectNamed: name.
	self apply: aDiff toLoaded: target.