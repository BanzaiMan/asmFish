FROM bitnami/minideb:stretch

LABEL maintainer "Double Beep <doublebeep7@gmail.com>"

ENV SOURCE_REPO https://github.com/double-beep/asmFish
ENV VERSION docker
ADD ${SOURCE_REPO}/archive/${VERSION}.tar.gz /root
WORKDIR /root

RUN if [ ! -d asmFish-${VERSION} ]; then tar xvzf *.tar.gz; fi \
  && cd asmFish-${VERSION} \
  && dpkg --add-architecture i386 \
  && install_packages libgcc1:i386 \
  && ./fasmg "x86/fish.asm" "asmfish" -e 100 -i "VERSION_OS='L'" -i "VERSION_POST = 'popcnt'" \
  && ./fasmg "arm\fish.arm" "armFish" -e 100 -i "VERSION_OS='L'" -i "VERSION_POST = 'v8'" \
  && cp asmfish /usr/local/bin \
  && chmod +x /usr/local/bin/asmfish \
  && cd .. && rm -rf asmFish-${VERSION} *.tar.gz
  && docker run --privileged -it --rm doublebeep/asmfish:armFish bench

ENTRYPOINT [ "/usr/local/bin/asmfish" ]
