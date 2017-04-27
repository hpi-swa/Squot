public-accessing-objects
branchNames
	| looseBranchNames packedRefs packedBranchNames |
	looseBranchNames := #().
	self headsDir exists ifTrue:
		[looseBranchNames := self headsDir allFiles
			collect: [:each | self refFromFile: each relativeTo: self headsDir]].
	packedRefs := self packedRefs.
	packedRefs ifNil: [^ looseBranchNames].
	packedBranchNames := OrderedCollection new.
	packedRefs keysAndValuesDo: [:refName :refSignature | 
		(refName beginsWith: 'refs/heads/') ifTrue: [ | branchName |
			branchName := refName allButFirst: 'refs/heads/' size.
			(looseBranchNames includes: branchName)
				ifFalse: [packedBranchNames add: branchName]]].
	^ looseBranchNames, packedBranchNames