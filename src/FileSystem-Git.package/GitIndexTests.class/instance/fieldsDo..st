helpers
fieldsDo: aBlock
	"see 'index-format.txt' in the docs and the manpage for 'lstat'"
	{ 
	#metadataSeconds -> 4.
	#metadataNanos -> 4.
	#dataSeconds -> 4.
	#dataNanos -> 4.
	#deviceID -> 4.
	#inodeNumber -> 4.
	#mode -> 4.
	#uid -> 4.
	#gid -> 4.
	#size -> 4.
	#SHA1-> 20.
	#flags -> 2.
	#name -> nil
	} do: [ :assoc | aBlock value: assoc key value: assoc value ]