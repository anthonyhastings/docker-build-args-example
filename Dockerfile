FROM node:8.11.3-alpine
MAINTAINER Anthony Hastings <ar.hastings@gmail.com>

# Specifying arguments to make use of during build.
ARG REACT_VERSION

# Create a directory to house our source files then navigate to it.
WORKDIR /src

# Supressing warnings about not having a package.json file.
RUN npm config set loglevel error

# Install test dependency using build arguments.
RUN npm install react@$REACT_VERSION

# Make the container confirm the installed version of the test dependency.
CMD echo -e "Outputting React Version:" && \
    npm ls react && \
    echo -e "\nSearching for REACT_VERSION environment variable (should NOT be present):" && \
    env | grep REACT_VERSION || echo 'Cannot find REACT_VERSION environment variable.' && \
    echo -e "\nOutputting Environment Variables for manual confirmation REACT_VERSION is not present:" && \
    env
