FROM ubuntu:18.04

RUN apt-get update
RUN apt-get -qq -y install git ruby-full build-essential  gcc ruby-dev libxslt-dev libxml2-dev zlib1g-dev
RUN echo '# Install Ruby Gems to ~/gems' >> ~/.bashrc \
    echo 'export GEM_HOME=$HOME/gems' >> ~/.bashrc \
    echo 'export PATH=$HOME/gems/bin:$PATH' >> ~/.bashrc
RUN /bin/bash -c "source ~/.bashrc"
RUN gem install jekyll bundler

COPY . /web
WORKDIR /web
RUN bundle install

CMD ["bundle", "exec", "jekyll", "serve" ] 
