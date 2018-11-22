as yet unclassified
squotDiffAgainst: otherFileListShadow with: aDiffBuilder

	^ aDiffBuilder diffFrom: self to: otherFileListShadow
		ifNew: [LBGitFileListDiff left: otherFileListShadow content right: self content.]
		andInitialize: [:diff | ]