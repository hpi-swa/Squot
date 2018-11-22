as yet unclassified
reverseDiffContentAgainst: aCollection

	| otherContent added changedOrStayed deleted |
	otherContent := aCollection ifNil: [Array empty].
	added := self content difference: otherContent.
	changedOrStayed := self content intersection: otherContent.
	deleted := otherContent difference: self content.
	self halt.
	^ SquotDiffOfEqualObjects instance