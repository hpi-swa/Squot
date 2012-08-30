capabilities
thinPack

	"This capability means that the server can send a 'thin' pack, a pack
which does not contain base objects; if those base objects are available
on client side. Client requests 'thin-pack' capability when it
understands how to 'thicken' it by adding required delta bases making
it self-contained.

Client MUST NOT request 'thin-pack' capability if it cannot turn a thin
pack into a self-contained pack."
	
	^ self enable: #'thin-pack'