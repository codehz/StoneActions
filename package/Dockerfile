FROM codehz/stonebuilder:latest

LABEL "name"="stone-packager"
LABEL "maintainer"="CodeHz <CodeHz@outlook.com>"
LABEL "version"="0.0.1"

LABEL "com.github.actions.name"="StoneServer Packager"
LABEL "com.github.actions.description"="Package StoneServer"
LABEL "com.github.actions.icon"="package"
LABEL "com.github.actions.color"="green"

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]

