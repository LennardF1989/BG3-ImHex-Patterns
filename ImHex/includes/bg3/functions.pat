#include <std/io.pat> 

using LSMF;

fn intToColor(u32 c) {
    u8 r = c % 256;
    u8 g = ((c-r) / 256) % 256;
    u8 b = ((c-r) / 256 * 256) - g/256;
    return std::format("{:02X}{:02X}{:02X}", r, g, b);
};

fn printNamesEntries(ref LSMF lsmf) {
    u32 i = 0;

    std::print("Name entries");

    for(i = 0, i < lsmf.numberOfComponents, i = i + 1) {
        str name = lsmf.components[i].name;
        u32 size = lsmf.components[i].size;
        u32 numberOfElements = lsmf.components[i].numberOfElements;
        u32 structureSize = lsmf.components[i].structureSize;
        
        std::print("{:3d} = {} ({} => {} x {})", i, name, size, numberOfElements, structureSize); 
    }
};