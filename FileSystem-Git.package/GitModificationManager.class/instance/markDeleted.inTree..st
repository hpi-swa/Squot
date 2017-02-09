accessing
markDeleted: aPath inTree: aTree
	aPath isRoot ifTrue: [self halt].
	hasChanges := true.
	
	"remove any children of the deleted path"
	deletedPaths keysAndValuesRemove: [ :key :paths | paths includesSubPath: aPath].
	
	"forget aPath's trees and subtrees so they do not get reused"
	treeMap keysAndValuesRemove: [:eachPath :tree | aPath contains: eachPath].
	treeMap removeKey: aPath ifAbsent: [].
	aTree removeEntryAt: aPath basename ifAbsent: [].
	
	"collect a list of deleted paths"
	(deletedPaths
		at: aPath parent
		ifAbsentPut: [ GitSetWrapper new]) 
			add: aPath.
	
	createdPaths
		at: aPath parent
		ifPresent: [:set | set remove: aPath ifAbsent: []].