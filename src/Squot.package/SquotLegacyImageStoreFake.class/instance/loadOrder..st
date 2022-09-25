accessing
loadOrder: aSequenceableCollection
	| ids indices |
	indices := (aSequenceableCollection withIndexCollect:  [:each :index | each -> index]) as: Dictionary.
	artifacts sort: [:a :b | (indices at: a key) < (indices at: b key)].
	ids := aSequenceableCollection collect: [:each | (self artifactAt: each) id].
	workingCopy project reorder: ids.