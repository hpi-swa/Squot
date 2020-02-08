accessing
contents
	| newWalk |
	newWalk := self class new
		excludeAncestorsOfAll: sinkVersions;
		addStarts: sourceVersions;
		yourself.
	^ newWalk upToEnd
		