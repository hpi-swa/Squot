spying
recordOpened: aPath writable: aBoolean
	| access existingAccess |
	access := aBoolean ifTrue: [#write] ifFalse: [#read].
	existingAccess := openedFiles at: aPath ifAbsentPut: [#read].
	(existingAccess == #write and: [access == #read]) ifTrue: [^ self].
	openedFiles at: aPath put: access.