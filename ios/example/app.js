var window = Ti.UI.createWindow({
    backgroundColor: 'white'
});

var Flurry = require('ti.flurry');

Flurry.debugLogEnabled = true;
Flurry.eventLoggingEnabled = true;

Flurry.initialize('ND1292FY4ULRQF5PU4ZQ' /*<-- PUT YOUR OWN API KEY HERE!*/);

Flurry.reportOnClose = true;
Flurry.sessionReportsOnPauseEnabled = true;
Flurry.secureTransportEnabled = false;

Flurry.age = 24;
Flurry.userID = 'John Adams';
Flurry.gender = 'm';

/**
 * Log a very simple click event.
 */
var logEvent = Ti.UI.createButton({
    title: 'Fire Event',
    top: 60, width: 200, height: 40
});
var logEventCount = 0;
logEvent.addEventListener('click', function() {
    Flurry.logEvent('click', { clickCount: ++logEventCount });
});
window.add(logEvent);

/**
 * Time based events.
 */
var startTimedEvent = Ti.UI.createButton({
    title: 'Start Timed Event',
    top: 120, width: 200, height: 40
});
startTimedEvent.addEventListener('click', function() {
    Flurry.logTimedEvent('timedClick');
});
window.add(startTimedEvent);
var endTimedEvent = Ti.UI.createButton({
    title: 'End Timed Event',
    top: 180, width: 200, height: 40
});
endTimedEvent.addEventListener('click', function() {
    Flurry.endTimedEvent('timedClick');
});
window.add(endTimedEvent);

window.open();