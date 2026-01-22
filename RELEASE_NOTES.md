2.3.3e
- Add test global to skip DR Warning/Reload for testing. Macro: /run sArenaSkipDrWarning = true
- Fix Prepatch/Midnight trying to use functions from Dispel Module (which is disabled on Prepatch/Midnight) causing error and test mode to bug.
- Locale fixes and tweaks from 007bb. Thank you!

2.3.3d
- Add Interface Version 120000 to toc file, wouldnt load on prepatch with just 120001.

2.3.3c
- Fix interrupt checker for Midnight
- Restructure and cleanup a few things behind the scenes.

2.3.3b
- Midnight: Fix party target feature due to new Beta changes.
- Midnight: Headsup: Currently if you reload UI in an arena that has started (gates opened) the Blizzard UI shits the bed, which also causes sArena to shit the bed. Blizzard needs to fix this.