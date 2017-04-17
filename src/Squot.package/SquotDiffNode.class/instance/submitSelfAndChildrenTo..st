as yet unclassified
submitSelfAndChildrenTo: aStream
	aStream nextPut: self.
	children do: [:each | each submitSelfAndChildrenTo: aStream].