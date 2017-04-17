as yet unclassified
withAllChildren
	^ Array streamContents: [:stream | self submitSelfAndChildrenTo: stream]