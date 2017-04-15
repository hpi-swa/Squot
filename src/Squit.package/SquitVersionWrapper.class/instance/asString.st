printing
asString
	| commitHash author |
	commitHash :=  self item shortId.
	author := self item metadata at: #author.
	^ commitHash, String tab, author, String tab, self item message lines first