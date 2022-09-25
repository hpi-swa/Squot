tests
testPackageTrackedAutomaticallyOnLoad
	"When a version with a certain package is loaded and that package is already in the
	image, the patch should show that the package is being modified, not added."
	"given"
	self savePackage.
	class compileSilently: 'a ^ 2'. "to be reverted by load"
	self deny: (workingCopy includesObject: package) description: 'not untracked after setup'.
	"when"
	[workingCopy loadVersion: workingCopy loadedHistorian version interactive: true]
	"then"
		on: SquotSelectionOfChangesRequested do:
			[:request | | id |
			SquotToggles useNewApi ifTrue: [id := workingCopy project artifacts anyOne id].
			self assert: (workingCopy includesObjectAt: path)
				description: 'not automatically tracked';
				assert: (SquotToggles useNewApi
					ifTrue: [request patch hasChangesAt: id]
					ifFalse: [request patch includesDiffAt: path])
				description: 'diff of package is missing';
				deny: (SquotToggles useNewApi
					ifTrue: [request patch additions includesKey: id]
					ifFalse: [(request patch diffAt: path) isAddition])
				description: 'is addition instead of modification';
				assert: (SquotToggles useNewApi
					ifTrue: [(request patch elementMerges at: workingCopy project artifacts anyOne id) graphMerge mergeOfStartObject modifications size = 1]
					ifFalse: [(request patch diffAt: path) content startDiff operations size = 1])
				description: ['expected only 1 change, but were ', (SquotToggles useNewApi ifTrue: [(request patch elementMerges at: workingCopy project artifacts anyOne id) graphMerge mergeOfStartObject modifications size] ifFalse: [(request patch diffAt: path) content startDiff operations size])].
			request return "abort load"].
	self assert: (workingCopy objectAt: path) = package
		description: 'package was not tracked automatically'.