I walk the history graph of versions. You may compare me to git-rev-list.

My interface works like a stream:
- Use nextPut: or nextPutAll: to set versions to start walking from (into the past).
- Use next, upToEnd to retrieve one or all reachable versions.
- Use upTo:, upToAnyOf: to retrieve a list of versions that does not include any of the given versions and none of their ancestors.

Instance Variables
	searchFrontier:		collection of pending versions to visit
	seen:		already visited versions
	sinkVersions:		versions whose parents shall not be inspected further
	sourceVersions:		versions from which the search starts