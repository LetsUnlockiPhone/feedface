PLATFORM=/Developer/Platforms/iPhoneOS.platform
SDKVER=4.2
SDK=$(PLATFORM)/Developer/SDKs/iPhoneOS$(SDKVER).sdk
CC=$(PLATFORM)/Developer/usr/bin/gcc-4.2
LD=$(PLATFORM)/Developer/usr/bin/ld
AS=$(PLATFORM)/Developer/usr/bin/as

LDFLAGS=-arch armv6 -L$(SDK)/usr/lib -lc -lcrt1.o
CCFLAGS=-c -arch armv6 -mthumb -isysroot=$(SDK) -I./include -I$(SDK)/usr/include

all:
	$(CC) $(CCFLAGS) -o payload.o *.c
	$(LD) $(LDFLAGS) -o payload payload.o -order_file ld.order -sectalign __TEXT __text 0x1000 -segaddr __TEXT 0xf000
	rm payload.o