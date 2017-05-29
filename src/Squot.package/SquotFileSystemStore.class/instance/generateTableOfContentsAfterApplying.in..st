patching
generateTableOfContentsAfterApplying: aPatch in: directory
	| toc |
	toc := self tableOfContents.
	aPatch diffs do: [:each | each right
		ifPresent: [:artifact | toc at: each path put: (artifact storeInfo at: #serializer)]
		ifAbsent: [toc removeKey: each path ifAbsent: []]].
	self writeTableOfContents: toc into: directory / self class tocFileName.