import hello from './hello';
import webpacker from './webpacker';

window.onload = function() {
  document.getElementsByTagName("H1")[0].innerText = hello() + "#" + webpacker();
}