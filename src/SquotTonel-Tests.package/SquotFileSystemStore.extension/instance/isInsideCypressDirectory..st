*SquotTonel-Tests-guessing
isInsideCypressDirectory: aFile
	" guess if we are inside a Cypress directory right now which happens to contain a package.st file "

	^ (aFile resolve: '../..') name endsWith: '.package'
