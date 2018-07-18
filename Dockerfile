FROM bitnami/minideb:stretch

LABEL maintainer "Kayvan Sylvan <kayvansylvan@gmail.com>"

ENV SOURCE_REPO https://github.com/double-beep/asmFish
ENV VERSION docker

ADD ${SOURCE_REPO}/archive/${VERSION}.tar.gz /root
WORKDIR /root

RUN if [ ! -d asmFish-${VERSION} ]; then tar xvzf *.tar.gz; fi \
  && cd asmFish-${VERSION} \
  && dpkg --add-architecture i386 \
  && install_packages libgcc1:i386 \
  && ./fasmg "arm\fish.arm" "armFish" -e 100 -i "VERSION_OS='L'" -i "VERSION_POST = 'v8'" \
  && ./fasmg "x86\fish.asm" "asmFishL_pop" -e 100 -i "VERSION_OS='L'" -i "VERSION_POST = 'popcnt'" \
  && ./fasmg "x86\fish.asm" "asmFishL_b1" -e 100 -i "VERSION_OS='L'" -i "VERSION_POST = 'bmi1'" \
  && ./fasmg "x86\fish.asm" "asmFishL_b2" -e 100 -i "VERSION_OS='L'" -i "VERSION_POST = 'bmi2'" \
  && ./armFish bench


ENTRYPOINT [ "/usr/local/bin/asmfish" ]
