function timer(time,path) {
 var obj       = this;
 var el        = document.getElementById(path);
 var x;
 
 this.time     = time;
 this.path     = path;
 
 this.display  = function() {
  el.innerHTML = this.time.substr(0, 2) + " : " +  this.time.substr(3, 2)+ " : " +  this.time.substr(6, 2) ;
 };
 
 this.stop  = function() {
  clearInterval(x);
  el.innerHTML = '00 : 00 : 00';
 };
   
 this.countdown  = function() {
  if (!(String(this.time).indexOf('-', 0) < 0 && String(this.days).indexOf('-', 0) < 0 ) ) {
    this.stop();
  }
  else {
   th = this.time.substr(0, 2);
   tm = this.time.substr(3, 2);
   ts = this.time.substr(6, 2);
  
   if (ts > 0) {
      ts = (ts < 11)? '0'+(ts - 1):(ts - 1);
   }
   else {
    if (tm > 0) {
     tm = (tm < 11)? '0'+(tm - 1):(tm - 1);
     ts = 59;
    }
    else {
     if (th > 0) {
      th = (th < 11)? '0'+(th - 1):(th - 1);
      tm = 59;
      ts = 59;
     }
     else{
       this.stop();
     }
    }
   }
   this.time = th + ":" + tm + ":" + ts;
   this.display();
  }
 }
 this.run  = function()  {
  x = setInterval(function(){obj.countdown()} , 1000);
 };
}