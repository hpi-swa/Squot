private receiving
readContentOfLength: anInteger
	^ stream next: anInteger - 4 "skip length header bytes"