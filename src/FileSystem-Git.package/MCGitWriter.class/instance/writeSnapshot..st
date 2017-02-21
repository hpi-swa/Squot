visiting
writeSnapshot: aSnapshot
	"write out a nice file based representation so you can easily track changes with a common git tool"
	self writeDefinitions: aSnapshot definitions