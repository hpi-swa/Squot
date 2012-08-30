private
readContentOfLength: anInteger
	^ self socketStream next: anInteger - 4 "remove length header byte"