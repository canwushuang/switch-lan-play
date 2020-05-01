include $(TOPDIR)/rules.mk

PKG_RELEASE:=1
PKG_VERSION:=0.2.1
PKG_NAME:=switch-lan-play
PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)

include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/cmake.mk

CMAKE_BINARY_SUBDIR := build-openwrt

define Package/$(PKG_NAME)
	SECTION:=net
	CATEGORY:=Network
	SUBMENU:=Lan-play
	DEPENDS:=+libpcap +libpthread
	TITLE:=Switch Lan Play Client
endef

define Package/$(PKG_NAME)/description
  Make you and your friends play games like in a LAN.
endef

define Build/Prepare
	mkdir -p $(PKG_BUILD_DIR)
	$(CP) ./$(PKG_NAME)/* $(PKG_BUILD_DIR)/
endef

define Package/$(PKG_NAME)/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/build-openwrt/src/lan-play $(1)/usr/bin
endef

define Package/$(PKG_NAME)/postinst
endef

define Package/$(PKG_NAME)/prerm
endef

$(eval $(call BuildPackage,$(PKG_NAME)))
