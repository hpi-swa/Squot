migrations
migrateMaterialized: anObject
	(anObject class name = 'AnObsoleteSquotAnimation') ifTrue: [^ self obsoleteSquotAnimationAsAssetFile: anObject].
	^ super migrateMaterialized: anObject