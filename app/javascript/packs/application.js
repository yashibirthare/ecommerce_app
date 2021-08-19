// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"

import "bootstrap"
import "../stylesheets/application"


Rails.start()
Turbolinks.start()
ActiveStorage.start()


// quantity-update
// $(document).on("keyup change", ".bases", function() {
//   totalSides();
// });

// function totalSides() {
//   var tmp = 0;
//   var total = 0;

//   $(".bases").each(function() {
//     tmp = parseInt($(this).val(), 10);
//     if (isNaN(tmp)) {
//       tmp = 0;
//     };
//     total = total + tmp;
//   });

//   $("#total-bases").html(total);
// };

