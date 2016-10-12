FROM aibar/glibc

ENV JAVA_HOME=/jvm

RUN wget http://dl.bintray.com/aibar/generic/jdk-8.102.tar.gz \
         -O jdk.tar.gz && \

    tar xzfv jdk.tar.gz && \
    rm jdk.tar.gz && \

    mv jdk1.8.0_102 jdk && \

    mkdir -pv jvm/bin \
              jvm/lib/amd64/jli && \

    mkdir -pv jvm/jre/bin \
              jvm/jre/lib/ext \
              jvm/jre/lib/security \
              jvm/jre/lib/amd64/jli \
              jvm/jre/lib/amd64/server && \

    cp jdk/jre/bin/java jvm/jre/bin && \

    cp jdk/jre/lib/rt.jar \
       jdk/jre/lib/currency.data \
       jdk/jre/lib/tzdb.dat \
       jdk/jre/lib/jsse.jar \
       jdk/jre/lib/jce.jar \
       jdk/jre/lib/resources.jar jvm/jre/lib && \

    cp jdk/jre/lib/amd64/jvm.cfg \
       jdk/jre/lib/amd64/libjava.so \
       jdk/jre/lib/amd64/libverify.so \
       jdk/jre/lib/amd64/libzip.so \
       jdk/jre/lib/amd64/libinstrument.so \
       jdk/jre/lib/amd64/libmanagement.so \
       jdk/jre/lib/amd64/libnet.so \
       jdk/jre/lib/amd64/libnio.so \
       jdk/jre/lib/amd64/libresource.so jvm/jre/lib/amd64 && \

    cp jdk/jre/lib/amd64/server/libjvm.so jvm/jre/lib/amd64/server && \

    cp jdk/jre/lib/amd64/jli/libjli.so jvm/jre/lib/amd64/jli && \

    cp jdk/jre/lib/security/US_export_policy.jar \
       jdk/jre/lib/security/blacklisted.certs \
       jdk/jre/lib/security/cacerts \
       jdk/jre/lib/security/java.policy \
       jdk/jre/lib/security/java.security \
       jdk/jre/lib/security/local_policy.jar jvm/jre/lib/security && \

    cp jdk/jre/lib/ext/sunjce_provider.jar \
       jdk/jre/lib/ext/sunec.jar jvm/jre/lib/ext && \

    cp jdk/bin/java \
       jdk/bin/javac jvm/bin && \

    cp jdk/lib/tools.jar jvm/lib && \

    cp jdk/lib/amd64/jli/libjli.so jvm/lib/amd64/jli && \

    ln -s /jvm/bin/java /bin/java && \
    ln -s /jvm/bin/javac /bin/javac && \

    rm -rf jdk