#
# Copyright © 2022 Thiago Moreira (tmoreira2020@gmail.com)
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

FROM nginx:1.25.3

ARG TARGETARCH

ADD nginx.conf /etc/nginx/nginx.conf

COPY dockerize-linux-$TARGETARCH-v0.6.1.tar.gz /tmp/dockerize.tar.gz

RUN tar -C /usr/local/bin -xzvf /tmp/dockerize.tar.gz \
    && rm /tmp/dockerize.tar.gz \
    && rm -rf /tmp/* /var/cache/apk/* 

ENTRYPOINT ["nginx", "-g", "daemon off;"]