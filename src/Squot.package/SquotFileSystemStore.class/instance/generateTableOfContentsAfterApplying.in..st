patching
generateTableOfContentsAfterApplying: aPatch in: directory
	| toc |
	toc := self tableOfContents.
	aPatch applyTo: toc.
	toc fileOut.