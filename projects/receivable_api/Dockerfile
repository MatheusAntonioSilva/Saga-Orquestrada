FROM ruby:3.1.2

ENV LC_ALL C.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US.UTF-8

# Dependencies
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev net-tools vim-tiny apt-transport-https vim

# Yarn
RUN curl -sL https://deb.nodesource.com/setup_14.x | bash \
 && apt-get update && apt-get install -y nodejs && rm -rf /var/lib/apt/lists/* \
 && curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - \
 && echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list \
 && apt-get update && apt-get install -y yarn && rm -rf /var/lib/apt/lists/*

# Heroku CLI
RUN curl https://cli-assets.heroku.com/install.sh | sh

# Add same User as local machine
RUN useradd -m -u 1000 -g staff docker && echo "root:1234" | chpasswd

# Copying app into container
RUN mkdir -p /var/www/app
ADD . /var/www/app
WORKDIR /var/www/app

# Removing some unecessary folders
RUN rm -rf /var/www/app/tmp/node_modules
RUN rm -rf /var/www/app/tmp/cache

# Permissions
# RUN chown docker:staff /var && \
#     chown docker:staff /var/www -R

# Use same User as local machine
# USER docker:staff

# Setup application
RUN gem install bundler -v 2.2.24
RUN bundle install --jobs 10 --retry 10
RUN yarn install
