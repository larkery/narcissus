hide = @

CFLAGS = \
	-g \
	-std=c99 \
	-D_BSD_SOURCE

LIBS = \
	-lfakekey \
	-lX11 \
	-lXi

all: narcissus mapgen statanal nartutor

narcissus: narcissus.o devices.o razer-nostromo.o
	@echo LINK $@
	$(hide) gcc -o $@ $^ $(CFLAGS) $(LIBS)

nartutor: nartutor.o devices.o razer-nostromo.o
	@echo LINK $@
	$(hide) gcc -o $@ $^ $(CFLAGS) $(LIBS)

clean:
	@echo CLEAN
	$(hide) rm narcissus mapgen statanal *.o

%.o: %.c
	@echo COMPILE $@
	$(hide) gcc -c -o $@ $< $(CFLAGS)

%.d: %.c
	@echo DEPEND $@
	$(hide) gcc -MP -MM -MF $@ $< $(CFLAGS)

%: %.c
	@echo COMPILELINK $@
	$(hide) gcc -o $@ $< $(CFLAGS) $(LIBS)

-include narcissus.d
-include devices.d
-include razer-nostromo.d
-include nartutor.d

