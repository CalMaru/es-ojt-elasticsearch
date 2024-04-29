FROM docker.elastic.co/elasticsearch/elasticsearch:7.16.3

# nori 형태소 분석기 플러그인 설치
RUN elasticsearch-plugin install analysis-nori

# 자바카페 플러그인 설치
COPY javacafe-analyzer-7.16.3.zip /plugins/
RUN elasticsearch-plugin install file:///plugins/javacafe-analyzer-7.16.3.zip
