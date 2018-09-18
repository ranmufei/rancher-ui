FROM rancher/server:v1.6.21

#ENV DEFAULT_CATTLE_API_UI_INDEX //releases.rancher.com/ui/1.6.45
# 使用自己制作的静态资源
ENV DEFAULT_CATTLE_API_UI_INDEX https://raw.githubusercontent.com/ranmufei/rancher-ui/master/1.6.21/ui918.tar.gz

RUN  curl -sL ${DEFAULT_CATTLE_API_UI_INDEX} | tar xvzf - -C /usr/share/cattle/war --strip-components=1