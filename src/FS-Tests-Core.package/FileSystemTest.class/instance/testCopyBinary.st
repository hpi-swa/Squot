tests
testCopyBinary
	| out in contents |
	[ 
	out := filesystem writeStreamOn: 'gooly'.
	[ out binary; nextPutAll: #[16rFA 16rFB 16rFC 16rFD 16rFE 16rFD] ] ensure: [ out close ].
	filesystem copy: 'gooly' to: 'plonk'.
	in := filesystem readStreamOn: 'plonk'.
	contents := [ in binary; contents ] ensure: [ in close ].
	self assert: contents = #[16rFA 16rFB 16rFC 16rFD 16rFE 16rFD] ]
		ensure: [ 
			filesystem
				delete: 'gooly';
				delete: 'plonk' ]