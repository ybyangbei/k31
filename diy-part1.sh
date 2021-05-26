#!/bin/bash
#============================================================
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part2.sh的
# Description: OpenWrt DIY script part 2 (After Update feeds)
# Lisence: MIT
# Author: P3TERX
# Blog: https://p3terx.com
#============================================================

# Modify default IP
sed -i 's/192.168.1.1/192.168.6.1/g' package/base-files/files/bin/config_generate

# 取消Lean大登陆密码
#sed -i 's/^\(.*99999\)/#&/' package/lean/default-settings/files/zzz-default-settings

# 修正Lean大发行版软件源（注释掉原修改）
sed -i 's/^\(.*downloads.openwrt.org\)/#&/' package/lean/default-settings/files/zzz-default-settings
sed -i 's/^\(.*http:\)/#&/' package/lean/default-settings/files/zzz-default-settings
sed -i 's/^\(.*openwrt_luci\)/#&/' package/lean/default-settings/files/zzz-default-settings

# 修改Lean大发行版软件源（snapshots改成releases/19.07-SNAPSHOT）
#sed -i 's#snapshots#releases/19.07-SNAPSHOT#g' package/lean/default-settings/files/zzz-default-settings

# 删除lienol大luci缺失插件
rm -rf feeds/luci/applications/luci-app-https-dns-proxy
rm -rf feeds/telephony/net/freeswitch-stable
rm -rf feeds/telephony/net/freeswitch-stable-mod-bcg729

# 补全lienol大luci源smartdns缺失的插件核心
svn co https://github.com/Lienol/openwrt-packages/trunk/net/smartdns package/lienol/smartdns

# lienol大的passwall插件及依赖
svn co https://github.com/Lienol/openwrt-package/trunk/package/brook package/lienol/brook
svn co https://github.com/Lienol/openwrt-package/trunk/package/chinadns-ng package/lienol/chinadns-ng
svn co https://github.com/Lienol/openwrt-package/trunk/package/dns2socks package/lienol/dns2socks
svn co https://github.com/Lienol/openwrt-package/trunk/package/ipt2socks package/lienol/ipt2socks
svn co https://github.com/Lienol/openwrt-package/trunk/package/kcptun package/lienol/kcptun
svn co https://github.com/Lienol/openwrt-package/trunk/package/openssl1.1 package/lienol/openssl1.1
svn co https://github.com/Lienol/openwrt-package/trunk/package/pdnsd-alt package/lienol/pdnsd-alt
svn co https://github.com/Lienol/openwrt-package/trunk/package/shadowsocksr-libev package/lienol/shadowsocksr-libev
svn co https://github.com/Lienol/openwrt-package/trunk/package/simple-obfs package/lienol/simple-obfs
svn co https://github.com/Lienol/openwrt-package/trunk/package/tcping package/lienol/tcping
svn co https://github.com/Lienol/openwrt-package/trunk/package/trojan package/lienol/trojan
svn co https://github.com/Lienol/openwrt-package/trunk/package/v2ray-plugin package/lienol/v2ray-plugin
svn co https://github.com/Lienol/openwrt-package/trunk/package/v2ray package/lienol/v2ray
svn co https://github.com/kenzok8/openwrt-packages/trunk/luci-app-passwall package/lienol/luci-app-passwall
