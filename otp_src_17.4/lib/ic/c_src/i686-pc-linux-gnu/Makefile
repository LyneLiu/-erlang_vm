#
# %CopyrightBegin%
# 
# Copyright Ericsson AB 1998-2012. All Rights Reserved.
# 
# The contents of this file are subject to the Erlang Public License,
# Version 1.1, (the "License"); you may not use this file except in
# compliance with the License. You should have received a copy of the
# Erlang Public License along with this software. If not, it can be
# retrieved online at http://www.erlang.org/.
# 
# Software distributed under the License is distributed on an "AS IS"
# basis, WITHOUT WARRANTY OF ANY KIND, either express or implied. See
# the License for the specific language governing rights and limitations
# under the License.
# 
# %CopyrightEnd%
#
#
include $(ERL_TOP)/make/target.mk
include $(ERL_TOP)/make/$(TARGET)/otp.mk

CC = gcc
LIBS = -lutil -ldl -lm  

LIBDIR = ../priv/lib/$(TARGET)
OBJDIR = ../priv/obj/$(TARGET)
INCDIR = ../include
ERL_INTERFACE_FLAGS = \
	-I$(ERL_TOP)/lib/erl_interface/include \
	-I$(ERL_TOP)/lib/erl_interface/src

# ----------------------------------------------------
# Application version
# ----------------------------------------------------
include ../vsn.mk
VSN=$(IC_VSN)

# ----------------------------------------------------
# Release directory specification
# ----------------------------------------------------
RELSYSDIR = $(RELEASE_PATH)/lib/ic-$(VSN)

# ----------------------------------------------------
# File Specs
# ----------------------------------------------------

IDL_FILES = \
        $(INCDIR)/erlang.idl

ifeq ($(findstring win32,$(TARGET)),win32)
USING_MINGW=no
ifeq ($(USING_MINGW),yes)
AR_OUT = rcv
CC_FLAGS =
LIBRARY = $(LIBDIR)/libic.a
SKIP_BUILDING_BINARIES := false
else
LIBRARY = $(LIBDIR)/ic.lib
AR_OUT = -out:
CC_FLAGS = -MT
endif
ifeq ($(HOST_OS),)
HOST_OS := $(shell $(ERL_TOP)/erts/autoconf/config.guess)
endif
ifeq ($(findstring solaris,$(HOST_OS)),solaris)
SKIP_BUILDING_BINARIES := true
endif
else
ifeq ($(V),0)
AR_OUT = rc
else
AR_OUT = rcv
endif
CC_FLAGS = -g -O2 -I/root/Public/otp_src_17.4/erts/i686-pc-linux-gnu  -D_LARGEFILE_SOURCE -D_FILE_OFFSET_BITS=64 -fno-tree-copyrename  -D_GNU_SOURCE -fPIC
LIBRARY = $(LIBDIR)/libic.a
SKIP_BUILDING_BINARIES := false
endif

C_FILES = \
	ic.c \
	ic_tmo.c \
	oe_ei_encode_version.c      \
	oe_ei_encode_long.c         \
	oe_ei_encode_ulong.c        \
	oe_ei_encode_double.c       \
	oe_ei_encode_char.c         \
	oe_ei_encode_string.c       \
	oe_ei_encode_atom.c         \
	oe_ei_encode_pid.c          \
	oe_ei_encode_port.c         \
	oe_ei_encode_ref.c          \
	oe_ei_encode_term.c         \
	oe_ei_encode_tuple_header.c \
	oe_ei_encode_list_header.c  \
	oe_ei_encode_longlong.c     \
	oe_ei_encode_ulonglong.c    \
	oe_ei_encode_wchar.c        \
	oe_ei_encode_wstring.c      \
	oe_ei_decode_longlong.c     \
	oe_ei_decode_ulonglong.c    \
	oe_ei_decode_wchar.c        \
	oe_ei_decode_wstring.c      \
	oe_ei_code_erlang_binary.c  

H_FILES = $(INCDIR)/ic.h

OBJ_FILES= $(C_FILES:%.c=$(OBJDIR)/%.o) 

ALL_CFLAGS = -Werror=return-type  -g -O2 -I/root/Public/otp_src_17.4/erts/i686-pc-linux-gnu  -D_LARGEFILE_SOURCE -D_FILE_OFFSET_BITS=64 -fno-tree-copyrename  -D_GNU_SOURCE -DHAVE_CONFIG_H -I$(INCDIR) $(ERL_INTERFACE_FLAGS) $(CFLAGS) 

# ----------------------------------------------------
# Targets
# ----------------------------------------------------

ifeq ($(SKIP_BUILDING_BINARIES), true)
debug opt:
else
debug opt: $(LIBRARY)
endif

clean:
	rm -f $(LIBRARY) $(OBJ_FILES) 
	rm -f core *~

docs:

# ----------------------------------------------------
# Special Build Targets
# ----------------------------------------------------

_create_dirs := $(shell mkdir -p $(OBJDIR) $(LIBDIR))

$(LIBRARY): $(OBJ_FILES) 
	-$(V_AR) $(AR_OUT) $@ $(OBJ_FILES)
	-$(V_RANLIB) $@

$(OBJDIR)/%.o: %.c
	$(V_CC) $(CC_FLAGS) -c -o $@ $(ALL_CFLAGS) $<

# ----------------------------------------------------
# Release Target
# ---------------------------------------------------- 
include $(ERL_TOP)/make/otp_release_targets.mk

release_spec: opt
	$(INSTALL_DIR) "$(RELSYSDIR)/c_src"
	$(INSTALL_DIR) "$(RELSYSDIR)/include"
	$(INSTALL_DIR) "$(RELSYSDIR)/priv/lib"
	$(INSTALL_DIR) "$(RELEASE_PATH)/usr/include"
	$(INSTALL_DIR) "$(RELEASE_PATH)/usr/lib"
	$(INSTALL_DATA) ic.c ic_tmo.c "$(RELSYSDIR)/c_src"
	$(INSTALL_DATA) $(IDL_FILES) $(H_FILES) "$(RELSYSDIR)/include"
	$(INSTALL_DATA) $(LIBRARY) "$(RELSYSDIR)/priv/lib"
	$(INSTALL_DATA) $(IDL_FILES) $(H_FILES) "$(RELEASE_PATH)/usr/include"
	$(INSTALL_DATA) $(LIBRARY) "$(RELEASE_PATH)/usr/lib"

release_docs_spec:






