testing
exists
	"Answer true iff this is not a zero ref (signature of 40 times '0')."
	^ self signature ~= self class zeroSignature