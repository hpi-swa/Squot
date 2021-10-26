private
addDiffsToGraphDiff
	(objectDiffs select: [:each | each squotHasChanges])
		keysAndValuesDo:
			[:shadow :diff |
			graphDiff addDiff: diff forObjectNamed: (left nameOf: shadow).
			self noteChanged: shadow].