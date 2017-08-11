FROM ruby

# install compass (+sass)
RUN gem update --system && gem install compass && gem install foundation && gem install sass

COPY entrypoint.sh /docker-entrypoint.sh

# Windows permission issue.
RUN chmod +x /docker-entrypoint.sh

ENTRYPOINT ["/docker-entrypoint.sh"]

RUN adduser frontend
USER frontend
