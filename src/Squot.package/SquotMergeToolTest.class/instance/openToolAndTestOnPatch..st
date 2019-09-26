utilities
openToolAndTestOnPatch: aPatch
	"Convert patch into merge"
	| merge |
	merge := SquotMerge into: aPatch base merge: aPatch patched basedOn: aPatch base. 
	^ self openToolAndTestOn: merge