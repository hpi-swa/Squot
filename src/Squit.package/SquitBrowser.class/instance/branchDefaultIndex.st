ui
branchDefaultIndex
	| activeIndex branchList |
	(self hasProjectSelection not or: [(branchList := self branchList) size <= 1]) ifTrue: [^ 0].
	activeIndex := branchList allButFirst findFirst: [:each |
		each historian = self projectSelection loadedHistorian].
	^ activeIndex = 0
		ifTrue: [2] "need to skip the list caption in both cases"
		ifFalse: [activeIndex + 1]