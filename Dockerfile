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
  && ./fasmg "arm\fish.arm" "armFishL_v8" -e 1000 -i "VERSION_OS='L'" -i "PEDANTIC = 1" -i "VERSION_POST = 'v8'" \
  && ./fasmg "x86\fish.asm" "asmFishL_popcnt" -e 1000 -i "VERSION_OS='L'" -i "PEDANTIC = 1" -i "VERSION_POST = 'popcnt'" \
  && ./fasmg "x86\fish.asm" "asmFishL_bmi1" -e 100 -i "VERSION_OS='L'" -i "PEDANTIC = 1" -i "VERSION_POST = 'bmi1'" \
  && ./fasmg "x86\fish.asm" "asmFishL_bmi2" -e 100 -i "VERSION_OS='L'" -i "PEDANTIC = 1" -i "VERSION_POST = 'bmi2'" \
  && cp asmfish /usr/local/bin \
  && chmod +x /usr/local/bin/asmfish \
  && cd .. && rm -rf asmFish-${VERSION} *.tar.gz


ENTRYPOINT [ "/usr/local/bin/asmfish" ]
