{shared{
  open Eliom_lib
  open Eliom_content
}}

module Eliom_video_app =
  Eliom_registration.App (
    struct
      let application_name = "eliom_video"
    end)

let main_service =
  Eliom_service.service ~path:[] ~get_params:Eliom_parameter.unit ()

let () =
  Eliom_video_app.register
    ~service:main_service
    (fun () () ->
      Lwt.return
        (Eliom_tools.F.html
           ~title:"eliom_video"
           ~css:[["css";"eliom_video.css"]]
           Html5.F.(body [
             h2 [pcdata "Welcome from Eliom's destillery!"];
           ])))
