#!/bin/bash

# To prevent error messages from composer, make empty dirs.
mkdir -p CodeSniffer/Standards/MEQP1/Sniffs
mkdir -p CodeSniffer/Standards/MEQP2/Sniffs

# Update dependencies.
composer update

# Copy magento sniffs.
cp -R vendor/magento/marketplace-eqp/AbstractSniffs CodeSniffer/Standards/
cp -R vendor/magento/marketplace-eqp/Utils CodeSniffer/Standards/
cp -R vendor/magento/marketplace-eqp/MEQP1 CodeSniffer/Standards/
cp -R vendor/magento/marketplace-eqp/MEQP2 CodeSniffer/Standards/

# Build phar.
php vendor/bin/phar-composer build && mv php_codesniffer.phar phpcs.phar
