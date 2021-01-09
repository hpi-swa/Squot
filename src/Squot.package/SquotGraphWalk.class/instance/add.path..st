adding
add: anObject path: aCollection
	"Schedule anObject to be visited during the walk. The object was reached by following the references in aCollection."
	toBeVisited add: anObject.
	paths at: anObject put: aCollection.
	referrers at: aCollection put: latest.