/*
Created by: Daniel Katz (http://www.danielkatz.net/)
Version: 1.0
Created on: 01/11/2010
Last updated on: 01/11/2010
For: maasrot.org

(c) All rights reserved
*/
//<script src="http://www.anglodeals.co.il/js/anglodeals.js" type="text/javascript"></script>
//<script type="text/javascript">
// anglodeals.applyCertificate("janglo");
//</script>


(function() {
var anglodeals = window.anglodeals = anglodeals ? anglodeals : {};

    var certificateUrl = "http://www.anglodeals.co.il/Frames/janglo.aspx";
    var certificateHeight = 62;
    var certificateWidth = 552;

    anglodeals.applyCertificate = function(token) {
        document.write("<iframe src='" + certificateUrl + "?token=" + escape(token)
            + "' height='" + certificateHeight
            + "' width='" + certificateWidth
            + "' scrolling='no' frameborder='0'></iframe>");
    }
})();

jQuery(function ($) {
    $('#copy_to_clipboard').click(function (e) {
        e.preventDefault();
    }).zclip({
        path: 'http://www.steamdev.com/zclip/js/ZeroClipboard.swf',
        copy: function () {
            return $(this).data('clipboard');
        }
    });
});