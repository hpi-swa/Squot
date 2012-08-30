public-enumerating
commitsDo: aBlock
	"you can stop iteration by using the exit block given as second
	optional argument to aBlock. E.g: [ :commit :exit | ... exit value ]"
	self commits: (Array with: self head) do: aBlock