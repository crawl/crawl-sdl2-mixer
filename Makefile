# -*- Makefile -*- for sdl2-mixer

ifneq ($(findstring $(MAKEFLAGS),s),s)
ifndef V
        QUIET_CC       = @echo '   ' CC $@;
        QUIET_CXX      = @echo '   ' CXX $@;
        QUIET_AR       = @echo '   ' AR $@;
        QUIET_RANLIB   = @echo '   ' RANLIB $@;
        QUIET_INSTALL  = @echo '   ' INSTALL $<;
        export V
endif
endif

LIB    = libSDL2_mixer.a
AR    ?= ar
CC    ?= gcc
RANLIB?= ranlib
RM    ?= rm -f

prefix ?= /usr/local
libdir := $(prefix)/lib
includedir := $(prefix)/include/SDL2

MODPLUG_LIBRARY_PATH := external/libmodplug-0.8.8.4
MIKMOD_LIBRARY_PATH := external/libmikmod-3.1.12
SMPEG_LIBRARY_PATH := external/smpeg2-2.0.0
OGG_LIBRARY_PATH := external/libogg-1.3.1
VORBIS_LIBRARY_PATH := external/libvorbisidec-1.2.1

HEADERS = SDL_mixer.h
SOURCES := \
        $(MODPLUG_LIBRARY_PATH)/src/fastmix.cpp \
        $(MODPLUG_LIBRARY_PATH)/src/load_669.cpp \
        $(MODPLUG_LIBRARY_PATH)/src/load_abc.cpp \
        $(MODPLUG_LIBRARY_PATH)/src/load_amf.cpp \
        $(MODPLUG_LIBRARY_PATH)/src/load_ams.cpp \
        $(MODPLUG_LIBRARY_PATH)/src/load_dbm.cpp \
        $(MODPLUG_LIBRARY_PATH)/src/load_dmf.cpp \
        $(MODPLUG_LIBRARY_PATH)/src/load_dsm.cpp \
        $(MODPLUG_LIBRARY_PATH)/src/load_far.cpp \
        $(MODPLUG_LIBRARY_PATH)/src/load_it.cpp \
        $(MODPLUG_LIBRARY_PATH)/src/load_j2b.cpp \
        $(MODPLUG_LIBRARY_PATH)/src/load_mdl.cpp \
        $(MODPLUG_LIBRARY_PATH)/src/load_med.cpp \
        $(MODPLUG_LIBRARY_PATH)/src/load_mid.cpp \
        $(MODPLUG_LIBRARY_PATH)/src/load_mod.cpp \
        $(MODPLUG_LIBRARY_PATH)/src/load_mt2.cpp \
        $(MODPLUG_LIBRARY_PATH)/src/load_mtm.cpp \
        $(MODPLUG_LIBRARY_PATH)/src/load_okt.cpp \
        $(MODPLUG_LIBRARY_PATH)/src/load_pat.cpp \
        $(MODPLUG_LIBRARY_PATH)/src/load_psm.cpp \
        $(MODPLUG_LIBRARY_PATH)/src/load_ptm.cpp \
        $(MODPLUG_LIBRARY_PATH)/src/load_s3m.cpp \
        $(MODPLUG_LIBRARY_PATH)/src/load_stm.cpp \
        $(MODPLUG_LIBRARY_PATH)/src/load_ult.cpp \
        $(MODPLUG_LIBRARY_PATH)/src/load_umx.cpp \
        $(MODPLUG_LIBRARY_PATH)/src/load_wav.cpp \
        $(MODPLUG_LIBRARY_PATH)/src/load_xm.cpp \
        $(MODPLUG_LIBRARY_PATH)/src/mmcmp.cpp \
        $(MODPLUG_LIBRARY_PATH)/src/modplug.cpp \
        $(MODPLUG_LIBRARY_PATH)/src/snd_dsp.cpp \
        $(MODPLUG_LIBRARY_PATH)/src/snd_flt.cpp \
        $(MODPLUG_LIBRARY_PATH)/src/snd_fx.cpp \
        $(MODPLUG_LIBRARY_PATH)/src/sndfile.cpp \
        $(MODPLUG_LIBRARY_PATH)/src/sndmix.cpp \
        $(MIKMOD_LIBRARY_PATH)/drivers/drv_AF.c \
        $(MIKMOD_LIBRARY_PATH)/drivers/drv_aix.c \
        $(MIKMOD_LIBRARY_PATH)/drivers/drv_alsa.c \
        $(MIKMOD_LIBRARY_PATH)/drivers/drv_esd.c \
        $(MIKMOD_LIBRARY_PATH)/drivers/drv_hp.c \
        $(MIKMOD_LIBRARY_PATH)/drivers/drv_nos.c \
        $(MIKMOD_LIBRARY_PATH)/drivers/drv_oss.c \
        $(MIKMOD_LIBRARY_PATH)/drivers/drv_pipe.c \
        $(MIKMOD_LIBRARY_PATH)/drivers/drv_raw.c \
        $(MIKMOD_LIBRARY_PATH)/drivers/drv_sam9407.c \
        $(MIKMOD_LIBRARY_PATH)/drivers/drv_sgi.c \
        $(MIKMOD_LIBRARY_PATH)/drivers/drv_stdout.c \
        $(MIKMOD_LIBRARY_PATH)/drivers/drv_sun.c \
        $(MIKMOD_LIBRARY_PATH)/drivers/drv_ultra.c \
        $(MIKMOD_LIBRARY_PATH)/drivers/drv_wav.c \
        $(MIKMOD_LIBRARY_PATH)/loaders/load_669.c \
        $(MIKMOD_LIBRARY_PATH)/loaders/load_amf.c \
        $(MIKMOD_LIBRARY_PATH)/loaders/load_dsm.c \
        $(MIKMOD_LIBRARY_PATH)/loaders/load_far.c \
        $(MIKMOD_LIBRARY_PATH)/loaders/load_gdm.c \
        $(MIKMOD_LIBRARY_PATH)/loaders/load_imf.c \
        $(MIKMOD_LIBRARY_PATH)/loaders/load_it.c \
        $(MIKMOD_LIBRARY_PATH)/loaders/load_m15.c \
        $(MIKMOD_LIBRARY_PATH)/loaders/load_med.c \
        $(MIKMOD_LIBRARY_PATH)/loaders/load_mod.c \
        $(MIKMOD_LIBRARY_PATH)/loaders/load_mtm.c \
        $(MIKMOD_LIBRARY_PATH)/loaders/load_okt.c \
        $(MIKMOD_LIBRARY_PATH)/loaders/load_s3m.c \
        $(MIKMOD_LIBRARY_PATH)/loaders/load_stm.c \
        $(MIKMOD_LIBRARY_PATH)/loaders/load_stx.c \
        $(MIKMOD_LIBRARY_PATH)/loaders/load_ult.c \
        $(MIKMOD_LIBRARY_PATH)/loaders/load_uni.c \
        $(MIKMOD_LIBRARY_PATH)/loaders/load_xm.c \
        $(MIKMOD_LIBRARY_PATH)/mmio/mmalloc.c \
        $(MIKMOD_LIBRARY_PATH)/mmio/mmerror.c \
        $(MIKMOD_LIBRARY_PATH)/mmio/mmio.c \
        $(MIKMOD_LIBRARY_PATH)/playercode/mdreg.c \
        $(MIKMOD_LIBRARY_PATH)/playercode/mdriver.c \
        $(MIKMOD_LIBRARY_PATH)/playercode/mdulaw.c \
        $(MIKMOD_LIBRARY_PATH)/playercode/mloader.c \
        $(MIKMOD_LIBRARY_PATH)/playercode/mlreg.c \
        $(MIKMOD_LIBRARY_PATH)/playercode/mlutil.c \
        $(MIKMOD_LIBRARY_PATH)/playercode/mplayer.c \
        $(MIKMOD_LIBRARY_PATH)/playercode/munitrk.c \
        $(MIKMOD_LIBRARY_PATH)/playercode/mwav.c \
        $(MIKMOD_LIBRARY_PATH)/playercode/npertab.c \
        $(MIKMOD_LIBRARY_PATH)/playercode/sloader.c \
        $(MIKMOD_LIBRARY_PATH)/playercode/virtch.c \
        $(MIKMOD_LIBRARY_PATH)/playercode/virtch2.c \
        $(MIKMOD_LIBRARY_PATH)/playercode/virtch_common.c \
        $(SMPEG_LIBRARY_PATH)/smpeg.cpp \
        $(SMPEG_LIBRARY_PATH)/MPEG.cpp \
        $(SMPEG_LIBRARY_PATH)/MPEGlist.cpp \
        $(SMPEG_LIBRARY_PATH)/MPEGring.cpp \
        $(SMPEG_LIBRARY_PATH)/MPEGstream.cpp \
        $(SMPEG_LIBRARY_PATH)/MPEGsystem.cpp \
        $(SMPEG_LIBRARY_PATH)/audio/MPEGaudio.cpp \
        $(SMPEG_LIBRARY_PATH)/audio/bitwindow.cpp \
        $(SMPEG_LIBRARY_PATH)/audio/filter.cpp \
        $(SMPEG_LIBRARY_PATH)/audio/filter_2.cpp \
        $(SMPEG_LIBRARY_PATH)/audio/hufftable.cpp \
        $(SMPEG_LIBRARY_PATH)/audio/mpeglayer1.cpp \
        $(SMPEG_LIBRARY_PATH)/audio/mpeglayer2.cpp \
        $(SMPEG_LIBRARY_PATH)/audio/mpeglayer3.cpp \
        $(SMPEG_LIBRARY_PATH)/audio/mpegtable.cpp \
        $(SMPEG_LIBRARY_PATH)/audio/mpegtoraw.cpp \
        $(SMPEG_LIBRARY_PATH)/video/MPEGvideo.cpp \
        $(SMPEG_LIBRARY_PATH)/video/decoders.cpp \
        $(SMPEG_LIBRARY_PATH)/video/floatdct.cpp \
        $(SMPEG_LIBRARY_PATH)/video/gdith.cpp \
        $(SMPEG_LIBRARY_PATH)/video/jrevdct.cpp \
        $(SMPEG_LIBRARY_PATH)/video/motionvec.cpp \
        $(SMPEG_LIBRARY_PATH)/video/parseblock.cpp \
        $(SMPEG_LIBRARY_PATH)/video/readfile.cpp \
        $(SMPEG_LIBRARY_PATH)/video/util.cpp \
        $(SMPEG_LIBRARY_PATH)/video/video.cpp \
        $(VORBIS_LIBRARY_PATH)/mdct.c \
        $(VORBIS_LIBRARY_PATH)/block.c \
        $(VORBIS_LIBRARY_PATH)/window.c \
        $(VORBIS_LIBRARY_PATH)/synthesis.c \
        $(VORBIS_LIBRARY_PATH)/info.c \
        $(VORBIS_LIBRARY_PATH)/floor1.c \
        $(VORBIS_LIBRARY_PATH)/floor0.c \
        $(VORBIS_LIBRARY_PATH)/vorbisfile.c \
        $(VORBIS_LIBRARY_PATH)/res012.c \
        $(VORBIS_LIBRARY_PATH)/mapping0.c \
        $(VORBIS_LIBRARY_PATH)/registry.c \
        $(VORBIS_LIBRARY_PATH)/codebook.c \
        $(VORBIS_LIBRARY_PATH)/sharedbook.c \
        $(OGG_LIBRARY_PATH)/src/framing.c \
        $(OGG_LIBRARY_PATH)/src/bitwise.c \
    dynamic_flac.c \
    dynamic_fluidsynth.c \
    dynamic_mod.c \
    dynamic_modplug.c \
    dynamic_mp3.c \
    dynamic_ogg.c \
    effect_position.c \
    effects_internal.c \
    effect_stereoreverse.c \
    fluidsynth.c \
    load_aiff.c \
    load_flac.c \
    load_ogg.c \
    load_voc.c \
    mixer.c \
    music.c \
    music_cmd.c \
    music_flac.c \
    music_mad.c \
    music_mod.c \
    music_modplug.c \
    music_ogg.c \
    wavestream.c

HEADERS_INST := $(patsubst %,$(includedir)/%,$(HEADERS))
OBJECTS := $(patsubst %.c,%.o,$(SOURCES))
OBJECTS := $(patsubst %.cpp,%.o,$(OBJECTS))
OBJECTS := $(patsubst %.m,%.o,$(OBJECTS))

CFLAGS ?= -O2
CFLAGS += -I$(prefix)/include -I$(includedir) -I$(MODPLUG_LIBRARY_PATH)/src -I$(MODPLUG_LIBRARY_PATH)/src/libmodplug -I$(MIKMOD_LIBRARY_PATH)/include -I$(SMPEG_LIBRARY_PATH) -I$(VORBIS_LIBRARY_PATH) -I$(OGG_LIBRARY_PATH)/include -DWAV_MUSIC -DMODPLUG_MUSIC -DHAVE_SINF -DMOD_MUSIC -DMP3_MUSIC -DOGG_MUSIC -DOGG_USE_TREMOR -DHAVE_FCNTL_H -DHAVE_STDINT_H -DHAVE_SETENV -DNOCONTROLS

.PHONY: install

all: $(LIB)

$(includedir)/%.h: %.h
	-@if [ ! -d $(includedir)  ]; then mkdir -p $(includedir); fi
	$(QUIET_INSTALL)cp $< $@
	@chmod 0644 $@

$(libdir)/%.a: %.a
	-@if [ ! -d $(libdir)  ]; then mkdir -p $(libdir); fi
	$(QUIET_INSTALL)cp $< $@
	@chmod 0644 $@

install: $(HEADERS_INST) $(libdir)/$(LIB)

clean:
	$(RM) $(OBJECTS) $(LIB) .cflags

distclean: clean

$(LIB): $(OBJECTS)
	@$(RM) $@
	$(QUIET_AR)$(AR) rcu $@ $^
	$(QUIET_RANLIB)$(RANLIB) $@

%.o: %.c .cflags
	$(QUIET_CC)$(CC) $(CFLAGS) -o $@ -c $<

%.o: %.cpp .cflags
	$(QUIET_CXX)$(CXX) $(CFLAGS) -o $@ -c $<

%.o: %.m .cflags
	$(QUIET_CC)$(CC) $(CFLAGS) -o $@ -c $<

TRACK_CFLAGS = $(subst ','\'',$(CC) $(CFLAGS))

.cflags: .force-cflags
	@FLAGS='$(TRACK_CFLAGS)'; \
    if test x"$$FLAGS" != x"`cat .cflags 2>/dev/null`" ; then \
        echo "    * rebuilding sdl2-mixer: new build flags or prefix"; \
        echo "$$FLAGS" > .cflags; \
    fi

.PHONY: .force-cflags
