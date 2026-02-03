# FolderNav
 folder navigation that can be hot-keyed for Lightroom
 
 This lightroom classic plugin creates 6 commands in the Library menu: 
 	Folder Up, Folder Down, Folder Parent, Folder Child, Folder Self, Folder All
 Since they're menu items they can be hot-keyed. On the mac, you'd do that using:
 System Preferences/Keyboard/Shortcuts/App Shortcuts. Note that when entering the 
 menu item text (eg, "Folder Up") that it must be preceded by three spaces. 
 That's a mac-ism due to the way LRC handles these menu items.
 
 I have chosen the following shortcuts:
 	Folder Up 		^⌘↑ (command-control up-arrow)
 	Folder Down 	^⌘↓ (command-control down-arrow)
 	Folder Parent	^⌘← (command-control left-arrow)
 	Folder Child	^⌘→ (command-control right-arrow)
  	Folder Self 	^⌘. (command-control dot)
  	Folder All		^⌘. (command-control A)

If you haven't selected a folder, these functions infer your folder from the first (target) photo you've got selected.
Thus if you do "Folder Self" you can determine the folder your current image is in, essentially duplicating the "show in lightroom" button for that file.
"Folder All" is just the same as clicking "All Photographs" in the source list. 

There are some limitations - when you Folder Up past the first folder, the command takes you
to the parent folder if it can.  None of these can take you to the top-level folders in your 
hierarchy. They seem to stop one level shy of the top.  Maybe someone else wants to figure out why.

They're slow because they grab all the state they need (the names of all the nearby folders)
every time you invoke them. But at keyboard speeds it doesn't seem to matter. 

To install them, grab the lrplugin directory and everything inside it, move/copy it somewhere,
and use the Plug-in manager to open/install it in Lightroom.

I'm not a lua programmer. If you want to correct my lua, go ahead. Let me know what you did
and why. Same for any other changes or improvements.


