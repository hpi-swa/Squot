patching
generateTableOfContentsAfterApplying: aPatch in: directory
	| toc |
	toc := self tableOfContents.
	aPatch diffs do: [:each | each right
		ifPresent: [:artifact | toc at: artifact path put: (self metadataFor: artifact) serializerName]
		ifAbsent: [toc removeKey: each path ifAbsent: []]].
	self writeTableOfContents: toc into: directory / self class tocFileName.