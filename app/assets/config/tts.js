// $(function() {
//   $(document).on("users:loaded", "#users", function() {
// // Check for browser support
//   if (!"speechSynthesis" in window) {
//     $("#msg").html(
//       "Sorry. Your browser <strong>does not support</strong> speech synthesis."
//     );
//   } else {
//     $("#msg").html("👍Your browser supports speech synthesis.");
//   }

//   // Fetch the list of voices and populate the voice options.
//   function loadVoices() {
//     // Fetch the available voices in English US.
//     let voices = speechSynthesis.getVoices();
//     $("#voice-names").empty();
//     voices.forEach(function(voice, i) {
//       const $option = $("<option>");
//       $option.val(voice.name);
//       $option.text(voice.name + " (" + voice.lang + ")");
//       $option.prop("selected", voice.name === "Google US English");
//       $("#voice-names").append($option);
//     });
//   }

//   // Execute loadVoices.
//   loadVoices();

//   // Chrome loads voices asynchronously.
//   window.speechSynthesis.onvoiceschanged = function(e) {
//     loadVoices();
//   };

//   const uttr = new SpeechSynthesisUtterance();

//   // Set up an event listener for when the 'speak' button is clicked.
//   // Create a new utterance for the specified text and add it to the queue.
//   $("#speak-btn").click(function() {
//     uttr.text = $("#text").val();
//     uttr.rate = parseFloat($("#rate").val());
//     // If a voice has been selected, find the voice and set the
//     // utterance instance's voice attribute.
//     if ($("#voice-names").val()) {
//       uttr.voice = speechSynthesis
//         .getVoices()
//         .filter(voice => voice.name == $("#voice-names").val())[0];
//     }
//     speechSynthesis.speak(uttr);
//     uttr.onend = function() {
//       // hoge
//     };
//   });
//   $("#pause-btn").click(function() {
//     speechSynthesis.pause();
//   });
//   $("#resume-btn").click(function() {
//     speechSynthesis.resume();
//   });
//   $("#cancel-btn").click(function() {
//     speechSynthesis.cancel();
//   });

// });
// });