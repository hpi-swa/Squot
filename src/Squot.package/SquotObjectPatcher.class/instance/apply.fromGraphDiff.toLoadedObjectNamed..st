as yet unclassified
apply: aDiff fromGraphDiff: anObjectGraphDiff toLoadedObjectNamed: name
	| target |
	target := patchedObjectGraph objectAt: name.
	self apply: aDiff toLoaded: target.