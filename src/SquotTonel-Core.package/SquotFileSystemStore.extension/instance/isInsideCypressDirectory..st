*SquotTonel-Core-guessing
isInsideCypressDirectory: aFile
	" guess if we are inside a Cypress directory right now which happens to contain a package.st file "

	^ (aFile parent ifNotNil: [:p | p parent ifNotNil: [:package | package name endsWith: '.package']])
		ifNil: [true]
