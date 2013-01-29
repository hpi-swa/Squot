accessing
readContentOfLength: anInteger
	^ self stream next: anInteger - 4 "remove length header byte"