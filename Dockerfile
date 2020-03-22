FROM archlinux

RUN pacman -Syu --noconfirm

RUN pacman -S --noconfirm cmake ninja git binutils gcc python

RUN mkdir -p /tmp/src ; cd /tmp/src ; curl https://root.cern/download/root_v6.20.02.source.tar.gz -o src.tar.gz ; tar -xzf src.tar.gz

RUN mkdir -p /tmp/build ; cd /tmp/build ; cmake /tmp/src/root-6.20.02 -G Ninja -DCMAKE_BUILD_TYPE=MinSizeRel -DCMAKE_CXX_STANDARD="17" -DCMAKE_EXPORT_COMPILE_COMMANDS="YES" -DCMAKE_INSTALL_PREFIX="/dev/null" -DCMAKE_RULE_MESSAGES="NO" -Dminimal="ON" -DCMAKE_BUILD_WITH_INSTALL_RPATH=ON

WORKDIR /tmp/build

CMD ["ninja"]


