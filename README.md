# godot-stuff
Doign some stuff in Godot game engine

The basics- file with all the basic stuff implemented in it, like moving your character around, walls and collisions, moving from room to room etc
Known problems:
- The "origin" of a Position3D does not actually correspond with its absolute position FECKIN FIXED YEAH BABY
- Snap player to floor when loading new room better
- Player object hops/skips when going down a slope, depending on script used
- Player object slowly descends a slope when moving back and forth on it, depending on script used
- Player just plain old slides slowly down a slope when not moving depending on script used

Particlings or whatever I called it- separate file to implemebt the exact setup I want for a thing with particles which will be merged into the main basics gamefile when done-ish
The mesh used to denote where the particles will be active (for example, grass particles coming from the player's feet when walking through a field of grass) needs to be a StaticBody or whatever it is rather than an Area so that more complex meshes can be used to map out grass patches, because trimeshes don't work as Areas for some goddamn reason. So the game needs to be set up around that, which is done here using an Area attached to the player model and collision layers.
