FROM ubuntu:trusty 
MAINTAINER Iando Rafid <iando.rafidimalalathevooz@heig-vd.ch>

RUN apt-get update && apt-get install -y curl && apt-get clean && rm -rf /var/lib/apt/lists

COPY scripts/testMode.sh /test.sh

RUN chmod +x /test.sh

CMD ["/test.sh"]
