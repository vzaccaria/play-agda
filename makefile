
all: ark.o3.S ark.o0.S

%.o3.S: %.c
	./eabi/bin/arm-none-eabi-gcc $< -o $@ -O3 -S

%.o0.S: %.c
	./eabi/bin/arm-none-eabi-gcc $< -o $@ -O0 -S
