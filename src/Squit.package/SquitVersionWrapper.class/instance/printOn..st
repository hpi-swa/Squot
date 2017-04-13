printing
printOn: aStream
	| commitHash author |
	commitHash :=  self version shortId.
	author := self version metadata at: #author.
	aStream nextPutAll: commitHash, String tab, author, String tab, self version message lines first