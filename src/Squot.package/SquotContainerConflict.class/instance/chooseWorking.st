merging
chooseWorking
	"Keep changes in the working copy."
	resolution := SquotToggles useNewApi
		ifTrue: [SquotNoMerge of:working incoming]
		ifFalse: [SquotDiffOfEqualObjects object: working].