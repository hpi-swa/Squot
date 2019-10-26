testing
shouldInheritSelectors
	"Me and my subclasses should inherit selectors"
	^ (Array with: self with: self superclass) includes: SquotDiffExplorerTest