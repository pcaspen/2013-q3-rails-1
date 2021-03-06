App::Application.routes.draw do
 
  get "/"                          => "main#go_to_login"

  get "/login"                     => "main#login_get"

  post "/login"                    => "main#login_post"

  get "/reservations/:member_id"   => "main#reservations_get"

  post "/reservations/:member_id"  => "main#reservations_post"

end
