accessing
reorder: aSequenceableCollection
	| indices count oldIndices |
	indices := (aSequenceableCollection withIndexCollect:  [:each :index | each -> index]) as: Dictionary.
	count := aSequenceableCollection size.
	count = artifacts size
		ifTrue: [oldIndices := indices]
		ifFalse:
			[oldIndices := Dictionary new.
			artifacts values withIndexDo: [:each :index | oldIndices at: each id put: index + count "so that they all come after the aSequenceableCollection elements"]].
	artifacts sort: [:a :b | (indices at: a key ifAbsent: [oldIndices at: a key]) < (indices at: b key ifAbsent: [oldIndices at: b key])].