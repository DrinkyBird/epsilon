MAP LIST
  * AOW01 - Red Zone
  * AOW02 - Barrens
  * AOW03 - All Out War
  * AOW04 - Glacier
  * AOW05 - Valley
  * AOW06 - Floating City
  * AOW07 - Canyon
  * AOW08 - Island
  * AOW09 - Infected
  * AOW10 - Space Camp
  * AOW11 - Disk Defrag
  * AOW12 - Hell March
  * AOW13 - Lava Giant
  * AOW14 - Waste Plant
  * AOW15 - Oasis
  * AOW16 - Missile Site
  * AOW17 - Sand Canyon
  * AOW18 - Mining Site
  * AOW19 - Volcanicity
  * AOW20 - Renegade 2030
  * AOW21 - Renegade 2032
  * AOW22 - Mercury
  * AOW23 - Defunct Commission
  * AOW24 - Surface Tension Reloaded
    
CHANGELOG
    Latest:
      * A new palette, inspired by that of Omega v15
      * Added new AOW2-specific MENUDEF
      * Removed the old aow_preferences menu in favour of MENUDEF
      * Added a new console font
      * Some internal data tweaking
      * CVARs have been moved to CVARINFO, and have been renamed from aow_ to
        epsilon_ to avoid conflicts
      * Added epsilon_cl_fov, which allows changing player FOV between 70-120
      * Added epsilon_cl_menubackground, which draws a transparent background
        behind menus to increase readability
      * Updated TITLEPIC and INTERPIC
      * Added back developer mode
      * Added tags to weapons that didn't already have them
      * It is no longer possible to evade having the full amount of tickets
        being deducted from the pool by ejecting a mech before dying
      * Added a configurable mech purchase cooldown
      * Maps
        * AOW02
          * Fixed a myriad of texture alignment issues
          * Added a basic skybox for a prettier spawn
          * Some aesthetic texture choice changes
          * Moved the powerup crate to a platform in the middle of the central
            area
          * Adjusted the slopes on the outskirts of bases
        * AOW04
          * Added a back passage to both bases to make it easier to infiltrate
        * AOW06
          * Fixed the ladders
        * AOW07
          * Added more dynamic lights
          * A few minor texture changes
        * AOW09
          * Better quality music
      * Classes
        * Removed Chrono Archer. It was just bad...
        * Shotgunner: speed 0.8 -> 0.9
        * Technician: cost 200 -> 250
      * Weapons
	    * Weakened handgun
        * Submachine gun now deals a consistent 6 damage
        * Gatling gun now deals a consistent 6 primary fire damage and 20
		  altfire damage
        * Machine gun now deals a consistent 12 damage
        * Laser chaingun now deals a consistent 8 damage
        * Shock rifle now deals a consistent 2 damage
        * Shotgun now deals consistent damage
        * Chainsaw now deals a consistent 23 damage
        * Double shotgun now deals a consistent 10 damage
        * Sniper rifle now deals a consistent 50 damage
      * Crates
        * Made Instant Juggernaut crate much rarer
        * Hidden a bunch of crates from Open Deck
      * Mechs
        * The repair facility no longer replenishes Juggernaut nukes
		* Juggernaut flak cannon now deals a consistent 20 damage