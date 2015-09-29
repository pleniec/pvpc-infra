FROM ruby:2.2.2

ENV RAILS_ENV vagrant

COPY . /opt/core
WORKDIR /opt/core
RUN bundle install

EXPOSE 3000

CMD ["rails", "s", "-b", "0.0.0.0"]
