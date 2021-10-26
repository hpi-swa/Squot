comparing
newDiffFrom: aString to: aString2 
	"Do not create diffs from live objects, only from shadows"
	self flag: #stub. "Called during the comparison of SquotTrackedObjectMetadata"
	^ nil