// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import 'bootstrap'
import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"

Rails.start()
Turbolinks.start()
ActiveStorage.start()

window.setTimeout(function() {
  $("#flash-message").fadeTo(1000, 0).fadeOut(1000, function(){
    $(this).attr('style', '');
    $(this).find('.container').html("");
  });
}, 5000);