var window = Ti.UI.createWindow({
    backgroundColor: 'white',
    layout: 'vertical'
});

var Flurry = require('ti.flurry');

Flurry.debugLogEnabled = true;
Flurry.eventLoggingEnabled = true;

Flurry.initialize('ND1292FY4ULRQF5PU4ZQ' /*<-- PUT YOUR OWN API KEY HERE!*/);

Flurry.age = 24;
Flurry.userID = 'John Adams';
Flurry.gender = 'm';

/**
 * Log a very simple click event.
 */
var logEvent = Ti.UI.createButton({
    title: 'Fire Event',
    top: '60dp', width: '200dp', height: Ti.UI.SIZE
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
    top: '60dp', width: '200dp', height: Ti.UI.SIZE
});
startTimedEvent.addEventListener('click', function() {
    Flurry.logTimedEvent('timedClick');
});
window.add(startTimedEvent);
var endTimedEvent = Ti.UI.createButton({
    title: 'End Timed Event',
    top: '60dp', width: '200dp', height: Ti.UI.SIZE
});
endTimedEvent.addEventListener('click', function() {
    Flurry.endTimedEvent('timedClick');
});
window.add(endTimedEvent);

window.open();
