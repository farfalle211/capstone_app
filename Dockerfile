FROM debian:bullseye-slim

ARG RUBY_VERSION=2.5.3
ENV APP_HOME=/app

# Add build args / runtime env for source-code integration
ARG DD_GIT_REPOSITORY_URL
ARG DD_GIT_COMMIT_SHA
ENV DD_TAGS="git.repository_url:${DD_GIT_REPOSITORY_URL},git.commit.sha:${DD_GIT_COMMIT_SHA}"

# Build & runtime deps for Ruby and gems
RUN apt-get update -y && apt-get install -y --no-install-recommends \
    build-essential git curl ca-certificates \
    libreadline-dev libssl-dev zlib1g-dev libffi-dev \
    libyaml-dev libxml2-dev libxslt1-dev libgdbm-dev \
    libncurses5-dev libpq-dev \
    xz-utils nodejs tzdata \
  && rm -rf /var/lib/apt/lists/*

# Install ruby-build to compile Ruby
RUN git clone https://github.com/rbenv/ruby-build.git /tmp/ruby-build \
 && /tmp/ruby-build/install.sh \
 && rm -rf /tmp/ruby-build

# Compile & install Ruby 2.5.3 system-wide
RUN ruby-build ${RUBY_VERSION} /usr/local \
 && ruby -v

# Match bundler to your lockfile
RUN gem install bundler -v 2.0.1

# App directory & dependency install
WORKDIR ${APP_HOME}
COPY Gemfile Gemfile.lock ./
RUN bundle install --jobs=4 --retry=3

# Add the rest of the app
COPY . .

EXPOSE 3000
CMD ["bundle", "exec", "puma", "-C", "config/puma.rb"]
