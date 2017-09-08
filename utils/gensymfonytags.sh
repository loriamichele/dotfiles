rm tags
ctags -R \
    --exclude=build \
    --exclude=.git \
    --exclude=vendor/phpunit \
    --exclude=node_modules \
    --exclude=docker \
    --exclude=assets \
    --exclude=web/coverage
