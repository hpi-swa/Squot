baseline
baseline: spec
	<baseline>
	spec for: #'common' do: [
		spec baseline: 'Ston' with: [
				spec
					repository: 'github://fniephaus/ston:fniephaus-patch-3/repository'. ].
		spec baseline: 'FileTree' with: [
				spec
					repository: 'github://dalehenrich/filetree:squeak4.3/repository'. ].
		spec baseline: 'Tonel'
			with: [spec 	repository: 'github://j4yk/tonel:squeak/'].
		spec 
			package: 'SqueakSSL-Core' with: [
				spec
					repository: 'http://source.squeak.org/trunk'. ];
			package: 'WebClient-Core' with: [
				spec
					repository: 'http://source.squeak.org/trunk';
					file: 'WebClient-Core-jr.104'. ];
			package: 'WebClient-HTTP' with: [
				spec
					repository: 'http://source.squeak.org/trunk';
					file: 'WebClient-HTTP-cmm.6'. ];
			package: 'INIFile' with: [
				spec
					repository: 'http://www.squeaksource.com/INIFile';
					file: 'INIFile-jf.3'. ];
			package: 'DiffMerge' with: [
				spec
					repository: 'http://www.squeaksource.com/DiffMerge';
					file: 'DiffMerge-tonyg.12'. ];
			baseline: 'FileSystem' with:
				[spec repository: 'github://j4yk/Squeak-FileSystem:master/src'];
			package: 'VersionControl';
			package: 'Squot' with: [
				spec requires: #('FileSystem' 'Ston' 'DiffMerge' 'VersionControl' ). ];
			package: 'Pharo-compatibility';
			package: 'FileSystem-Git' with: [
				spec requires: #('FileSystem' 'Pharo-compatibility' 'INIFile' 'VersionControl' ). ];
			package: 'Squit' with: [
				spec requires: #('FileSystem-Git' 'Squot'). ];
			package: 'SquotTonel-Core' with:
				[spec requires: #('Squot' 'FileSystem' 'Tonel')];
			package: 'SquotTonel-Tests' with:
				[spec requires: #('SquotTonel-Core')].
		spec 
			group: 'FileSystemGit' with: #('FileSystem-Git' );
			group: 'default' with: #('Squit' 'Squot' 'SquotTonel-Core');
			group: 'default' with: #('default' 'SquotTonel-Tests'). ].
