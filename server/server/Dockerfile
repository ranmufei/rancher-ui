FROM rancher/server:v1.6.21

#ENV DEFAULT_CATTLE_API_UI_INDEX //releases.rancher.com/ui/1.6.45
# 使用自己制作的静态资源
ENV DEFAULT_CATTLE_API_UI_INDEX //github.com/ranmufei/rancher-ui/blob/master/rancherui.

RUN  curl -sL https:${DEFAULT_CATTLE_API_UI_INDEX}.tar.gz | tar xvzf - -C /usr/share/cattle/war --strip-components=1 

