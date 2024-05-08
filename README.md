# TavernlightTechnicalAssessment
A repo containing the provided answers to the technical interview questions posed by Tavernlight Games

# Question 6

### Reasoning
- I unfortunately was not able to fully complete this question mainly due to the learning curve associated with GLSL shaders and time constraints. I implemented a pipeline to communicate the dash request to the server (in order to maintain server authority and preserve other systems) and kept all the shader implementations to the client. I've applied one of the two main effects from the dash and understand how I would add the second provided I had created the appropriate shader files. Only note is that ideally the server would communicate the exact end of the dash but that has been conciously ommited due to time constraints and it not meaningfully affecting the effect from the video.

### Overview

#### OTC Source

- Added rendering hooks to [creature.cpp](https://github.com/Gordoco/TavernlightTechnicalAssessment/blob/Question-6/OTC/creature.cpp) (Lines: 147-156) for allowing shaders to be drawn properly
- Added methods to [creature.h](https://github.com/Gordoco/TavernlightTechnicalAssessment/blob/Question-6/OTC/creature.h) (Lines: 54-57) to allow setting of shaders via lua
- Added protocol for sending a Dash request to the server in [game.cpp](https://github.com/Gordoco/TavernlightTechnicalAssessment/blob/Question-6/OTC/game.cpp) (Lines: 678-697)
- Added header for previous protocol in [game.h](https://github.com/Gordoco/TavernlightTechnicalAssessment/blob/Question-6/OTC/game.h) (Line: 170)
- Registered lua functions for dashing and setting/resetting shaders in [luafunctions.cpp](https://github.com/Gordoco/TavernlightTechnicalAssessment/blob/Question-6/OTC/luafunctions.cpp) (Lines: 190, 315, 322, 461-462)
- Added additional sendable protocol for dashing to [protocolgamesend.cpp](https://github.com/Gordoco/TavernlightTechnicalAssessment/blob/Question-6/OTC/protocolgamesend.cpp) (Lines: 289-297)
- Added header for previous protocol in [protocolgame.h](https://github.com/Gordoco/TavernlightTechnicalAssessment/blob/Question-6/OTC/protocolgame.h) (Line: 53)
- Added custom protocol code to [protocolcodes.h](https://github.com/Gordoco/TavernlightTechnicalAssessment/blob/Question-6/OTC/protocolcodes.h) (Line: 186)
- Added the ability to create vertex shaders and add textures through [shadermanager.cpp](https://github.com/Gordoco/TavernlightTechnicalAssessment/blob/Question-6/OTC/shadermanager.cpp) (Lines: 51-62, 98-122)
- Added appropriate headers for above functions in [shadermanager.h](https://github.com/Gordoco/TavernlightTechnicalAssessment/blob/Question-6/OTC/shadermanager.h) (Lines: 43, 47)

#### OTC Scripts/Shaders

- Added game_shader loading to [interface.otmod](https://github.com/Gordoco/TavernlightTechnicalAssessment/blob/Question-6/OTC/interface.otmod) (Line: 43)
- Called TFS lua exposed methods to create shader in [shaders.lua](https://github.com/Gordoco/TavernlightTechnicalAssessment/blob/Question-6/OTC/shaders.lua)
- Setup game_shaders module in [shaders.otmod](https://github.com/Gordoco/TavernlightTechnicalAssessment/blob/Question-6/OTC/shaders.otmod)
- Added user input for dashing as well as creating, applying, and removing shaders in [gameinterface.lua](https://github.com/Gordoco/TavernlightTechnicalAssessment/blob/Question-6/OTC/gameinterface.lua) (Lines: 99, 146-168)
- Added simple outline shader in [redOutline_fragment.frag](https://github.com/Gordoco/TavernlightTechnicalAssessment/blob/Question-6/OTC/redOutline_fragment.frag)

#### TFS Source

- Added parsing methods to handle new client message in [protocolgame.cpp](https://github.com/Gordoco/TavernlightTechnicalAssessment/blob/Question-6/TFS/protocolgame.cpp) (Lines: 510, 847-851)
- Added headers for above in [protocolgame.h](https://github.com/Gordoco/TavernlightTechnicalAssessment/blob/Question-6/TFS/protocolgame.h) (Line: 99)
- Added header for lua handler for player dash event in [luascript.h](https://github.com/Gordoco/TavernlightTechnicalAssessment/blob/Question-6/TFS/luascript.h) (Line: 1035)
- Added lua handler for player dash in [luascript.cpp](https://github.com/Gordoco/TavernlightTechnicalAssessment/blob/Question-6/TFS/luascript.cpp) (Lines: 2528, 10291-10294)
- Added method for routing the accepted dash request through to the lua events framework in [game.cpp](https://github.com/Gordoco/TavernlightTechnicalAssessment/blob/Question-6/TFS/game.cpp) (Lines: 2345-2353)
- Added header to [game.h](https://github.com/Gordoco/TavernlightTechnicalAssessment/blob/Question-6/TFS/game.h) (Line: 362)
- Hooked up player dash event into the events framework in [events.cpp](https://github.com/Gordoco/TavernlightTechnicalAssessment/blob/Question-6/TFS/events.cpp) (Lines: 125-126, 1026-1057)
- Added headers for above to [events.h](https://github.com/Gordoco/TavernlightTechnicalAssessment/blob/Question-6/TFS/events.h) (Lines: 64, 107)

#### TFS Scripts

- Added player dash event to [events.xml](https://github.com/Gordoco/TavernlightTechnicalAssessment/blob/Question-6/TFS/events.xml) (Line: 34)
- Added player dash implementation to [player.lua](https://github.com/Gordoco/TavernlightTechnicalAssessment/blob/Question-6/TFS/player.lua) (Lines: 100-175)
