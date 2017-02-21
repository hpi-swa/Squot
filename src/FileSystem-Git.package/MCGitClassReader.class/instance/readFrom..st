as yet unclassified
readFrom: aFile
	classFolder := aFile.
	self loadDefinitions.
	^ definitions