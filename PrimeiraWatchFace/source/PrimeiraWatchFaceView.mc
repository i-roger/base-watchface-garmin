using Toybox.Time.Gregorian as Calendar;
import Toybox.Graphics;
import Toybox.Lang;
import Toybox.System;
import Toybox.WatchUi;

class PrimeiraWatchFaceView extends WatchUi.WatchFace {

    function initialize() {
        WatchFace.initialize();
    }

    // Load your resources here
    function onLayout(dc as Dc) as Void {
        setLayout(Rez.Layouts.WatchFace(dc));
    }

    // Called when this View is brought to the foreground. Restore
    // the state of this View and prepare it to be shown. This includes
    // loading resources into memory.
    function onShow() as Void {
    }

    // Update the view
    function onUpdate(dc as Dc) as Void {
        // Get and show the current time
        var clockTime = System.getClockTime();
        var timeString = Lang.format("$1$:$2$", [clockTime.hour, clockTime.min.format("%02d")]);
        updateDisplayObject("TimeLabel", timeString);

        //Get and show the current battery percentage
        var pwr = System.getSystemStats().battery;
        var batStr = Lang.format( "$1$%", [ pwr.format( "%2d" ) ] );
        updateDisplayObject("BatteryPercentageLabel", batStr);

        //Get and show the steps data
        // var stepCountString = ActivityMonitor.getInfo().steps.toString();
        // updateDisplayObject("StepsLabel", stepCountString);

        //Get and show the date
        var now = Time.now();
        var info = Calendar.info(now, Time.FORMAT_LONG);
        var dateString = Lang.format("$1$ $2$ $3$", [info.day_of_week, info.day, info.month]);
        updateDisplayObject("DateLabel", dateString);
        // Call the parent onUpdate function to redraw the layout
        View.onUpdate(dc);
    }

    // Called when this View is removed from the screen. Save the
    // state of this View here. This includes freeing resources from
    // memory.
    function onHide() as Void {
    }

    // The user has just looked at their watch. Timers and animations may be started here.
    function onExitSleep() as Void {
    }

    // Terminate any active timers and prepare for slow updates.
    function onEnterSleep() as Void {
    }

    //Update the display object text
function updateDisplayObject(updateObject, updateText){
  var _viewObject = View.findDrawableById(updateObject) as Text;
  _viewObject.setText(updateText);
}

}
