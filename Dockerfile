FROM alpine/git
COPY . /data
WORKDIR /data
RUN rm -rf themes/*
RUN git clone https://github.com/mackengm/silhouette-hugo.git themes/silhouette-hugo

##

FROM klakegg/hugo:0.59.1-ext-alpine
COPY --from=0 /data /data
WORKDIR /data
RUN hugo

##
#
#FROM mysocialobservations/docker-tdewolff-minify
#COPY --from=1 /data/public /data/public
#WORKDIR /data
#RUN minify --recursive --verbose \
#        --match=\.*.js$ \
#        --type=js \
#        --output public/ \
#        public/
#
#WORKDIR /data
#RUN minify --recursive --verbose \
#        --match=\.*.css$ \
#        --type=css \
#        --output public/ \
#        public/
#
#WORKDIR /data
#RUN minify --recursive --verbose \
#        --match=\.*.html$ \
#        --type=html \
#        --output public/ \
#        public/
#
##

FROM nginx:alpine
#COPY --from=2 /data/public /usr/share/nginx/html
COPY --from=1 /data/public /usr/share/nginx/html
#LABEL maintainer Mark A. McFate <mcfatem@grinnell.edu>
#COPY ./conf/default.conf /etc/nginx/conf.d/default.conf
#COPY --from=2 /data/public /var/www/site
#WORKDIR /var/www/site
