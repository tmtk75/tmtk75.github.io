var _gaq = _gaq || [];
var pluginUrl = '//www.google-analytics.com/plugins/ga/inpage_linkid.js';
_gaq.push(['_require', 'inpage_linkid', pluginUrl]);
_gaq.push(['_setAccount', 'UA-27755043-2']);
_gaq.push(['_trackPageview']);
var now = new Date;
function zp(n) {return n/10 >= 1 ? n : "0" + n}
var val = now.getFullYear() + "-" + zp(now.getMonth() + 1) + "-" + (Math.floor(now.getDate()/10) + 1)
_gaq.push(['_setCustomVar', 2, 'cohort', val, 1]);
(function() {
  var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
  ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
  var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
})();
