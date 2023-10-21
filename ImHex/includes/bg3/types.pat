#include <std/io.pat> 

struct GUID {
    u32 data1;
    u16 data2[6];
} [[format_read("guid"),format_write("guid"),sealed]];

fn guid(auto guid) {    
    return std::format(
        "{:08X}-{:04X}-{:04X}-{:04X}-{:04X}{:04X}{:04X}",
        guid.data1,
        guid.data2[0],
        guid.data2[1],
        guid.data2[2],
        guid.data2[3],
        guid.data2[4],
        guid.data2[5]
    );
};

struct PtrU64<T, auto size> {
    T *pointer[size] : u64 [[pointer_base("ptrU64")]];
};

fn ptrU64(u64 address) {
    return BASE_OFFSET;
};