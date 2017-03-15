# Squot
Squeak Object Tracker - Version control for arbitrary objects in Squeak, currently with Git storage

This repository also contains a variant of the FileSystem library,
which is an alternative to the FileDirectory API and has replaced the latter in Pharo.
However, our version of the FileSystem library descends from the last version of it for Squeak
and is not compatible with Pharo's FileSystem classes.

The package that provides Git connectivity for Squot is named Squit.
It uses the package FileSystem-Git (also included here) to browse and manipulate Git repositories.

## Installation instructions

Until a proper baseline for Metacello has been created, you can use the following code to load Squot and all its prerequisites (including Metacello):

```smalltalk
"install latest Metacello"
Installer ss3
    project: 'FileTree';
    install: 'ConfigurationOfFileTree'.
((Smalltalk at: #ConfigurationOfFileTree) project version: #'stable') load.

Installer gemsource
    project: 'metacello';
    addPackage: 'ConfigurationOfMetacello';
    install.

((Smalltalk at: #ConfigurationOfMetacello) project 
  version: #'previewBootstrap') load.

(Smalltalk at: #Metacello) new
  configuration: 'MetacelloPreview';
  version: #stable;
  repository: 'github://dalehenrich/metacello-work:configuration';
  load.

(Smalltalk at: #Metacello) new
  baseline: 'Metacello';
  repository: 'github://dalehenrich/metacello-work:master/repository';
  get.
(Smalltalk at: #Metacello) new
  baseline: 'Metacello';
  repository: 'github://dalehenrich/metacello-work:master/repository';
  load.

"install latest FileTree"
(Smalltalk at: #Metacello) new
  baseline: 'FileTree';
  repository: 'github://dalehenrich/filetree:squeak4.3/repository';
  load.

"install prerequisites"
[(Smalltalk at: #Metacello) new
	configuration: 'Ston';
	repository: 'http://www.smalltalkhub.com/mc/SvenVanCaekenberghe/STON/main';
	load]
on: Warning do: [:e | e resume].

(Smalltalk at: #Gofer) new
	squeaksource: 'INIFile';
	version: 'INIFile-jf.3';
	load.

(Smalltalk at: #Gofer) new
	disablePackageCache;
	repository: ((Smalltalk at: #MCGitHubRepository) location: 'github://j4yk/Squot:master/src');
	package: 'FS-Core';
	package: 'FS-Disk';
	package: 'FS-Memory';
	package: 'FS-AnsiStreams';
	package: 'FS-Tests-Core';
	package: 'FS-Tests-Disk';
	package: 'FS-Tests-Memory';
	package: 'FS-Tests-AnsiStreams';
	package: 'Squot';
	package: 'Pharo-compatibility';
	package: 'FileSystem-Git';
	package: 'Squit';
	load.
```

## Usage instructions

Squot uses an ImageStore to remember objects (including packages) that should be tracked.
A WorkingCopy combines such a store with a repository, for example a SquitRepository (a Git repository).

Terminology note: Squot is based on an abstraction for version control systems named Pur.
It coins the name "Historian" for label-based branches, such as Git's head references.

```smalltalk
workingCopy := SquotWorkingCopy new.
workingCopy store: SquotImageStore new.
workingCopy repository:
  (SquitRepository onDirectory: FileSystem disk / 'path' / 'to' / 'your' / 'repository.git').
workingCopy loadedHistorian: (workingCopy repository historianNamed: 'master').
workingCopy add: (PackageInfo named: 'YourPackage') at: 'src'.
workingCopy add: (PackageInfo named: 'AnotherPackage') at: 'src'.
workingCopy add: anyObject at: 'objects/myObject'.
workingCopy saveNewVersionInteractively.
workingCopy loadCurrentVersionInteractively.
```

Note that Monticello versions will be created in the package cache repository
whenever you save a new version (commit) that modifies the code of a package.
These are for backup purposes until Squot and Squit are sufficiently stable.

## Converting Monticello history

A converter and a verifier for the created versions is included.

```smalltalk
repository := SquitRepository onDirectory: FileSystem disk / 'path' / 'to' / 'your' / 'repository.git'.
packageName := 'FileSystem-Git'.
historianName := 'refs/heads/import-fsgit'.
SquotMonticelloConverter
  convertUpToLoadedVersionOfPackageNamed: packageName
  asHistorianNamed: historianName in: repository.
SquotMonticelloConverterVerifier
  verifyVersionsOf: (repository historianNamed: historianName)
  ofLoadedPackageNamed: packageName.
```

## Goodies

Because Squot does not yet include a sufficient set of tools to manipulate a
Git repository, you may want to create a button that opens gitk or another
program on the repository.

Here a do-it for Windows users (requires OSProcess):
```smalltalk
OSProcess command: 'cmd /C start /D "', (squitRepository gitRepository repository baseDir path printWithDelimiter: $\), '" gitk --all'.
```
