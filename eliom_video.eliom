{shared{
  open Eliom_lib
  open Eliom_content
}}

module Eliom_video_app =
  Eliom_registration.App (
    struct
      let application_name = "eliom_video"
    end)

let static s = Eliom_content.Html5.D.make_uri ~service:(Eliom_service.static_dir ()) s

let main_service =
  Eliom_service.service ~path:[] ~get_params:Eliom_parameter.unit ()

let () =
  Eliom_video_app.register
    ~service:main_service
    (fun () () ->
      let _ = {unit{
        let _ = Firebug.console##log (Js.string "hello") in
        let v = Dom_html.document##createElement(Js.string "video") in
        let _ = v##setAttribute(Js.string "src", Js.string "mov_bbb.ogg") in
        let _ = v##setAttribute(Js.string "width", Js.string "350") in
        Dom.appendChild Dom_html.document##body v
      }} in
      Lwt.return
        (Eliom_tools.D.html
           ~title:"eliom_video"
           ~css:[["css";"eliom_video.css"]]
           Html5.D.(body [
             h2 [pcdata "Welcome from Eliom's destillery!"];
           ])))
