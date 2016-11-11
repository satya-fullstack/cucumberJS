const Mink = require('cucumber-mink');

// Selenium + Firefox
const parameters = {
    driver: {
        logLevel: 'silent',
        desiredCapabilities: {
            browserName: 'chrome',
        },
        port: 4444,
    },
};

module.exports = function () {
    Mink.init(this, parameters);
};