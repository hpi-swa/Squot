nonhomogeneous accessing
nextString
	"Read a string from the receiver. The first byte is the length of the string, unless it is greater than 192, in which case the first four bytes encode the length. This is restricted to Latin1 encoded String."

	| length aByteArray |
	length := self next.		"first byte."
	length >= 192 ifTrue: [length := length - 192.
		1 to: 3 do: [:ii | length := length * 256 + self next]].
	aByteArray := ByteArray new: length.

	self nextInto: aByteArray.
	^aByteArray asString.