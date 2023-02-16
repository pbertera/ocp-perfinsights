FROM registry.access.redhat.com/ubi8/python-38
USER 0
RUN yum install -y kmod
RUN mkdir /opt/perfinsights && \
    cd /opt/perfinsights && \
    curl https://download.microsoft.com/download/9/F/8/9F80419C-D60D-45F1-8A98-718855F25722/PerfInsights.tar.gz -O && \
    tar xzvf PerfInsights.tar.gz && chown -R 1001:0 /opt/perfinsights
USER 1001
COPY requirements.txt /tmp
RUN pip install -r /tmp/requirements.txt
ENTRYPOINT ["python", "/opt/perfinsights/perfinsights.py"]
