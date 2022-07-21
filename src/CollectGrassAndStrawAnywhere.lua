-- Collect Grass And Straw Anywhere
-- Copyright Heavy Metal Gaming (aka Dylan Myers) <gamer.hm.2021@gmail.com>
-- GitHub: https://github.com/Dylan-M/FS22_CollectGrassAndStrawAnywhere
-- Based somewhat on, and inspired by, the Collect Straw At Missions mod by derSchreiner

CollectGrassAndStrawAnywhere = {};

function CollectGrassAndStrawAnywhere:loadMap(name)
    MissionManager.getIsMissionWorkAllowed = Utils.overwrittenFunction(MissionManager.getIsMissionWorkAllowed, CollectGrassAndStrawAnywhere.getIsMissionWorkAllowed);
end; 

function CollectGrassAndStrawAnywhere:getIsMissionWorkAllowed(superFunc, farmId, x, z, workAreaType)
    return superFunc(self, farmId, x, z, workAreaType) or
        (workAreaType == WorkAreaType.FORAGEWAGON
        or workAreaType == WorkAreaType.TEDDER
        or workAreaType == WorkAreaType.WINDROWER
        or workAreaType == WorkAreaType.BALER
        or workAreaType == WorkAreaType.PELLETIZER)
end

addModEventListener(CollectGrassAndStrawAnywhere);