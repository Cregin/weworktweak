
THEOS_DEVICE_IP = 192.168.2.8
THEOS_DEVICE_PORT = 22
ARCHS = armv7 arm64
TARGET = iphone:latest:7.0
include $(THEOS)/makefiles/common.mk

TWEAK_NAME = weworktweak
weworktweak_FILES = Tweak.xm $(wildcard *.m)
weworktweak_FRAMEWORKS = CoreLocation,UIKit
include $(THEOS_MAKE_PATH)/tweak.mk

after-install::
	install.exec "killall -9 wework"
