#!/bin/sh
GOOGLE_CHROME_VERSION="$(google-chrome --version | cut -f 3 -d ' ')"

# https://www.chromium.org/developers/version-numbers/
GOOGLE_CHROME_VERSION_MAJOR=$(echo "${GOOGLE_CHROME_VERSION}" | cut -f 1 -d'.')
echo "GOOGLE_CHROME_VERSION_MAJOR => [${GOOGLE_CHROME_VERSION_MAJOR}]"

# https://chromedriver.chromium.org/downloads
GOOGLE_CHROME_DRIVER_LINE=$(curl https://chromedriver.chromium.org/downloads | grep "If you are using Chrome version ${GOOGLE_CHROME_VERSION_MAJOR}," | head -1)
GOOGLE_CHROME_DRIVER_VERSION=$(echo "${GOOGLE_CHROME_DRIVER_LINE}" | rev | cut -f 1 -d' ' | rev)

echo "GOOGLE_CHROME_DRIVER_VERSION => [${GOOGLE_CHROME_DRIVER_VERSION}]"
wget https://chromedriver.storage.googleapis.com/${GOOGLE_CHROME_DRIVER_VERSION}/chromedriver_linux64.zip
sudo unzip chromedriver_linux64.zip
sudo rm chromedriver_linux64.zip
sudo chmod a+x chromedriver
sudo mv chromedriver /usr/local/bin 