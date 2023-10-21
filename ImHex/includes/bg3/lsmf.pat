#include <std/core.pat>
#include <std/random.pat>

std::random::set_seed(0);

using core__v0__TranslatedString_Entry;

struct game__display_names__v0__DisplayTitleTS {
    core__v0__TranslatedString_Entry string1;

    if(string1.stringOffset != 0xFFFFFFFFFFFFFFFF) {
        core__v0__TranslatedString_Entry string1subString @ string1.stringOffset + BASE_OFFSET;
    }
};

struct game__display_names__v0__DisplayNameTS {
    core__v0__TranslatedString_Entry string1;
    core__v0__TranslatedString_Entry string2;

    if(string1.stringOffset != 0xFFFFFFFFFFFFFFFF) {
        core__v0__TranslatedString_Entry string1subString @ string1.stringOffset + BASE_OFFSET;
    }
};

struct game__hotbar__v1__Slot {
    core__v0__TranslatedString_Entry string;
    u8 unknown1[32];
};

struct game__game_timer__v1__GameTimerComponent {
    core__v0__TranslatedString_Entry string;
    u8 unknown1[40];
};

struct game__action_resources__v1__Component_Entry {
    GUID uuid;
    u8 unknown1[32];
    u64 startOffset;
    u64 endOffset;

    if(startOffset != endOffset) {
        u8 unknown2[endOffset - startOffset] @ startOffset + BASE_OFFSET;
    }
};

struct game__action_resources__v1__Component {
    u64 startOffset;
    u64 endOffset;
    
    u32 size = (endOffset - startOffset) / 64;
    game__action_resources__v1__Component_Entry entries[size] @ startOffset + BASE_OFFSET;
};

struct core__v0__Level_OwnerMap {
    u64 startOffset;
    u64 endOffset;
    u64 componentIndex;
    u64 numberOfEntries;
    
    u32 ownerIndices[numberOfEntries] @ startOffset + BASE_OFFSET;
};

struct core__v0__Level {
    u64 entitiesStart;
    u64 entitiesEnd;
    u64 ownerMapsStart;
    u64 ownerMapsEnd;  

    u64 entityCount = (entitiesEnd - entitiesStart) / 16;

    GUID entities[entityCount] @ entitiesStart + BASE_OFFSET;

    u32 ownerMapCount = (ownerMapsEnd - ownerMapsStart) / 32;
    core__v0__Level_OwnerMap ownerMap[size] @ ownerMapsStart + BASE_OFFSET;
};

struct core__v0__EntityId {
    GUID uuid;
};

struct core__v0__TranslatedString_Entry {
    u64 stringOffset;
    u32 stringSize;
    u8 unknown1[4];

    char string[stringSize] @ stringOffset + BASE_OFFSET;
};

struct core__v0__TranslatedString {
    core__v0__TranslatedString_Entry string1;
    core__v0__TranslatedString_Entry string2;
};

struct game__race__v0__RaceComponent {
    GUID uuid;
};

struct game__character_creation__v0__OriginComponent {
    GUID uuid;
};

struct game__character_creation__v0__VoiceComponent {
    GUID uuid;
};

struct game__character_creation__v0__BackgroundComponent {
    GUID uuid;
};

struct game__character_creation__v1__AppearanceMaterialSetting {
    GUID materialUUID;
    GUID colorUUID;
    double value1;
    double value2;
};

struct game__character_creation__v3__AppearanceComponent {
    PtrU64<GUID, 4> player;
    PtrU64<float, 4> sliders1a;
    game__character_creation__v1__AppearanceMaterialSetting *tattoo1 : u64 [[pointer_base("ptrU64")]];
    u64 unknown1;
    GUID skinColor;
    PtrU64<float, 4> sliders2a;
    PtrU64<GUID, 4> guardian;
    GUID eyeColor1;
    GUID eyeColor2;
    GUID hairColor;
};

struct UnknownComponent<auto size> {
    u8 bytes[size];
} [[sealed]];

struct ComponentEntry {
    u64 nameOffset;
    u64 nameSize;
    u64 hash; //Probably
    u32 structureSize;
    u32 version;
    u64 numberOfElements;
    u64 componentOffset;
    
    char name[nameSize] @ parent.blockOffset + nameOffset + BASE_OFFSET;
    u32 size = structureSize * numberOfElements [[export]];
    
    match (name) {
        ("game.ai.swarm.v0.MemberComponent"): core__v0__TranslatedString_Entry component[numberOfElements] @ componentOffset + BASE_OFFSET [[name(name),hex::group("Known Components")]]; 
        ("game.avatar.v0.AvatarComponent"): core__v0__TranslatedString_Entry component[numberOfElements] @ componentOffset + BASE_OFFSET [[name(name),hex::group("Known Components")]]; 
        ("game.race.v0.RaceComponent"): game__race__v0__RaceComponent component[numberOfElements] @ componentOffset + BASE_OFFSET [[name(name),hex::group("Known Components")]]; 
        ("game.display_names.v0.DisplayTitleTS"): game__display_names__v0__DisplayTitleTS component[numberOfElements] @ componentOffset + BASE_OFFSET [[name(name),hex::group("WIP Components")]]; 
        ("game.display_names.v0.DisplayNameTS"): game__display_names__v0__DisplayNameTS component[numberOfElements] @ componentOffset + BASE_OFFSET [[name(name),hex::group("WIP Components")]]; 
        ("game.hotbar.v1.Slot"): game__hotbar__v1__Slot component[numberOfElements] @ componentOffset + BASE_OFFSET [[name(name),hex::group("WIP Components")]]; 
        //("game.game_timer.v1.GameTimerComponent"): game__game_timer__v1__GameTimerComponent component[numberOfElements] @ componentOffset + BASE_OFFSET [[name(name),hex::group("WIP Components")]]; 
        ("core.v0.Level"): core__v0__Level component[numberOfElements] @ componentOffset + BASE_OFFSET [[name(name),hex::group("WIP Components")]]; 
        ("core.v0.EntityId"): core__v0__EntityId component[numberOfElements] @ componentOffset + BASE_OFFSET [[name(name),hex::group("Known Components")]]; 
        ("core.v0.TranslatedString"): core__v0__TranslatedString component[numberOfElements] @ componentOffset + BASE_OFFSET [[name(name),hex::group("WIP Components")]]; 
        ("game.action_resources.v1.Component"): game__action_resources__v1__Component component[numberOfElements] @ componentOffset + BASE_OFFSET [[name(name),hex::group("WIP Components")]]; 
        ("game.character_creation.v0.OriginComponent"): game__character_creation__v0__OriginComponent component[numberOfElements] @ componentOffset + BASE_OFFSET [[name(name),hex::group("Known Components")]]; 
        ("game.character_creation.v0.VoiceComponent"): game__character_creation__v0__VoiceComponent component[numberOfElements] @ componentOffset + BASE_OFFSET [[name(name),hex::group("Known Components")]]; 
        ("game.character_creation.v0.BackgroundComponent"): game__character_creation__v0__BackgroundComponent component[numberOfElements] @ componentOffset + BASE_OFFSET [[name(name),hex::group("Known Components")]]; 
        ("game.character_creation.v1.AppearanceMaterialSetting"): game__character_creation__v1__AppearanceMaterialSetting component[numberOfElements] @ componentOffset + BASE_OFFSET [[name(name),hex::group("Known Components")]]; 
        ("game.character_creation.v3.AppearanceComponent"): game__character_creation__v3__AppearanceComponent component[numberOfElements] @ componentOffset + BASE_OFFSET [[name(name),hex::group("WIP Components")]]; 
        (_): UnknownComponent<structureSize> component[numberOfElements] @ componentOffset + BASE_OFFSET [[color(intToColor(std::random::generate(0, 0xFFFFFF))),name(name),hex::group("Unknown Components")]];
    }
};

struct LSMF {
    char magicHeader[4];
    u32 version; //Probably
    u64 hash; //Probably
    u64 blockOffset;
    u64 blockSize;
    u32 nameBlockSize;
    u16 numberOfComponents;
    u16 unknown1;
    u64 unknown2;
    
    ComponentEntry components[numberOfComponents] @ absoluteOffset + nameBlockSize;
};