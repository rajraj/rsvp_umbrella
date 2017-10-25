import socket from "./socket";

let event_el = document.getElementById("event");
let event_id = event_el.dataset.id;
let channel = socket.channel("event:" + event_id, {});

channel.on("update_seats_available", payload => {
  console.log("Update", payload);
  let seats_available_el = document.getElementById("event_seats_available");
  seats_available_el.innerText = payload.quantity;
});

channel
  .join()
  .receive("ok", resp => {
    console.log(`Joined channel event: ${event_id}`, resp);
  })
  .receive("error", resp => {
    console.log("Unable to join channel", resp);
  });
