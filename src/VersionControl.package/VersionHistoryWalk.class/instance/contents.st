accessing
contents
	| newWalk |
	newWalk := self class new
		excludeAncestorsOfAll: sinkVersions;
		nextPutAll: sourceVersions;
		yourself.
	^ newWalk upToEnd
		